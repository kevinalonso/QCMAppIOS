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

//Name element in the json flow to extract
+(NSString*) JSON_GOODANSWER_TEXT;
+(NSString*) JSON_GOODANSWER_FK;
+(NSString*) JSON_ARRAY_GOODANSWER;
+(NSString *)URL_ALL_GOODANSWER;

//Return all goodAnswer in database
-(void)getAllGoodAnswer:(void (^)(NSArray*))callback;

//get goodAnswer from json
-(GoodAnswer*)extract:(NSDictionary*)json;

//Extract all goodAnswer from json
-(NSMutableArray*)extractAll:(NSDictionary*)json;

//Create goodAnswer in databse from the mobile
-(void)createGoodAnswer:(GoodAnswer*)goodAnswer withCallback:(void (^)(GoodAnswer*))callback;

//Update goodAnswer in databse from the mobile
-(void)updateGoodAnswer:(GoodAnswer*)goodAnswer withCallback:(void (^)(GoodAnswer*))callback;

//Transform goodAnswer from entity to json
-(NSDictionary*)itemToJson:(GoodAnswer*)goodAnswer;

@end
