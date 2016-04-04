//
//  weatherWebServiceAdapter.h
//  QCMapp
//
//  Created by etudiant on 08/03/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"

@interface weatherWebServiceAdapter : NSObject

+(NSString*) JSON_ID;
+(NSString*) JSON_DESCRIPTION;
+(NSString*) JSON_MAIN;

-(void)getWeather:(void (^)(Weather*))callback;
-(Weather*)extract:(NSDictionary*)json;
-(void)createWeather:(Weather*) weather withCallback:(void (^)(Weather*))callback;
-(void)updateWeather:(Weather*) weather withCallback:(void (^)(Weather*))callback;
-(NSDictionary*)itemToJson:(Weather*)weather;


@end
