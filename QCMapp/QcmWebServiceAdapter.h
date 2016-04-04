//
//  QcmWebServiceAdapter.h
//  QCMapp
//
//  Created by etudiant on 08/03/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Qcm.h"
#import "AFHTTPSessionManager.h"

@interface QcmWebServiceAdapter : NSObject

@property AFHTTPSessionManager* manager;

+(NSString*) JSON_QCM_NAME;
+(NSString*) JSON_QCM_DATE_START;
+(NSString*) JSON_QCM_DATE_END;
+(NSString*) JSON_QCM_IS_ACTIVE;
+(NSString*) JSON_ARRAY_QCM;
+(NSString *)URL_ALL_QCM;
+(NSString *)URL_ONE_QCM;


-(void)getOneQcm:(void (^)(Qcm*))callback;
-(void)getAllQcm:(void (^)(NSArray*))callback;
-(Qcm*)extract:(NSDictionary*)json;
-(NSMutableArray*)extractAll:(NSDictionary*)json;
-(void)createQcm:(Qcm*) qcm withCallback:(void (^)(Qcm*))callback;
-(void)updateQcm:(Qcm*) qcm withCallback:(void (^)(Qcm*))callback;
-(NSDictionary*)itemToJson:(Qcm*)qcm;

@end
