//
//  DetailQuestioniewController.m
//  QCMapp
//
//  Created by etudiant on 19/04/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import "DetailQuestioniewController.h"

@interface DetailQuestioniewController ()

@end

@implementation DetailQuestioniewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.questionTitle.text = @"lol";
    /*if(self.qcm != nil){
        self.questionTitle.text = @"QCM 1";
        NSLog(@"%@",self.questionTitle.text);
    }*/
    NSLog(@"test = %@",self.qcm.nameQcm);
    self.questionTitle.text = self.qcm.nameQcm;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
