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

- (NSArray*)selectAll{
    
    NSArray* questions = [NSArray new];
    appDelegate = [[UIApplication sharedApplication] delegate];
    NSFetchRequest* fetchRequest = [NSFetchRequest new];
    context = appDelegate.managedObjectContext;
    
    fetchRequest.entity = [NSEntityDescription entityForName:@"Question" inManagedObjectContext:context];
    
    questions = [context executeFetchRequest:fetchRequest error:nil];
    
    return questions;

}

-(NSArray*)slectIdQcmFk:(Qcm*) qcm:(NSManagedObject*)idQcm{
    
    appDelegate = [[UIApplication sharedApplication]delegate];
    context = appDelegate.managedObjectContext;
    NSFetchRequest* fetchRequest = [NSFetchRequest new];
    fetchRequest.entity = [NSEntityDescription entityForName:@"Question" inManagedObjectContext:context];
    
    /*NSFetchRequest* requestId = [NSFetchRequest new];
    [requestId setEntity:[NSEntityDescription entityForName:DAOQcm.ENTITY_QCM inManagedObjectContext:context]];
    [requestId setResultType:NSManagedObjectIDResultType];
    NSArray* resID = [NSArray new];
    resID = [context executeFetchRequest:requestId error:nil];*/
    
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"qcmId=%@",idQcm];
    [fetchRequest setPredicate:predicate];
    NSArray *result = [context executeFetchRequest:fetchRequest error:nil];
    
    return result;
    
}

- (Question *)selectById:(NSManagedObject *)question{
    
    appDelegate = [[UIApplication sharedApplication]delegate];
    context = appDelegate.managedObjectContext;
    NSManagedObject* manageObject = [context objectWithID:question.objectID];
    
    return manageObject;
}

- (void) update:(NSManagedObject *)managedObject withQuestion:(Question *)question{
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* context = appDelegate.managedObjectContext;
    
    //Set Column in database from entity Question
    [managedObject setValue:question.textQuestion forKey:@"textQuestion"];
    
    [appDelegate saveContext];

}

- (void)remove:(NSManagedObject *)managedObject{
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    context = appDelegate.managedObjectContext;
    
    [context deleteObject:managedObject];

}

@end
