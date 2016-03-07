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

- (void)insert:(BadAnswer *)badAnswer;
- (NSArray*)selectAll;
- (BadAnswer *)selectById:(NSManagedObject *)badAnswer;
- (void) update:(NSManagedObject *)managedObject withQuestion:(BadAnswer *)badAnswer;
- (void)remove:(NSManagedObject *)managedObject;

@end
