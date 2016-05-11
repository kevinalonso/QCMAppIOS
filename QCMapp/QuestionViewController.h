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
#import "AnswerUser.h"

@interface QuestionViewController : UIViewController

//Text display name question
@property (weak, nonatomic) IBOutlet UILabel *textQuestion;

//Navigation button next or previous question
- (IBAction)next:(id)sender;
- (IBAction)prev:(id)sender;

//Post the data to the web service
- (IBAction)sendAnswer:(id)sender;

//Propetty is visible or not
@property (weak, nonatomic) IBOutlet UIButton *senderStyle;

//CheckBox button because IOS not have checkbox you must transform button
@property (weak, nonatomic) IBOutlet UILabel *textAnswer1;
@property (weak, nonatomic) IBOutlet UILabel *textGoodAnswer;
@property (weak, nonatomic) IBOutlet UILabel *textAnswer2;


//Enity Qcm and AnswerUser
@property Qcm* qcm;
@property AnswerUser* setAnswerUser;

@property int idQcmSelected;

//Counter is use to navigate in the list of question
@property int counter;

//Add elemnt to completd Question in many Array
//and this item from Array is diplay in graphic element
@property NSArray* resultQuestionFromQcm;
@property NSArray* resultGoodAnswer;
@property NSArray* resultBadAnswer;
@property NSMutableArray* userAnswerSend;

//CheckBox to answer question
@property UIButton *checkbox1;
@property UIButton *checkbox2;
@property UIButton *checkbox3;


@property NSManagedObject* idGoodAnswer;
@property NSManagedObject* idBadAnswer;
@property NSManagedObject* idQuestionReadNow;
@property NSManagedObject* idQcm;

//Variable for the navigation
@property BOOL start;

@end
