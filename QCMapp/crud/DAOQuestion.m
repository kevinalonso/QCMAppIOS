//
//  DAOQuestion.m
//  QCMapp
//
//  Created by etudiant on 07/03/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import "DAOQuestion.h"

@implementation DAOQuestion
@synthesize appDelegate;
@synthesize context;


- (void)insert:(Question *)question{
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    context = appDelegate.managedObjectContext;
    
    NSManagedObject* managedObject = [NSEntityDescription insertNewObjectForEntityForName:@"Question"
                                                                   inManagedObjectContext:context];
    //Set Column in database from entity Qcm
    [managedObject setValue:question.textQuestion forKey:@"textQuestion"];
    
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

- (Question *)selectById:(NSManagedObject *)question{
    
    appDelegate = [[UIApplication sharedApplication]delegate];
    context = appDelegate.managedObjectContext;
    NSManagedObject* manageObject = [context objectWithID:question.objectID];
    
    return manageObject;
}

- (void) update:(NSManagedObject *)managedObject withQuestion:(Question *)question{
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* context = appDelegate.managedObjectContext;
    
    //Set Column in database from entity Qcm
    [managedObject setValue:question.textQuestion forKey:@"textQuestion"];
    
    [appDelegate saveContext];

}

- (void)remove:(NSManagedObject *)managedObject{
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    context = appDelegate.managedObjectContext;
    
    [context deleteObject:managedObject];

}

@end
