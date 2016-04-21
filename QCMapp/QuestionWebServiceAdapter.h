//
//  QuestionWebServiceAdapter.h
//  QCMapp
//
//  Created by etudiant on 19/04/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"
#import "AFHTTPSessionManager.h"

@interface QuestionWebServiceAdapter : NSObject

@property AFHTTPSessionManager* manager;

+(NSString*) JSON_QUESTION_TEXT;
+(NSString*) JSON_ARRAY_QUESTION;
+(NSString*) JSON_QUESTION_FK;
+(NSString *)URL_ALL_QUESTION;
+(NSString *)URL_ONE_QUESTION;


-(void)getOneQuestion:(void (^)(Question*))callback;
-(void)getAllQuestion:(void (^)(NSArray*))callback;
-(Question*)extract:(NSDictionary*)json;
-(NSMutableArray*)extractAll:(NSDictionary*)json;
-(void)createQuestion:(Question*) question withCallback:(void (^)(Question*))callback;
-(void)updateQuestion:(Question*) question withCallback:(void (^)(Question*))callback;
-(NSDictionary*)itemToJson:(Question*)question;

@end
