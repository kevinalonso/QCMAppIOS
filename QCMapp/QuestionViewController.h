//
//  QuestionViewController.h
//  QCMapp
//
//  Created by etudiant on 19/04/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Qcm.h"

@interface QuestionViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *textQuestion;
- (IBAction)next:(id)sender;
- (IBAction)prev:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *textAnswer1;
@property (weak, nonatomic) IBOutlet UILabel *textGoodAnswer;
@property (weak, nonatomic) IBOutlet UILabel *textAnswer2;



@property Qcm* qcm;
@property int idQcmSelected;
@property int counter;


@property NSArray* resultQuestionFromQcm;
@property NSArray* resultGoodAnswer;
@property NSArray* resultBadAnswer;

@property UIButton *checkbox1;
@property UIButton *checkbox2;
@property UIButton *checkbox3;

@property NSManagedObject* idGoodAnswer;
@property NSManagedObject* idBadAnswer;
@property NSManagedObject* idQuestionReadNow;

@property BOOL start;

@end
