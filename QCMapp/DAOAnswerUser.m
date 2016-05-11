//
//  DAOAnswerUser.m
//  QCMapp
//
//  Created by etudiant on 07/03/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import "DAOAnswerUser.h"

@implementation DAOAnswerUser
@synthesize appDelegate;
@synthesize context;

//Use to insert AnswerUser in database
- (void)insert:(AnswerUser *)answerUser{
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    context = appDelegate.managedObjectContext;
    
    NSManagedObject* managedObject = [NSEntityDescription insertNewObjectForEntityForName:@"AnswerUser"
                                                                   inManagedObjectContext:context];
    //Set Column in database from entity AnswerUser
    [managedObject setValue:[NSNumber numberWithInt:answerUser.sendAnswer] forKey:@"sendAnswer"];
    
    //Insert in database
    [appDelegate saveContext];

}

//Use to selected all item in table AnswerUser
- (NSArray*)selectAll{
    
    NSArray* answerUsers = [NSArray new];
    appDelegate = [[UIApplication sharedApplication] delegate];
    NSFetchRequest* fetchRequest = [NSFetchRequest new];
    context = appDelegate.managedObjectContext;
    
    fetchRequest.entity = [NSEntityDescription entityForName:@"AnswerUser"
                                      inManagedObjectContext:context];
    
    answerUsers = [context executeFetchRequest:fetchRequest error:nil];
    
    return answerUsers;
    
}

//Use to selected one item in table AnswerUser
- (AnswerUser *)selectById:(NSManagedObject *)answerUser{
    
    appDelegate = [[UIApplication sharedApplication]delegate];
    context = appDelegate.managedObjectContext;
    NSManagedObject* manageObject = [context objectWithID:answerUser.objectID];
    
    return manageObject;
}

//Use to update in database
- (void) update:(NSManagedObject *)managedObject withQuestion:(AnswerUser *)answerUser{
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* context = appDelegate.managedObjectContext;
    
    //Set Column in database from entity AnswerUser
    [managedObject setValue:[NSNumber numberWithInt:answerUser.sendAnswer] forKey:@"sendAnswer"];
    
    [appDelegate saveContext];

}

//Use to remove in database
- (void)remove:(NSManagedObject *)managedObject{
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    context = appDelegate.managedObjectContext;
    
    [context deleteObject:managedObject];
}

@end
