//
//  WelcomeViewController.h
//  QCMapp
//
//  Created by etudiant on 08/03/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface WelcomeViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UILabel *identityUser;

//Result of database to get Qcm in List
@property NSArray* resQcm;

@property NSString* segueLogin;
@property NSString* segueId;

@property NSString* idUserQcm;

@property AppDelegate* appDelegate;
@end
