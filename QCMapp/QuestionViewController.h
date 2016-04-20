//
//  QuestionViewController.h
//  QCMapp
//
//  Created by etudiant on 19/04/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Qcm.h"

@interface QuestionViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *textQuestion;
- (IBAction)next:(id)sender;
- (IBAction)prev:(id)sender;



@property Qcm* qcm;
@property int idQcmSelected;
@property NSArray* resultQuestionFromQcm;

@end
