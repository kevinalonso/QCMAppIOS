//
//  QuestionViewController.m
//  QCMapp
//
//  Created by etudiant on 19/04/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import "QuestionViewController.h"
#import "DAOQuestion.h"

@interface QuestionViewController ()


@end

@implementation QuestionViewController
@synthesize qcm;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int j = 0; j < 1; j++) {
        Question* getFirstQuestion = [self.resultQuestionFromQcm objectAtIndex:j];
        self.textQuestion.text = getFirstQuestion.textQuestion;
    }

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (IBAction)prev:(id)sender {
    //TODO Add previous question
    
}

- (IBAction)next:(id)sender {
    //TODO Add next question
}

@end
