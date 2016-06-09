//
//  UserQcmWebServiceAdapter.h
//  QCMapp
//
//  Created by etudiant on 08/06/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
#import "UserQcm.h"

@interface UserQcmWebServiceAdapter : NSObject

@property AFHTTPSessionManager* manager;

+(NSString*) JSON_USER_ID;
+(NSString*) JSON_USER_LOGIN;
+(NSString*) JSON_USER_PASSWORD;
+(NSString *)JSON_USER_TYPE;
+(NSString*) JSON_ARRAY_USER;
+(NSString *)URL_ALL_USER;

//Extract all user from json
-(NSMutableArray*)extractAll:(NSDictionary*)json;

//EXTRACT USER IN JSON FLOW
-(UserQcm*)extract:(NSDictionary*)json;

//GET ALL USER
-(void)getAllUser:(void (^)(NSArray*))callback;


@end
