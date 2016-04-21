//
//  GoodAnswerWebServiceAdapter.h
//  QCMapp
//
//  Created by etudiant on 21/04/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GoodAnswer.h"
#import "AFHTTPSessionManager.h"

@interface GoodAnswerWebServiceAdapter : NSObject

@property AFHTTPSessionManager* manager;

+(NSString*) JSON_GOODANSWER_TEXT;
+(NSString*) JSON_GOODANSWER_FK;
+(NSString*) JSON_ARRAY_GOODANSWER;
+(NSString *)URL_ALL_GOODANSWER;


-(void)getAllGoodAnswer:(void (^)(NSArray*))callback;
-(GoodAnswer*)extract:(NSDictionary*)json;
-(NSMutableArray*)extractAll:(NSDictionary*)json;
-(void)createGoodAnswer:(GoodAnswer*)goodAnswer withCallback:(void (^)(GoodAnswer*))callback;
-(void)updateGoodAnswer:(GoodAnswer*)goodAnswer withCallback:(void (^)(GoodAnswer*))callback;
-(NSDictionary*)itemToJson:(GoodAnswer*)goodAnswer;

@end
