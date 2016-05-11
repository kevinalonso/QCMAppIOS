//
//  DAOGoodAnswer.h
//  QCMapp
//
//  Created by etudiant on 07/03/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "GoodAnswer.h"
#import "AppDelegate.h"

@interface DAOGoodAnswer : NSObject

@property AppDelegate* appDelegate;
@property NSManagedObjectContext* context;

//Insert in database
- (void)insert:(GoodAnswer *)goodAnswer;

//Select in database
- (NSArray*)selectAll;

//Select foreign key in database
- (NSArray*)slectIdQuestionFk:(GoodAnswer*) goodAnswer:(NSManagedObject*)idQuestion;

//Select one GoodAnswer in database
- (GoodAnswer *)selectById:(NSManagedObject *)goodAnswer;

//Update GoodAnswer in database
- (void) update:(NSManagedObject *)managedObject withQuestion:(GoodAnswer *)goodAnswer;

//Remove in database
- (void)remove:(NSManagedObject *)managedObject;

@end
