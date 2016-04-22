//
//  QuestionViewController.m
//  QCMapp
//
//  Created by etudiant on 19/04/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import "QuestionViewController.h"
#import "DAOQuestion.h"
#import "DAOBadAnswer.h"
#import "DAOGoodAnswer.h"
#import "Constant.h"

@interface QuestionViewController ()


@end

@implementation QuestionViewController

@synthesize counter;
@synthesize checkbox1;
@synthesize checkbox2;
@synthesize checkbox3;

@synthesize resultGoodAnswer;
@synthesize resultBadAnswer;

@synthesize idGoodAnswer;
@synthesize idBadAnswer;
@synthesize idQuestionReadNow;

@synthesize start;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    DAOGoodAnswer* daoGoodAnswer = [DAOGoodAnswer new];
    DAOBadAnswer* daoBadAnswer = [DAOBadAnswer new];
    
    checkbox1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 135,20, 20)];
    [checkbox1 addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    
    checkbox2 = [[UIButton alloc] initWithFrame:CGRectMake(10, 200,20, 20)];
    [checkbox2 addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    
    checkbox3 = [[UIButton alloc] initWithFrame:CGRectMake(10, 260,20, 20)];
    [checkbox3 addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    
    for (int j = 0; j < 1; j++) {
        
        Question* getFirstQuestion = [self.resultQuestionFromQcm objectAtIndex:j];
        idQuestionReadNow = [self.resultQuestionFromQcm objectAtIndex:j];
        
        self.textQuestion.text = getFirstQuestion.textQuestion;
        resultGoodAnswer = [daoGoodAnswer slectIdQuestionFk:nil :idQuestionReadNow];
        
        resultBadAnswer = [daoBadAnswer slectIdQuestionFk:nil :idQuestionReadNow];
        
        idGoodAnswer = [self.resultGoodAnswer objectAtIndex:j];
        
        GoodAnswer* getGoodAnswer = [resultGoodAnswer objectAtIndex:j];
        
        checkbox2.tag = [self getId:idGoodAnswer];
        self.textGoodAnswer.text = getGoodAnswer.answerQuestion;
    
        for (int k = 0; k < [resultBadAnswer count]; k++) {
            idBadAnswer = [self.resultBadAnswer objectAtIndex:k];
            
            BadAnswer* badAnswer = [self.resultBadAnswer objectAtIndex:k];
            if(k == 0){
                checkbox1.tag = [self getId:idBadAnswer];
                self.textAnswer1.text = badAnswer.badAnswerQuestion;
                
            } else {
                checkbox3.tag = [self getId:idBadAnswer];
                self.textAnswer2.text = badAnswer.badAnswerQuestion;
            }
        }
    }
    checkbox1.backgroundColor = [UIColor grayColor];
    checkbox2.backgroundColor = [UIColor grayColor];
    checkbox3.backgroundColor = [UIColor grayColor];
    [self.view addSubview:checkbox1];
    [self.view addSubview:checkbox2];
    [self.view addSubview:checkbox3];
    
    start = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Get the id from databases
-(NSInteger)getId:(NSManagedObject*) value{
    
    NSString* getId = value.objectID.URIRepresentation.absoluteString;
    NSArray* theComponents = [getId componentsSeparatedByString:@"/p"];
    NSInteger theZpk = [[theComponents lastObject] intValue];
    return theZpk;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}*/


//Button to return at old question
- (IBAction)prev:(id)sender {
    //TODO Add previous question
    if(start == YES || counter == 0){
        
        Constant* constant = [Constant new];
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:constant.MESSAGE_ALERT_INFO
            message:constant.MESSAGE_ALERT_PREV
            preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:alert animated:YES completion:nil];
        
        UIAlertAction* ok = [UIAlertAction
            actionWithTitle:@"OK"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction * action){
                [alert dismissViewControllerAnimated:YES completion:nil];
            }];
        [alert addAction:ok];
    } else {
        counter = counter - 1;
        //TODO reverse next Question
        
        idQuestionReadNow = [self.resultQuestionFromQcm objectAtIndex:counter];
        Question* getQuestion = [self.resultQuestionFromQcm objectAtIndex:counter];
        self.textQuestion.text = getQuestion.textQuestion;
        
        DAOGoodAnswer*daoGoodAnswer = [DAOGoodAnswer new];
        resultGoodAnswer = [daoGoodAnswer slectIdQuestionFk:nil :idQuestionReadNow];
        GoodAnswer* getGoodAnswer = [resultGoodAnswer objectAtIndex:0];
       
        checkbox2.tag = [self getId:idGoodAnswer];
        self.textGoodAnswer.text = getGoodAnswer.answerQuestion;
        
        
        DAOBadAnswer* daoBadAnswer = [DAOBadAnswer new];
        resultBadAnswer = [daoBadAnswer slectIdQuestionFk:nil :idQuestionReadNow];
        BadAnswer* getBadAnswerOne = [resultBadAnswer objectAtIndex:0];
        BadAnswer* getBadAnswerTwo = [resultBadAnswer objectAtIndex:1];
        
        NSManagedObject* idBadAnswerOne = [self.resultBadAnswer objectAtIndex:0];
        NSManagedObject* idBadAnswerTwo = [self.resultBadAnswer objectAtIndex:1];
        checkbox1.tag = [self getId:idBadAnswerOne];
        
        self.textAnswer1.text = getBadAnswerOne.badAnswerQuestion;
        
        checkbox3.tag = [self getId:idBadAnswerTwo];
        self.textAnswer2.text = getBadAnswerTwo.badAnswerQuestion;
        
    }
}

//Button to go to the next question
- (IBAction)next:(id)sender {
    //TODO Add next question
    if(counter != [self.resultQuestionFromQcm count]){
        counter++;
        //Next question
        idQuestionReadNow = [self.resultQuestionFromQcm objectAtIndex:counter];
        Question* getQuestion = [self.resultQuestionFromQcm objectAtIndex:counter];
        self.textQuestion.text = getQuestion.textQuestion;
        
        DAOGoodAnswer*daoGoodAnswer = [DAOGoodAnswer new];
        resultGoodAnswer = [daoGoodAnswer slectIdQuestionFk:nil :idQuestionReadNow];
        GoodAnswer* getGoodAnswer = [resultGoodAnswer objectAtIndex:0];
        checkbox2.tag = [self getId:idGoodAnswer];
        self.textGoodAnswer.text = getGoodAnswer.answerQuestion;
        
        
        DAOBadAnswer* daoBadAnswer = [DAOBadAnswer new];
        resultBadAnswer = [daoBadAnswer slectIdQuestionFk:nil :idQuestionReadNow];
        BadAnswer* getBadAnswerOne = [resultBadAnswer objectAtIndex:0];
        BadAnswer* getBadAnswerTwo = [resultBadAnswer objectAtIndex:1];
        
        NSManagedObject* idBadAnswerOne = [self.resultBadAnswer objectAtIndex:0];
        NSManagedObject* idBadAnswerTwo = [self.resultBadAnswer objectAtIndex:1];
        checkbox1.tag = [self getId:idBadAnswerOne];
        
        self.textAnswer1.text = getBadAnswerOne.badAnswerQuestion;
        
        checkbox3.tag = [self getId:idBadAnswerTwo];
        self.textAnswer2.text = getBadAnswerTwo.badAnswerQuestion;
        
        start = NO;
        
    } else {
        Constant* constant = [Constant new];
        self.textQuestion.text = constant.MESSAGE_END_QCM;
        self.textAnswer1.text = constant.MESSAGE_END_QCM;
        self.textAnswer2.text = constant.MESSAGE_END_QCM;
        self.textGoodAnswer.text = constant.MESSAGE_END_QCM;
    }
}

//Get status checkbox
-(void)buttonEvent:(UIButton* )btn {
    if(!btn.isSelected)
    {
        [btn setSelected:YES];
        [btn setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateSelected];
        
        
        
    } else {
        [btn setSelected:NO];
    }
}
@end
