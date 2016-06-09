//
//  UserQcmWebServiceAdapter.m
//  QCMapp
//
//  Created by etudiant on 08/06/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import "UserQcmWebServiceAdapter.h"
#import "UserQcm.h"
#import "AFNetworking.h"

@implementation UserQcmWebServiceAdapter

@synthesize manager;

+(NSString*) JSON_USER_ID{return @"id";}
+(NSString*) JSON_USER_LOGIN{ return @"login"; }
+(NSString*) JSON_USER_PASSWORD{ return @"password"; }
+(NSString *)JSON_USER_TYPE{ return @"idType"; }
+(NSString*) JSON_ARRAY_USER{ return @"users"; }
+(NSString *)URL_ALL_USER{ return @"http://192.168.0.47/QCM/web/app_dev.php/api/all/users"; }

//EXTRACT USER FROM JSON FLOW
-(NSMutableArray*)extractAll:(NSDictionary*)json{
    NSMutableArray* users = nil;
    
    if (json != nil) {
        users = [NSMutableArray new];
        
        for (NSDictionary* dic in [json objectForKey:UserQcmWebServiceAdapter.JSON_ARRAY_USER]) {
            UserQcm* user = [self extract:dic];
            NSLog(@"FROM JSON %@",user.login);
            [users addObject:user];
        }
    }
    
    //Return array User
    return users;
}

//EXTRACT USER IN JSON FLOW
-(UserQcm*)extract:(NSDictionary*)json{
    UserQcm* user = nil;
    
    if (json != nil) {
        user = [UserQcm new];
        
        user.login = [json objectForKey:UserQcmWebServiceAdapter.JSON_USER_LOGIN];
        user.password= [json objectForKey:UserQcmWebServiceAdapter.JSON_USER_PASSWORD];
        user.idUserQcm = [json objectForKey:UserQcmWebServiceAdapter.JSON_USER_ID];
    }
    //Return class completed
    return user;
}

//GET ALL USER
-(void)getAllUser:(void (^)(NSArray*))callback{
    
    manager = [AFHTTPSessionManager manager];
    NSString* url = UserQcmWebServiceAdapter.URL_ALL_USER;
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray* users = [self extractAll:responseObject];
        callback(users);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"toto");
        NSLog(@"Error %@", error);
        callback(nil);
        
    }];
}

@end
