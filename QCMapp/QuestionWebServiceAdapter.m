//
//  QuestionWebServiceAdapter.m
//  QCMapp
//
//  Created by etudiant on 19/04/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import "QuestionWebServiceAdapter.h"
#import "Question.h"
#import "AFNetworking.h"

@implementation QuestionWebServiceAdapter
@synthesize manager;

+(NSString*) JSON_QUESTION_TEXT{ return @"textQuestion"; }
+(NSString*) JSON_QUESTION_FK{ return @"idQcm"; }
+(NSString*) JSON_ARRAY_QUESTION{ return @"questions"; }
+(NSString *)URL_ALL_QUESTION{ return @"http://192.168.1.14/app_dev.php/api/all/question"; }
+(NSString *)URL_ONE_QUESTION{ return @"http://192.168.1.14/app_dev.php/api/all/question"; }


-(void)getOneQuestion:(void (^)(Question*))callback{
    
    manager = [AFHTTPSessionManager manager];
    NSString* url = QuestionWebServiceAdapter.URL_ONE_QUESTION;
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        Question* question = [self extract:responseObject];
        callback(question);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"Error %@", error);
        callback(nil);
    }];
}

-(void)getAllQuestion:(void (^)(NSArray*))callback{
    manager = [AFHTTPSessionManager manager];
    NSString* url = QuestionWebServiceAdapter.URL_ALL_QUESTION;
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray* questions = [self extractAll:responseObject];
        callback(questions);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"toto");
        NSLog(@"Error %@", error);
        callback(nil);
        
    }];
}

-(Question*)extract:(NSDictionary*)json{
    Question* question = nil;
    
    if (json != nil) {
        question = [Question new];
        
        question.textQuestion = [json objectForKey:QuestionWebServiceAdapter.JSON_QUESTION_TEXT];
        question.idQcm = [json objectForKey:QuestionWebServiceAdapter.JSON_QUESTION_FK];
    }
    //Return class completed
    return question;
}

-(NSMutableArray*)extractAll:(NSDictionary*)json{
    NSMutableArray* questions = nil;
    
    if (json != nil) {
        questions = [NSMutableArray new];
        
        for (NSDictionary* dic in [json objectForKey:QuestionWebServiceAdapter.JSON_ARRAY_QUESTION]) {
            Question* question = [self extract:dic];
            
            NSLog(@"FROM JSON %@",question.textQuestion);
            
            [questions addObject:question];
        }
    }
    
    //Return array Qcm
    return questions;
}

-(void)createQuestion:(Question*) question withCallback:(void (^)(Question*))callback{
    manager = [AFHTTPSessionManager manager];
    
    NSString* url = QuestionWebServiceAdapter.URL_ALL_QUESTION;
    
    [manager POST:url parameters:[self itemToJson:question]progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        Question* question = [self extract:responseObject];
        callback(question);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"Error %@", error);
        callback(nil);
        
    }];
}

-(void)updateQuestion:(Question*) question withCallback:(void (^)(Question*))callback{
    manager = [AFHTTPSessionManager manager];
    
    NSString* url = QuestionWebServiceAdapter.URL_ALL_QUESTION;
    
    [manager PUT:url parameters:[self itemToJson:question] success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        Question* question = [self extract:responseObject];
        callback(question);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"Error %@", error);
        callback(nil);
    }];
}

-(NSDictionary*)itemToJson:(Question*)question{
    NSDictionary* result = nil;
    if(question != nil){
        result = [NSDictionary dictionaryWithObjectsAndKeys:
                  question.textQuestion, QuestionWebServiceAdapter.JSON_QUESTION_TEXT,
                  question.idQcm, QuestionWebServiceAdapter.JSON_QUESTION_FK,nil];
    }
    return result;
}

@end
