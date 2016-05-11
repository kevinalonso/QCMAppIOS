//
//  BadAnswerServiceAdapter.h
//  QCMapp
//
//  Created by etudiant on 21/04/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BadAnswer.h"
#import "AFHTTPSessionManager.h"

@interface BadAnswerWebServiceAdapter : NSObject

@property AFHTTPSessionManager* manager;

//Name element in the json flow to extract
+(NSString*) JSON_BADANSWER_TEXT;
+(NSString*) JSON_BADANSWER_FK;
+(NSString*) JSON_ARRAY_BADANSWER;
+(NSString *)URL_ALL_BADANSWER;

//Return all badAnswer in database
-(void)getAllBadAnswer:(void (^)(NSArray*))callback;

//get badAnswer from json
-(BadAnswer*)extract:(NSDictionary*)json;

//Extract all badAnswer from json
-(NSMutableArray*)extractAll:(NSDictionary*)json;

//Create badAnswer in databse from the mobile
-(void)createBadAnswer:(BadAnswer*)badAnswer withCallback:(void (^)(BadAnswer*))callback;

//Update badAnswer in databse from the mobile
-(void)updateBadAnswer:(BadAnswer*)badAnswer withCallback:(void (^)(BadAnswer*))callback;

//Transform badAnswer from entity to json
-(NSDictionary*)itemToJson:(BadAnswer*)badAnswer;

@end
