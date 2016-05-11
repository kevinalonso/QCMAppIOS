//
//  DAOQuestion.h
//  QCMapp
//
//  Created by etudiant on 07/03/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Question.h"
#import "AppDelegate.h"
#import "Qcm.h"

@interface DAOQuestion : NSObject

@property AppDelegate* appDelegate;
@property NSManagedObjectContext* context;

@property NSManagedObject* object;

//Insert in database
- (void)insert:(Question *)question;

//Select in database
- (NSArray*)selectAll;

//Select foreign key in database
- (NSArray*)slectIdQcmFk:(Qcm*) qcm:(NSManagedObject*)idQcm;

//Select one Question in database
- (Question *)selectById:(NSManagedObject *)question;

//Update Question in database
- (void) update:(NSManagedObject *)managedObject withQuestion:(Question *)question;

//Remove Question in database
- (void)remove:(NSManagedObject *)managedObject;

@end
