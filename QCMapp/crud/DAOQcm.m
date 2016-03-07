//
//  DAOQcm.m
//  QCMapp
//
//  Created by etudiant on 07/03/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import "DAOQcm.h"
#import "AppDelegate.h"

@implementation DAOQcm
@synthesize appDelegate;
@synthesize context;

//Use to insert Qcm in database
- (void)insert:(Qcm *)qcm{

    appDelegate = [[UIApplication sharedApplication] delegate];
    context = appDelegate.managedObjectContext;
    
    NSManagedObject* managedObject = [NSEntityDescription insertNewObjectForEntityForName:@"Qcm"
                                                                   inManagedObjectContext:context];
    //Set Column in database from entity Qcm
    [managedObject setValue:qcm.nameQcm forKey:@"nameQcm"];
    [managedObject setValue:qcm.dateStart forKey:@"dateStart"];
    [managedObject setValue:qcm.dateEnd forKey:@"dateEnd"];
    [managedObject setValue:[NSNumber numberWithBool:qcm.isActive]forKey:@"isActive"];
    //[managedObject setValue:[NSNumber numberWithInt:qcm.idType] forKey:@"idType"];
    
    //Insert in database
    [appDelegate saveContext];

}

//Use to selected all item in table Qcm
- (NSArray*)selectAll{
    
    NSArray* qcms = [NSArray new];
    appDelegate = [[UIApplication sharedApplication] delegate];
    NSFetchRequest* fetchRequest = [NSFetchRequest new];
    context = appDelegate.managedObjectContext;
    
    fetchRequest.entity = [NSEntityDescription entityForName:@"Qcm" inManagedObjectContext:context];
    
    qcms = [context executeFetchRequest:fetchRequest error:nil];
    
    return qcms;
    
}

- (Qcm *)selectById:(NSManagedObject *)qcm{
    
    appDelegate = [[UIApplication sharedApplication]delegate];
    context = appDelegate.managedObjectContext;
    NSManagedObject* manageObject = [context objectWithID:qcm.objectID];
    
    return manageObject;
}

- (void) update:(NSManagedObject *)managedObject withQcm:(Qcm *)qcm{
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* context = appDelegate.managedObjectContext;
    
    //Set Column in database from entity Qcm
    [managedObject setValue:qcm.nameQcm forKey:@"nameQcm"];
    [managedObject setValue:qcm.dateStart forKey:@"dateStart"];
    [managedObject setValue:qcm.dateEnd forKey:@"dateEnd"];
    [managedObject setValue:[NSNumber numberWithBool:qcm.isActive]forKey:@"isActive"];
    //[managedObject setValue:[NSNumber numberWithInt:qcm.idType] forKey:@"idType"];
    
    [appDelegate saveContext];

}

- (void)remove:(NSManagedObject *)managedObject{
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    context = appDelegate.managedObjectContext;
    
    [context deleteObject:managedObject];
}

@end
