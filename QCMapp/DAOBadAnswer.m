//
//  DAOBadAnswer.m
//  QCMapp
//
//  Created by etudiant on 07/03/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import "DAOBadAnswer.h"

@implementation DAOBadAnswer
@synthesize appDelegate;
@synthesize context;

- (void)insert:(BadAnswer *)badAnswer{
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    context = appDelegate.managedObjectContext;
    
    NSManagedObject* managedObject = [NSEntityDescription insertNewObjectForEntityForName:@"BadAnswer"
        inManagedObjectContext:context];
    
    //Set Column in database from entity BadAnswer
    [managedObject setValue:badAnswer.badAnswerQuestion forKey:@"badAnswerQuestion"];
    [managedObject setValue:badAnswer.idQuestion forKey:@"questionId"];
    
    //Insert in database
    [appDelegate saveContext];
}

- (NSArray*)selectAll{
    
    NSArray* badAnswers = [NSArray new];
    appDelegate = [[UIApplication sharedApplication] delegate];
    NSFetchRequest* fetchRequest = [NSFetchRequest new];
    context = appDelegate.managedObjectContext;
    
    fetchRequest.entity = [NSEntityDescription entityForName:@"BadAnswer"
                                      inManagedObjectContext:context];
    
    badAnswers = [context executeFetchRequest:fetchRequest error:nil];
    
    return badAnswers;
}

-(NSArray*)slectIdQuestionFk:(BadAnswer*) badAnswer:(NSManagedObject*)idQuestion{
    
    appDelegate = [[UIApplication sharedApplication]delegate];
    context = appDelegate.managedObjectContext;
    NSFetchRequest* fetchRequest = [NSFetchRequest new];
    fetchRequest.entity = [NSEntityDescription entityForName:@"BadAnswer" inManagedObjectContext:context];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"questionId=%@",idQuestion];
    [fetchRequest setPredicate:predicate];
    NSArray *result = [context executeFetchRequest:fetchRequest error:nil];
    
    return result;
    
}

- (BadAnswer *)selectById:(NSManagedObject *)badAnswer{
    
    appDelegate = [[UIApplication sharedApplication]delegate];
    context = appDelegate.managedObjectContext;
    NSManagedObject* manageObject = [context objectWithID:badAnswer.objectID];
    
    return manageObject;
}

- (void) update:(NSManagedObject *)managedObject withQuestion:(BadAnswer *)badAnswer{
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* context = appDelegate.managedObjectContext;
    
    //Set Column in database from entity Qcm
    [managedObject setValue:badAnswer.badAnswerQuestion forKey:@"badAnswerQuestion"];
    
    [appDelegate saveContext];
}

- (void)remove:(NSManagedObject *)managedObject{
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    context = appDelegate.managedObjectContext;
    
    [context deleteObject:managedObject];
}

@end
