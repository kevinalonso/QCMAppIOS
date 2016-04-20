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

- (void)insert:(Question *)question;
- (NSArray*)selectAll;
- (NSArray*)slectIdQcmFk:(Qcm*) qcm;
- (Question *)selectById:(NSManagedObject *)question;
- (void) update:(NSManagedObject *)managedObject withQuestion:(Question *)question;
- (void)remove:(NSManagedObject *)managedObject;

@end
