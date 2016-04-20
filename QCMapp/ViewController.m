//
//  ViewController.m
//  QCMapp
//
//  Created by etudiant on 07/03/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import "ViewController.h"
#import "QcmWebServiceAdapter.h"
#import "QuestionWebServiceAdapter.h"
#import "DAOQcm.h"
#import "DAOQuestion.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Récupération des élément du JSON dans ma vue
    //Alimentation des élménrt avec la méthode callback
    //Attention la méthode void ici doit toujours etre au deçus de l'appel du web service
    /*void( ^callback)(Weather*) = ^(Weather* weather){
        self.descriptionLabel.text = weather.description;
        self.idServerLabel.text = [NSString stringWithFormat:@"%d",weather.idServer];
        self.mainLabel.text = weather.main;
        
    };
    
    //Utilisation de la méthode callback
    weatherWebServiceAdapter* services = [weatherWebServiceAdapter new];
    [services getWeather:callback];*/
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendConnectionQcm:(id)sender {
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
/***********************************************QCM**************************/
    void( ^callback)(NSArray*) = ^(NSArray* qcms){
        DAOQcm* daoQcm = [DAOQcm new];
        NSArray* checkQcm = [daoQcm selectAll];
        int i = 0;
        
        NSLog(@"Size of NSArray checkQcm = %lu",[checkQcm count]);
        
        for (Qcm* item in qcms) {
            Qcm* getQcm;
            if([checkQcm count] != 0){
                 getQcm = [checkQcm objectAtIndex:i];
                if([item.nameQcm isEqualToString:getQcm.nameQcm]){
                    NSLog(@"Exist in database %@",item.nameQcm);
                    i++;
                } else {
                    [daoQcm insert:item];
                    i++;
                }
            }
            if([checkQcm count] == 0)
            {
                [daoQcm insert:item];
                
            }
        }
    };
    
    QcmWebServiceAdapter* services = [QcmWebServiceAdapter new];
    [services getAllQcm:callback];
    /***************************************************************************/
    
    /*************************************QUESTION******************************/
    void( ^callbackQuestion)(NSArray*) = ^(NSArray* questions){
        DAOQuestion* daoQuestion = [DAOQuestion new];
        NSArray* checkQuestion = [daoQuestion selectAll];
        int j = 0;
        
        NSLog(@"Size of NSArray checkQcm = %lu",[checkQuestion count]);
        
        for (Question* itemQuestion in questions) {
            Question* getQuestion;
            if([checkQuestion count] != 0){
                getQuestion = [checkQuestion objectAtIndex:j];
                if([itemQuestion.textQuestion isEqualToString:getQuestion.textQuestion]){
                    NSLog(@"Exist in database %@",itemQuestion.textQuestion);
                    j++;
                } else {
                    [daoQuestion insert:itemQuestion];
                    j++;
                }
            }
            if([checkQuestion count] == 0)
            {
                [daoQuestion insert:itemQuestion];
                
            }
        }
    };
    
    QuestionWebServiceAdapter* questionService = [QuestionWebServiceAdapter new];
    [questionService getAllQuestion:callbackQuestion];
    /*********************************************************************************/
}

@end
