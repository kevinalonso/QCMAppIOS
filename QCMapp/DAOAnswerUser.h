//
//  DAOAnswerUser.h
//  QCMapp
//
//  Created by etudiant on 07/03/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AnswerUser.h"
#import "AppDelegate.h"

@interface DAOAnswerUser : NSObject

@property AppDelegate* appDelegate;
@property NSManagedObjectContext* context;

//Insert in database
- (void)insert:(AnswerUser *)answerUser;

//Select in database
- (NSArray*)selectAll;

//Select one Qcm in database
- (AnswerUser *)selectById:(NSManagedObject *)answerUser;

//Update Qcm in database
- (void) update:(NSManagedObject *)managedObject withQuestion:(AnswerUser *)answerUser;

//Remove in database
- (void)remove:(NSManagedObject *)managedObject;

@end
