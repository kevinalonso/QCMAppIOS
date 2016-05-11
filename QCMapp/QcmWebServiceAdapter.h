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

//Name element in the json flow to extract
+(NSString*) JSON_QCM_ID;
+(NSString*) JSON_QCM_NAME;
+(NSString*) JSON_QCM_DATE_START;
+(NSString*) JSON_QCM_DATE_END;
+(NSString*) JSON_QCM_IS_ACTIVE;
+(NSString*) JSON_ARRAY_QCM;
+(NSString *)URL_ALL_QCM;
+(NSString *)URL_ONE_QCM;

//Retunr on qcm
-(void)getOneQcm:(void (^)(Qcm*))callback;

//Return all qcm in database
-(void)getAllQcm:(void (^)(NSArray*))callback;

//get qcm from json
-(Qcm*)extract:(NSDictionary*)json;

//Extract all qcm from json
-(NSMutableArray*)extractAll:(NSDictionary*)json;

//Add new qcm in database in the mobile
-(void)createQcm:(Qcm*) qcm withCallback:(void (^)(Qcm*))callback;

//Update qcm in databse from the mobile
-(void)updateQcm:(Qcm*) qcm withCallback:(void (^)(Qcm*))callback;

//Transform qcm from entity to json
-(NSDictionary*)itemToJson:(Qcm*)qcm;

@end
