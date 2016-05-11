//
//  DAOQuestion.m
//  QCMapp
//
//  Created by etudiant on 07/03/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import "DAOQuestion.h"
#import "Qcm.h"
#import "DAOQcm.h"

@implementation DAOQuestion
@synthesize appDelegate;
@synthesize context;

//Use to insert Question in database
- (void)insert:(Question *)question{
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    context = appDelegate.managedObjectContext;
    
    NSManagedObject* managedObject = [NSEntityDescription insertNewObjectForEntityForName:@"Question"
        inManagedObjectContext:context];
    
    //Set Column in database from entity Question
    [managedObject setValue:question.textQuestion forKey:@"textQuestion"];
    //int idQcmFk = [question.idQcm intValue];
    [managedObject setValue:question.idQcm forKey:@"qcmId"];
    
    //Insert in database
    [appDelegate saveContext];
}

//Use to selected all item in table Question
- (NSArray*)selectAll{
    
    NSArray* questions = [NSArray new];
    appDelegate = [[UIApplication sharedApplication] delegate];
    NSFetchRequest* fetchRequest = [NSFetchRequest new];
    context = appDelegate.managedObjectContext;
    
    fetchRequest.entity = [NSEntityDescription entityForName:@"Question" inManagedObjectContext:context];
    
    questions = [context executeFetchRequest:fetchRequest error:nil];
    
    return questions;

}

//Select foreign key from Qcm in database
-(NSArray*)slectIdQcmFk:(Qcm*) qcm:(NSManagedObject*)idQcm{
    
    appDelegate = [[UIApplication sharedApplication]delegate];
    context = appDelegate.managedObjectContext;
    NSFetchRequest* fetchRequest = [NSFetchRequest new];
    fetchRequest.entity = [NSEntityDescription entityForName:@"Question" inManagedObjectContext:context];
    
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"qcmId=%@",idQcm];
    [fetchRequest setPredicate:predicate];
    NSArray *result = [context executeFetchRequest:fetchRequest error:nil];
    
    return result;
    
}

//Use to selected one item in table Question
- (Question *)selectById:(NSManagedObject *)question{
    
    appDelegate = [[UIApplication sharedApplication]delegate];
    context = appDelegate.managedObjectContext;
    NSManagedObject* manageObject = [context objectWithID:question.objectID];
    
    return manageObject;
}

//Use to update in database
- (void) update:(NSManagedObject *)managedObject withQuestion:(Question *)question{
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* context = appDelegate.managedObjectContext;
    
    //Set Column in database from entity Question
    [managedObject setValue:question.textQuestion forKey:@"textQuestion"];
    
    [appDelegate saveContext];

}

//Use to remove in database
- (void)remove:(NSManagedObject *)managedObject{
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    context = appDelegate.managedObjectContext;
    
    [context deleteObject:managedObject];

}

@end
