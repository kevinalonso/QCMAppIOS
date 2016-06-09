//
//  ViewController.m
//  QCMapp
//
//  Created by etudiant on 07/03/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import "ViewController.h"
#import "Constant.h"
#import "UserQcm.h"

//Alert
#import "AlertInfo.h"

//WebService
#import "QcmWebServiceAdapter.h"
#import "QuestionWebServiceAdapter.h"
#import "GoodAnswerWebServiceAdapter.h"
#import "BadAnswerWebServiceAdapter.h"
#import "UserQcmWebServiceAdapter.h"

//Method CRUD
#import "DAOQcm.h"
#import "DAOQuestion.h"
#import "DAOGoodAnswer.h"
#import "DAOBadAnswer.h"
#include <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonKeyDerivation.h>

//View
#import "WelcomeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize resUsers;
@synthesize loginEditText;
@synthesize passwordEditText;
@synthesize checked;

- (void)viewDidLoad {
    [super viewDidLoad];
    resUsers = [NSMutableArray new];
    //Get User from the webservice
    void( ^callback)(NSArray*) = ^(NSArray* users){
        for (UserQcm* item in users) {
            NSLog(@"User login = %@",item.login);
            [resUsers addObject:item];
        }
    };
    UserQcmWebServiceAdapter* services = [UserQcmWebServiceAdapter new];
    [services getAllUser:callback];
    
    //////////////////////////////////GET USER LOGIN PASSWORD/////////////////////
    /*unsigned char hash[CC_SHA1_DIGEST_LENGTH];
    NSData* data;
    NSString* toto = @"kalons";
    NSData *sha256;
    data = [toto dataUsingEncoding:NSUTF8StringEncoding];
    
    if ( CC_SHA256([data bytes], [data length], hash) ) {
        
        sha256 = [NSData dataWithBytes:hash length:CC_SHA256_DIGEST_LENGTH];
        NSLog(@"hash = %@",sha256);
        
    }
    
    NSLog(@"%@", [sha256 description]);
    NSString *hexString = [sha256 description];
    
    NSString* teste = @"ea3968691ab0a5dd68289375feb0ca767f86b98e008c8690fd51a974edc48256";
    
    NSString *trimmedString = [hexString stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"<>"];
    trimmedString = [[trimmedString componentsSeparatedByCharactersInSet: doNotWant] componentsJoinedByString: @""];
    
    NSLog(@"%@",trimmedString);
    if([trimmedString isEqualToString:teste]){
        NSLog(@"OK");
    }*/
    /////////////////////////////////////////////////////////////////////////////////////
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendConnectionQcm:(id)sender {
    if (loginEditText.text && loginEditText.text.length > 0 &&
        passwordEditText.text && passwordEditText.text.length > 0){
        
        checked = true;
    
    } else {
    
        checked = false;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [self sendConnectionQcm:sender];
    
    Constant* constant = [Constant new];
    AlertInfo* alertInfo = [AlertInfo new];
    
    if (checked == true) {
        
        //Checked if user exist
        for(UserQcm* itemUser in resUsers){
            if([loginEditText.text isEqualToString:itemUser.login]
               && [passwordEditText.text isEqualToString:itemUser.password]){
               
                /*********************************************QCM**************************/
                void( ^callback)(NSArray*) = ^(NSArray* qcms){
                    DAOQcm* daoQcm = [DAOQcm new];
                    NSArray* checkQcm = [daoQcm selectAll];
                    int i = 0;
                    
                    NSLog(@"Size of NSArray checkQcm = %lu",[checkQcm count]);
                    //Check if qcm from JSON exist in database
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
                //Call websrvice to get Qcm
                QcmWebServiceAdapter* services = [QcmWebServiceAdapter new];
                [services getAllQcm:callback];
                /**************************************************************************/
                
                /************************************QUESTION******************************/
                void( ^callbackQuestion)(NSArray*) = ^(NSArray* questions){
                    DAOQuestion* daoQuestion = [DAOQuestion new];
                    NSArray* checkQuestion = [daoQuestion selectAll];
                    int j = 0;
                    
                    NSLog(@"Size of NSArray checkQcm = %lu",[checkQuestion count]);
                    //Check if question from JSON exist in database
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
                
                //Call websrvice to get Question
                QuestionWebServiceAdapter* questionService = [QuestionWebServiceAdapter new];
                [questionService getAllQuestion:callbackQuestion];
                /**************************************************************************/
                
                /*********************GOODANSWER*******************************************/
                void( ^callbackGoodAnswer)(NSArray*) = ^(NSArray* goodAnswers){
                    DAOGoodAnswer* daoGoodAnswer = [DAOGoodAnswer new];
                    NSArray* checkGoodAnswer = [daoGoodAnswer selectAll];
                    int j = 0;
                    
                    //Check if goodAnswer from JSON exist in database
                    for (GoodAnswer* itemGoodAnswer in goodAnswers) {
                        GoodAnswer* getGoodAnswer;
                        if([checkGoodAnswer count] != 0){
                            getGoodAnswer = [checkGoodAnswer objectAtIndex:j];
                            if([itemGoodAnswer.answerQuestion isEqualToString:getGoodAnswer.answerQuestion]){
                                NSLog(@"Exist in database %@",itemGoodAnswer.answerQuestion);
                                j++;
                            } else {
                                [daoGoodAnswer insert:itemGoodAnswer];
                                j++;
                            }
                        }
                        if([checkGoodAnswer count] == 0)
                        {
                            [daoGoodAnswer insert:itemGoodAnswer];
                            
                        }
                    }
                };
                
                //Call websrvice to get goodAnswer
                GoodAnswerWebServiceAdapter* goodAnswerService = [GoodAnswerWebServiceAdapter new];
                [goodAnswerService getAllGoodAnswer:callbackGoodAnswer];
                /**************************************************************************/
                
                /**********************BADANSWER*******************************************/
                void( ^callbackBadAnswer)(NSArray*) = ^(NSArray* badAnswers){
                    DAOBadAnswer* daoBadAnswer = [DAOBadAnswer new];
                    NSArray* checkBadAnswer = [daoBadAnswer selectAll];
                    int j = 0;
                    
                    //Check if badAnswer from JSON exist in database
                    for (BadAnswer* itemBadAnswer in badAnswers) {
                        BadAnswer* getBadAnswer;
                        if([checkBadAnswer count] != 0){
                            getBadAnswer = [checkBadAnswer objectAtIndex:j];
                            if([itemBadAnswer.badAnswerQuestion isEqualToString:getBadAnswer.badAnswerQuestion]){
                                NSLog(@"Exist in database %@",itemBadAnswer.badAnswerQuestion);
                                j++;
                            } else {
                                [daoBadAnswer insert:itemBadAnswer];
                                j++;
                            }
                        }
                        if([checkBadAnswer count] == 0)
                        {
                            [daoBadAnswer insert:itemBadAnswer];
                            
                        }
                    }
                };
                
                //Call websrvice to get badAnswer
                BadAnswerWebServiceAdapter* badAnswerService = [BadAnswerWebServiceAdapter new];
                [badAnswerService getAllBadAnswer:callbackBadAnswer];
                /*************************************************************************/
            } else {
                [alertInfo alerMessage:self :constant.MESSAGE_ALERT_NOT_EXIST];
            }
        }
    } else {
        [alertInfo alerMessage:self :constant.MESSAGE_ALERT_LOGIN];
    }
}

@end
