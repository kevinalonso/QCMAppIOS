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

+(NSString*) ENTITY_QCM;
+(NSString*) NAME_QCM;
+(NSString*) QCM_DATE_START;
+(NSString*) QCM_DATE_END;
+(NSString*) QCM_IS_ACTIVE;
+(NSString*) QCM_TYPE;

//Insert in database
- (void)insert:(Qcm *)qcm;

//Select in database
- (NSArray*)selectAll;

//Select one Qcm in database
- (Qcm *)selectById:(NSManagedObject *)qcm;

//Update Qcm in database
- (void) update:(NSManagedObject *)managedObject withQcm:(Qcm *)qcm;

//Remove Qcm in database
- (void)remove:(NSManagedObject *)managedObject;

@end
