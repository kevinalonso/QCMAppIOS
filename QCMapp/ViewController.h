//
//  ViewController.h
//  QCMapp
//
//  Created by etudiant on 07/03/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *idServerLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;

@property NSMutableArray* resUsers;
@property (weak, nonatomic) IBOutlet UITextField *loginEditText;
@property (weak, nonatomic) IBOutlet UITextField *passwordEditText;

@property bool checked;
@property NSString* loginGet;
@property NSString* idUserGet;

//Button to access Qcm list
- (IBAction)sendConnectionQcm:(id)sender;

@end

