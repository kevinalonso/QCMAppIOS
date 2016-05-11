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

//Name element in the json flow to extract
+(NSString*) JSON_QUESTION_TEXT;
+(NSString*) JSON_ARRAY_QUESTION;
+(NSString*) JSON_QUESTION_FK;
+(NSString *)URL_ALL_QUESTION;
+(NSString *)URL_ONE_QUESTION;

//Retunr on question
-(void)getOneQuestion:(void (^)(Question*))callback;

//Return all qcm in database
-(void)getAllQuestion:(void (^)(NSArray*))callback;

//get question from json
-(Question*)extract:(NSDictionary*)json;

//Extract all question from json
-(NSMutableArray*)extractAll:(NSDictionary*)json;

//Add new question in database in the mobile
-(void)createQuestion:(Question*) question withCallback:(void (^)(Question*))callback;

//Update question in databse from the mobile
-(void)updateQuestion:(Question*) question withCallback:(void (^)(Question*))callback;

//Transform question from entity to json
-(NSDictionary*)itemToJson:(Question*)question;

@end
