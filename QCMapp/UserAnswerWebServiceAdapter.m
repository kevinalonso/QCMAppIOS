//
//  UserAnswer.m
//  QCMapp
//
//  Created by etudiant on 04/05/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import "UserAnswerWebServiceAdapter.h"
#import "AnswerUser.h"
#import "AFNetworking.h"

@implementation UserAnswerWebServiceAdapter
@synthesize manager;


+(NSString*)JSON_SENDANSWER{return @"idAnswer";}
+(NSString*)JSON_QCM_ID{ return @"idQcm";}
+(NSString*)JSON_QUESTION_ID{ return @"idQuestion";}
+(NSString*)JSON_USER_ID{ return @"idUser";}
+(NSString*)JSON_POINT{ return @"point";}
+(NSString *)URL_POST_ANSWER{ return @"http://192.168.1.14/app_dev.php/api/answers/users/new";}

//CREATE USERANSWER
-(void)createUserAnswer:(AnswerUser*) answerUser withCallback:(void (^)(AnswerUser*))callback{
    manager = [AFHTTPSessionManager manager];
    
    NSString* url = UserAnswerWebServiceAdapter.URL_POST_ANSWER;
    //AnswerUser* answerUser = [AnswerUser new];
    [manager POST:url parameters:[self itemToJson:answerUser]progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        AnswerUser* answerUser = [self extract:responseObject];
        callback(answerUser);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"Error %@", error);
        callback(nil);
        
    }];
}

//EXTRACT ANSWER IN JSON FLOW
-(AnswerUser*)extract:(NSDictionary*)json{
    AnswerUser* answerUser = nil;
    if (json != nil) {
        answerUser = [AnswerUser new];
        
        answerUser.sendAnswer = [[json objectForKey:UserAnswerWebServiceAdapter.JSON_SENDANSWER]integerValue];
        answerUser.sendQcm = [[json objectForKey:UserAnswerWebServiceAdapter.JSON_QCM_ID]integerValue];
        answerUser.sendQuestion = [[json objectForKey:UserAnswerWebServiceAdapter.JSON_QUESTION_ID]integerValue];
        answerUser.idUserConnect = [[json objectForKey:UserAnswerWebServiceAdapter.JSON_USER_ID]integerValue];
        answerUser.pointAnswer = [[json objectForKey:UserAnswerWebServiceAdapter.JSON_POINT]integerValue];
    }
    //Return class completed
    return answerUser;
}

//Get and set item in class from json flow
-(NSDictionary*)itemToJson:(AnswerUser*)answerUser{
    NSDictionary* result = nil;
    if(answerUser != nil){
        result = [NSDictionary dictionaryWithObjectsAndKeys:
                  [NSNumber numberWithInteger:answerUser.sendAnswer],UserAnswerWebServiceAdapter.JSON_SENDANSWER,
                  [NSNumber numberWithInteger:answerUser.sendQcm], UserAnswerWebServiceAdapter.JSON_QCM_ID,
                  [NSNumber numberWithInteger:answerUser.sendQuestion], UserAnswerWebServiceAdapter.JSON_QUESTION_ID,
                  [NSNumber numberWithInteger:answerUser.idUserConnect], UserAnswerWebServiceAdapter.JSON_USER_ID,
                  [NSNumber numberWithInteger:answerUser.pointAnswer],
                  UserAnswerWebServiceAdapter.JSON_POINT ,nil];
    }
    return result;
}
@end
