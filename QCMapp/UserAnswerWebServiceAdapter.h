//
//  UserAnswer.h
//  QCMapp
//
//  Created by etudiant on 04/05/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
#import "AnswerUser.h"

@interface UserAnswerWebServiceAdapter : NSObject

@property AFHTTPSessionManager* manager;

//Name element in the json flow to extract
+(NSString*)JSON_SENDANSWER;
+(NSString*)JSON_QCM_ID;
+(NSString*)JSON_QUESTION_ID;
+(NSString *)URL_POST_ANSWER;

//Create userAnswer in databse from the mobile
-(void)createUserAnswer:(AnswerUser*) answerUser withCallback:(void (^)(AnswerUser*))callback;

//Transform badAnswer from entity to json
-(NSDictionary*)itemToJson:(AnswerUser*)answerUser;

@end
