//
//  QcmWebServiceAdapter.m
//  QCMapp
//
//  Created by etudiant on 08/03/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import "QcmWebServiceAdapter.h"
#import "Qcm.h"
#import "AFNetworking.h"

@implementation QcmWebServiceAdapter

@synthesize manager;

+(NSString*) JSON_QCM_NAME{ return @"nameQcm"; }
+(NSString*) JSON_QCM_ID{return @"id";}
+(NSString*) JSON_QCM_DATE_START{ return @"dateStart"; }
+(NSString*) JSON_QCM_DATE_END{ return @"dateEnd"; }
+(NSString*) JSON_QCM_IS_ACTIVE{ return @"isActive"; }
+(NSString*) JSON_ARRAY_QCM{ return @"qcm"; }
+(NSString *)URL_ALL_QCM{ return @"http://192.168.1.14/app_dev.php/api/all/qcm"; }
+(NSString *)URL_ONE_QCM{ return @"http://192.168.1.14/app_dev.php/api/all/qcm"; }

//GET QCM
-(void)getOneQcm:(void (^)(Qcm*))callback{
    
    manager = [AFHTTPSessionManager manager];
    NSString* url = QcmWebServiceAdapter.URL_ONE_QCM;
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        Qcm* qcm = [self extract:responseObject];
        callback(qcm);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"Error %@", error);
        callback(nil);
        
    }];
}

//GET ALL QCM
-(void)getAllQcm:(void (^)(NSArray*))callback{
    
    manager = [AFHTTPSessionManager manager];
    NSString* url = QcmWebServiceAdapter.URL_ALL_QCM;
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray* qcms = [self extractAll:responseObject];
        callback(qcms);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"toto");
        NSLog(@"Error %@", error);
        callback(nil);
        
    }];
}

//EXTRACT QCM IN JSON FLOW
-(Qcm*)extract:(NSDictionary*)json{
    Qcm* qcm = nil;
    
    if (json != nil) {
        qcm = [Qcm new];
        
        qcm.nameQcm = [json objectForKey:QcmWebServiceAdapter.JSON_QCM_NAME];
        qcm.dateStart= [json objectForKey:QcmWebServiceAdapter.JSON_QCM_DATE_START];
        qcm.dateEnd = [json objectForKey:QcmWebServiceAdapter.JSON_QCM_DATE_END];
        qcm.isActive = [[json objectForKey:QcmWebServiceAdapter.JSON_QCM_IS_ACTIVE] boolValue];
    }
    //Return class completed
    return qcm;
}

//EXTRACT QCM FROM JSON FLOW
-(NSMutableArray*)extractAll:(NSDictionary*)json{
    NSMutableArray* qcms = nil;
    
    if (json != nil) {
        qcms = [NSMutableArray new];
        
        for (NSDictionary* dic in [json objectForKey:QcmWebServiceAdapter.JSON_ARRAY_QCM]) {
            Qcm* qcm = [self extract:dic];
            
            NSLog(@"FROM JSON %@",qcm.nameQcm);
            
            [qcms addObject:qcm];
        }
    }

    //Return array Qcm
    return qcms;
}

//CREATE QCM
-(void)createQcm:(Qcm*) qcm withCallback:(void (^)(Qcm*))callback{
    
    manager = [AFHTTPSessionManager manager];
    
    NSString* url = QcmWebServiceAdapter.URL_ALL_QCM;
    
    [manager POST:url parameters:[self itemToJson:qcm]progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        Qcm* qcm = [self extract:responseObject];
        callback(qcm);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"Error %@", error);
        callback(nil);
        
    }];
}

//UPDATE QCM
-(void)updateQcm:(Qcm*) qcm withCallback:(void (^)(Qcm*))callback{
   
    manager = [AFHTTPSessionManager manager];
    
    NSString* url = QcmWebServiceAdapter.URL_ALL_QCM;
    
    [manager PUT:url parameters:[self itemToJson:qcm] success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        Qcm* qcm = [self extract:responseObject];
        callback(qcm);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"Error %@", error);
        callback(nil);
    }];
}


//Get and set item in class from json flow
-(NSDictionary*)itemToJson:(Qcm*)qcm{
    NSDictionary* result = nil;
    if(qcm != nil){
        result = [NSDictionary dictionaryWithObjectsAndKeys:
                  qcm.idQcm, QcmWebServiceAdapter.JSON_QCM_ID,
                  qcm.nameQcm, QcmWebServiceAdapter.JSON_QCM_NAME,
                  qcm.dateStart, QcmWebServiceAdapter.JSON_QCM_DATE_START,
                  qcm.dateEnd, QcmWebServiceAdapter.JSON_QCM_DATE_END,
                  qcm.isActive, QcmWebServiceAdapter.JSON_QCM_IS_ACTIVE,nil];
    }
    return result;
}


@end
