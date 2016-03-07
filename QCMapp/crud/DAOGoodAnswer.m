//
//  DAOGoodAnswer.m
//  QCMapp
//
//  Created by etudiant on 07/03/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import "DAOGoodAnswer.h"

@implementation DAOGoodAnswer
@synthesize appDelegate;
@synthesize context;

- (void)insert:(GoodAnswer *)goodAnswer{
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    context = appDelegate.managedObjectContext;
    
    NSManagedObject* managedObject = [NSEntityDescription insertNewObjectForEntityForName:@"GoodAnswer"
                                                                   inManagedObjectContext:context];
    //Set Column in database from entity Qcm
    [managedObject setValue:goodAnswer.answerQuestion forKey:@"answerQuestion"];
    
    //Insert in database
    [appDelegate saveContext];
}

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

- (GoodAnswer *)selectById:(NSManagedObject *)goodAnswer{
    
    appDelegate = [[UIApplication sharedApplication]delegate];
    context = appDelegate.managedObjectContext;
    NSManagedObject* manageObject = [context objectWithID:goodAnswer.objectID];
    
    return manageObject;
}

- (void) update:(NSManagedObject *)managedObject withQuestion:(GoodAnswer *)goodAnswer{
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* context = appDelegate.managedObjectContext;
    
    //Set Column in database from entity Qcm
    [managedObject setValue:goodAnswer.answerQuestion forKey:@"textQuestion"];
    
    [appDelegate saveContext];
    
}

- (void)remove:(NSManagedObject *)managedObject{
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    context = appDelegate.managedObjectContext;
    
    [context deleteObject:managedObject];
}

@end
