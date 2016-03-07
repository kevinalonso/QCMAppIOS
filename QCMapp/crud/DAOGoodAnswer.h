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

- (void)insert:(GoodAnswer *)goodAnswer;
- (NSArray*)selectAll;
- (GoodAnswer *)selectById:(NSManagedObject *)goodAnswer;
- (void) update:(NSManagedObject *)managedObject withQuestion:(GoodAnswer *)goodAnswer;
- (void)remove:(NSManagedObject *)managedObject;

@end
