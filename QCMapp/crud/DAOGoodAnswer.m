//
//  DAOGoodAnswer.m
//  QCMapp
//
//  Created by etudiant on 07/03/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import "DAOGoodAnswer.h"
#import "Question.h"

@implementation DAOGoodAnswer
@synthesize appDelegate;
@synthesize context;

//Use to insert Qcm in database
- (void)insert:(GoodAnswer *)goodAnswer{
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    context = appDelegate.managedObjectContext;
    
    NSManagedObject* managedObject = [NSEntityDescription insertNewObjectForEntityForName:@"GoodAnswer"
        inManagedObjectContext:context];
    
    //Set Column in database from entity GoodAnswer
    [managedObject setValue:goodAnswer.answerQuestion forKey:@"answerQuestion"];
    [managedObject setValue:goodAnswer.idQuestion forKey:@"questionId"];
    
    //Insert in database
    [appDelegate saveContext];
}

//Use to selected all item in table Qcm
- (NSArray*)selectAll{
    
    NSArray* goodAnswers = [NSArray new];
    appDelegate = [[UIApplication sharedApplication] delegate];
    NSFetchRequest* fetchRequest = [NSFetchRequest new];
    context = appDelegate.managedObjectContext;
    
    fetchRequest.entity = [NSEntityDescription entityForName:@"GoodAnswer"
                                      inManagedObjectContext:context];
    
    goodAnswers = [context executeFetchRequest:fetchRequest error:nil];
    
    return goodAnswers;

}

//Select foreign key from GoodAnswer in database
-(NSArray*)slectIdQuestionFk:(GoodAnswer*) goodAnswer:(NSManagedObject*)idQuestion{
    
    appDelegate = [[UIApplication sharedApplication]delegate];
    context = appDelegate.managedObjectContext;
    NSFetchRequest* fetchRequest = [NSFetchRequest new];
    fetchRequest.entity = [NSEntityDescription entityForName:@"GoodAnswer" inManagedObjectContext:context];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"questionId=%@",idQuestion];
    [fetchRequest setPredicate:predicate];
    NSArray *result = [context executeFetchRequest:fetchRequest error:nil];
    
    return result;
    
}

//Use to selected one item in table Qcm
- (GoodAnswer *)selectById:(NSManagedObject *)goodAnswer{
    
    appDelegate = [[UIApplication sharedApplication]delegate];
    context = appDelegate.managedObjectContext;
    NSManagedObject* manageObject = [context objectWithID:goodAnswer.objectID];
    
    return manageObject;
}

//Use to update in database
- (void) update:(NSManagedObject *)managedObject withQuestion:(GoodAnswer *)goodAnswer{
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* context = appDelegate.managedObjectContext;
    
    //Set Column in database from entity Qcm
    [managedObject setValue:goodAnswer.answerQuestion forKey:@"textQuestion"];
    
    [appDelegate saveContext];
    
}

//Use to remove in database
- (void)remove:(NSManagedObject *)managedObject{
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    context = appDelegate.managedObjectContext;
    
    [context deleteObject:managedObject];
}

@end
