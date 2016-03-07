//
//  DAOQcm.h
//  QCMapp
//
//  Created by etudiant on 07/03/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Qcm.h"
#import "AppDelegate.h"

@interface DAOQcm : NSObject

@property AppDelegate* appDelegate;
@property NSManagedObjectContext* context;

- (void)insert:(Qcm *)qcm;
- (NSArray*)selectAll;
- (Qcm *)selectById:(NSManagedObject *)qcm;
- (void) update:(NSManagedObject *)managedObject withQcm:(Qcm *)qcm;
- (void)remove:(NSManagedObject *)managedObject;

@end
