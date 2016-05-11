//
//  BadAnswerServiceAdapter.m
//  QCMapp
//
//  Created by etudiant on 21/04/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import "BadAnswerWebServiceAdapter.h"
#import "AFNetworking.h"
#import "BadAnswer.h"

@implementation BadAnswerWebServiceAdapter
@synthesize manager;

+(NSString*) JSON_BADANSWER_TEXT{ return @"badAnswerQuestion"; }
+(NSString*) JSON_BADANSWER_FK{ return @"idQuestion"; }
+(NSString*) JSON_ARRAY_BADANSWER{ return @"badAnswers"; }
+(NSString *)URL_ALL_BADANSWER{ return @"http://192.168.1.14/app_dev.php/api/all/bad/answer"; }
//GET BADANSWER
-(void)getAllBadAnswer:(void (^)(NSArray*))callback{
    
    manager = [AFHTTPSessionManager manager];
    NSString* url = BadAnswerWebServiceAdapter.URL_ALL_BADANSWER;
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray* badAnswers = [self extractAll:responseObject];
        callback(badAnswers);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error %@", error);
        callback(nil);
        
    }];
}

//EXTRACT BADANSWER IN JSON FLOW
-(BadAnswer*)extract:(NSDictionary*)json{
    BadAnswer* badAnswer = nil;
    if (json != nil) {
        badAnswer = [BadAnswer new];
        
        badAnswer.badAnswerQuestion = [json objectForKey:BadAnswerWebServiceAdapter.JSON_BADANSWER_TEXT];
        badAnswer.idQuestion = [json objectForKey:BadAnswerWebServiceAdapter.JSON_BADANSWER_FK];
    }
    //Return class completed
    return badAnswer;
}

//EXTRACT BADANSWER FROM JSON FLOW
-(NSMutableArray*)extractAll:(NSDictionary*)json{
    NSMutableArray* badAnswers = nil;
    
    if (json != nil) {
        badAnswers = [NSMutableArray new];
        
        for (NSDictionary* dic in [json objectForKey:BadAnswerWebServiceAdapter.JSON_ARRAY_BADANSWER]) {
            BadAnswer* badAnswer = [self extract:dic];
            
            [badAnswers addObject:badAnswer];
        }
    }
    
    //Return array GoodAnswer
    return badAnswers;
}

//CREATE BADANSWER
-(void)createBadAnswer:(BadAnswer*) badAnswer withCallback:(void (^)(BadAnswer*))callback{
    manager = [AFHTTPSessionManager manager];
    
    NSString* url = BadAnswerWebServiceAdapter.URL_ALL_BADANSWER;
    
    [manager POST:url parameters:[self itemToJson:badAnswer]progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        BadAnswer* badAnswer = [self extract:responseObject];
        callback(badAnswer);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"Error %@", error);
        callback(nil);
        
    }];
}

//UPDATE BADANSWER
-(void)updateBadAnswer:(BadAnswer*) badAnswer withCallback:(void (^)(BadAnswer*))callback{
    manager = [AFHTTPSessionManager manager];
    
    NSString* url = BadAnswerWebServiceAdapter.URL_ALL_BADANSWER;
    
    [manager PUT:url parameters:[self itemToJson:badAnswer] success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        BadAnswer* badAnswer = [self extract:responseObject];
        callback(badAnswer);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"Error %@", error);
        callback(nil);
    }];
}

//Get and set item in class from json flow
-(NSDictionary*)itemToJson:(BadAnswer*)badAnswer{
    NSDictionary* result = nil;
    if(badAnswer != nil){
        result = [NSDictionary dictionaryWithObjectsAndKeys:
                  badAnswer.badAnswerQuestion, BadAnswerWebServiceAdapter.JSON_BADANSWER_TEXT,
                  badAnswer.idQuestion, BadAnswerWebServiceAdapter.JSON_BADANSWER_FK,nil];
    }
    return result;
}

@end
