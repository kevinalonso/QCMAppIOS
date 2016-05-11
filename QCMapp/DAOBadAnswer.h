//
//  DAOBadAnswer.h
//  QCMapp
//
//  Created by etudiant on 07/03/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BadAnswer.h"
#import "AppDelegate.h"

@interface DAOBadAnswer : NSObject

@property AppDelegate* appDelegate;
@property NSManagedObjectContext* context;

//Insert in database
- (void)insert:(BadAnswer *)badAnswer;

//Select in database
- (NSArray*)selectAll;

//Select foreign key in database
- (NSArray*)slectIdQuestionFk:(BadAnswer*) badAnswer:(NSManagedObject*)idQuestion;

//Select one BadAnswer in database
- (BadAnswer *)selectById:(NSManagedObject *)badAnswer;

//Update BadAnswer in database
- (void) update:(NSManagedObject *)managedObject withQuestion:(BadAnswer *)badAnswer;

//Remove in database
- (void)remove:(NSManagedObject *)managedObject;

@end
