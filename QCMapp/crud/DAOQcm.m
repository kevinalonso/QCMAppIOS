//
//  DAOQcm.m
//  QCMapp
//
//  Created by etudiant on 07/03/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import "DAOQcm.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@implementation DAOQcm

@synthesize appDelegate;
@synthesize context;

+(NSString*) ENTITY_QCM{ return @"Qcm"; }
+(NSString*) NAME_QCM{ return @"nameQcm"; }
+(NSString*) QCM_DATE_START{ return @"dateStart"; }
+(NSString*) QCM_DATE_END{ return @"dateEnd"; }
+(NSString*) QCM_IS_ACTIVE{ return @"isActive"; }
+(NSString*) QCM_TYPE{ return @"idType";}

//Use to insert Qcm in database
- (void)insert:(Qcm *)qcm{

    appDelegate = [[UIApplication sharedApplication] delegate];
    context = appDelegate.managedObjectContext;
    
    NSManagedObject* managedObject = [NSEntityDescription insertNewObjectForEntityForName:DAOQcm.ENTITY_QCM
        inManagedObjectContext:context];
    
    //Set Column in database from entity Qcm
    [managedObject setValue:qcm.nameQcm forKey:DAOQcm.NAME_QCM];
    [managedObject setValue:qcm.dateStart forKey:DAOQcm.QCM_DATE_START];
    [managedObject setValue:qcm.dateEnd forKey:DAOQcm.QCM_DATE_END];
    [managedObject setValue:[NSNumber numberWithBool:qcm.isActive]forKey:DAOQcm.QCM_IS_ACTIVE];
    //[managedObject setValue:[NSNumber numberWithInteger:qcm.idType] forKey:DAOQcm.QCM_TYPE];
    
    //Insert in database
    [appDelegate saveContext];

}

//Use to selected all item in table Qcm
- (NSArray*)selectAll{
    
    NSArray* qcms = [NSArray new];
    appDelegate = [[UIApplication sharedApplication] delegate];
    NSFetchRequest* fetchRequest = [NSFetchRequest new];
    context = appDelegate.managedObjectContext;
    
    //[fetchRequest setResultType:NSManagedObjectIDResultType];
    
    fetchRequest.entity = [NSEntityDescription entityForName:DAOQcm.ENTITY_QCM inManagedObjectContext:context];
    
    qcms = [context executeFetchRequest:fetchRequest error:nil];
    
    return qcms;
    
}

//Use to selected one item in table Qcm
- (Qcm *)selectById:(NSManagedObject *)qcm{
    
    appDelegate = [[UIApplication sharedApplication]delegate];
    context = appDelegate.managedObjectContext;
    NSManagedObject* manageObject = [context objectWithID:qcm.objectID];
    
    return manageObject;
}

//Use to update in database
- (void) update:(NSManagedObject *)managedObject withQcm:(Qcm *)qcm{
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    context = appDelegate.managedObjectContext;
    
    //Set Column in database from entity Qcm
    [managedObject setValue:qcm.nameQcm forKey:DAOQcm.NAME_QCM];
    [managedObject setValue:qcm.dateStart forKey:DAOQcm.QCM_DATE_START];
    [managedObject setValue:qcm.dateEnd forKey:DAOQcm.QCM_DATE_END];
    [managedObject setValue:[NSNumber numberWithBool:qcm.isActive]forKey:DAOQcm.QCM_IS_ACTIVE];
    //[managedObject setValue:[NSNumber numberWithInt:qcm.idType] forKey:DAOQcm.QCM_TYPE];
    
    [appDelegate saveContext];

}

//Use to remove in database
- (void)remove:(NSManagedObject *)managedObject{
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    context = appDelegate.managedObjectContext;
    
    [context deleteObject:managedObject];
}

@end
