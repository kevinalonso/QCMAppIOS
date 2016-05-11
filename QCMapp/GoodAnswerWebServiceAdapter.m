//
//  GoodAnswerWebServiceAdapter.m
//  QCMapp
//
//  Created by etudiant on 21/04/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import "GoodAnswerWebServiceAdapter.h"
#import "AFNetworking.h"
#import "GoodAnswer.h"

@implementation GoodAnswerWebServiceAdapter
@synthesize manager;

+(NSString*) JSON_GOODANSWER_TEXT{ return @"answerQuestion"; }
+(NSString*) JSON_GOODANSWER_FK{ return @"idQuestion"; }
+(NSString*) JSON_ARRAY_GOODANSWER{ return @"goodAnswers"; }
+(NSString *)URL_ALL_GOODANSWER{ return @"http://192.168.1.14/app_dev.php/api/all/good/answer"; }

//GET ALL GOODANSWER
-(void)getAllGoodAnswer:(void (^)(NSArray*))callback{
    
    manager = [AFHTTPSessionManager manager];
    NSString* url = GoodAnswerWebServiceAdapter.URL_ALL_GOODANSWER;
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray* goodAnswers = [self extractAll:responseObject];
        callback(goodAnswers);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error %@", error);
        callback(nil);
        
    }];
}

//EXTRACT GOODANSWER IN JSON FLOW
-(GoodAnswer*)extract:(NSDictionary*)json{
    GoodAnswer* goodAnswer = nil;
    if (json != nil) {
        goodAnswer = [GoodAnswer new];
        
        goodAnswer.answerQuestion = [json objectForKey:GoodAnswerWebServiceAdapter.JSON_GOODANSWER_TEXT];
        goodAnswer.idQuestion = [json objectForKey:GoodAnswerWebServiceAdapter.JSON_GOODANSWER_FK];
    }
    //Return class completed
    return goodAnswer;
}

//EXTRACT GOODANSWER FROM JSON FLOW
-(NSMutableArray*)extractAll:(NSDictionary*)json{
    NSMutableArray* goodAnswers = nil;
    
    if (json != nil) {
        goodAnswers = [NSMutableArray new];
        
        for (NSDictionary* dic in [json objectForKey:GoodAnswerWebServiceAdapter.JSON_ARRAY_GOODANSWER]) {
            GoodAnswer* goodAnswer = [self extract:dic];
            
            [goodAnswers addObject:goodAnswer];
        }
    }
    
    //Return array GoodAnswer
    return goodAnswers;
}

//CREATE GOODANSWER
-(void)createGoodAnswer:(GoodAnswer*) goodAnswer withCallback:(void (^)(GoodAnswer*))callback{
    manager = [AFHTTPSessionManager manager];
    
    NSString* url = GoodAnswerWebServiceAdapter.URL_ALL_GOODANSWER;
    
    [manager POST:url parameters:[self itemToJson:goodAnswer]progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        GoodAnswer* goodAnswer = [self extract:responseObject];
        callback(goodAnswer);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"Error %@", error);
        callback(nil);
        
    }];
}

//UPDATE GOODANSWER
-(void)updateGoodAnswer:(GoodAnswer*) goodAnswer withCallback:(void (^)(GoodAnswer*))callback{
    manager = [AFHTTPSessionManager manager];
    
    NSString* url = GoodAnswerWebServiceAdapter.URL_ALL_GOODANSWER;
    
    [manager PUT:url parameters:[self itemToJson:goodAnswer] success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        GoodAnswer* goodAnswer = [self extract:responseObject];
        callback(goodAnswer);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"Error %@", error);
        callback(nil);
    }];
}

//Get and set item in class from json flow
-(NSDictionary*)itemToJson:(GoodAnswer*)goodAnswer{
    NSDictionary* result = nil;
    if(goodAnswer != nil){
        result = [NSDictionary dictionaryWithObjectsAndKeys:
                  goodAnswer.answerQuestion, GoodAnswerWebServiceAdapter.JSON_GOODANSWER_TEXT,
                  goodAnswer.idQuestion, GoodAnswerWebServiceAdapter.JSON_GOODANSWER_FK,nil];
    }
    return result;
}

@end
