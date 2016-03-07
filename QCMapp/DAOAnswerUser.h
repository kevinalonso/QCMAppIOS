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

- (void)insert:(AnswerUser *)answerUser;
- (NSArray*)selectAll;
- (AnswerUser *)selectById:(NSManagedObject *)answerUser;
- (void) update:(NSManagedObject *)managedObject withQuestion:(AnswerUser *)answerUser;
- (void)remove:(NSManagedObject *)managedObject;

@end
