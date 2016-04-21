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

+(NSString*) JSON_BADANSWER_TEXT;
+(NSString*) JSON_BADANSWER_FK;
+(NSString*) JSON_ARRAY_BADANSWER;
+(NSString *)URL_ALL_BADANSWER;


-(void)getAllBadAnswer:(void (^)(NSArray*))callback;
-(BadAnswer*)extract:(NSDictionary*)json;
-(NSMutableArray*)extractAll:(NSDictionary*)json;
-(void)createBadAnswer:(BadAnswer*)badAnswer withCallback:(void (^)(BadAnswer*))callback;
-(void)updateBadAnswer:(BadAnswer*)badAnswer withCallback:(void (^)(BadAnswer*))callback;
-(NSDictionary*)itemToJson:(BadAnswer*)badAnswer;

@end
