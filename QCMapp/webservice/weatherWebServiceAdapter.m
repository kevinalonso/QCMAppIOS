//
//  weatherWebServiceAdapter.m
//  QCMapp
//
//  Created by etudiant on 08/03/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import "weatherWebServiceAdapter.h"
#import "AFNetworking.h"

@implementation weatherWebServiceAdapter

+(NSString *)JSON_ID{ return @"id"; }
+(NSString *)JSON_DESCRIPTION{ return @"description"; }
+(NSString *)JSON_MAIN{ return @"main"; }

//SELECT
-(void)getWeather:(void (^)(Weather *))callback{
    
    //Permet de créer la session
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    
    NSString* url = @"http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=44db6a862fba0b067b1930da0d769e98";
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        Weather* weather = [self extract:responseObject];
        callback(weather);
        
        //NSLog(@"JSON : %@", responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        NSLog(@"Error : %@",error);
        callback(nil);
    }];
    
}

//CREATE
-(void)createWeather:(Weather*) weather withCallback:(void (^)(Weather*))callback{
    
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    
    NSString* url = @"http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=44db6a862fba0b067b1930da0d769e98";
    
    [manager POST:url parameters:[self itemToJson:weather]progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        Weather* weather = [self extract:responseObject];
        callback(weather);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"Error %@", error);
        callback(nil);
        
    }];
}

//UPDATE
-(void)updateWeather:(Weather*) weather withCallback:(void (^)(Weather*))callback{
    
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    
    NSString* url = @"http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=44db6a862fba0b067b1930da0d769e98";
    
    [manager PUT:url parameters:[self itemToJson:weather] success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        Weather* weather = [self extract:responseObject];
        callback(weather);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"Error %@", error);
        callback(nil);
    }];
}


//Extraction u flux JSon
-(Weather*)extract:(NSDictionary*)json{
    Weather* weather = nil;
    
    if (json != nil) {
        weather = [Weather new];
        NSArray*  weathers = [json objectForKey:@"weather"];
        
        //Flux JSon est un NSDictionary
        NSDictionary* weatherDic = [weathers objectAtIndex:0];
        
        
        weather.idServer = [[weatherDic objectForKey:weatherWebServiceAdapter.JSON_ID] intValue];
        weather.description = [weatherDic objectForKey:weatherWebServiceAdapter.JSON_DESCRIPTION];
        weather.main = [weatherDic objectForKey:weatherWebServiceAdapter.JSON_MAIN];
    }
    //Retourne la classe une alimenté depuis le json
    return weather;
}

-(NSDictionary*)itemToJson:(Weather*)weather{
    NSDictionary* result = nil;
    if(weather != nil){
        result = [NSDictionary dictionaryWithObjectsAndKeys:
                  [NSNumber numberWithInt:weather.idServer], weatherWebServiceAdapter.JSON_ID,
                  weather.description, weatherWebServiceAdapter.JSON_DESCRIPTION,
                  weather.main, weatherWebServiceAdapter.JSON_MAIN, nil];
    }
    
    return result;
}


@end
