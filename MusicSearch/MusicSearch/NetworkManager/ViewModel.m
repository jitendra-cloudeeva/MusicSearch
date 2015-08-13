//
//  ViewModel.m
//  MusicSearch
//
//  Created by jitendra rajoria on 8/12/15.
//  Copyright (c) 2015 jitendra rajoria. All rights reserved.
//


#import "ViewModel.h"
#import "AFNetworking.h"
#import "Track.h"
#import "XMLDictionary.h"
#import "TrackDetail.h"

@implementation ViewModel


+ (instancetype)allocWithZone:(NSZone *)zone
{
    static dispatch_once_t onceQueue;
    static ViewModel *sharedManager = nil;
    dispatch_once(&onceQueue, ^{
        
        if (sharedManager == nil) {
            sharedManager = [super allocWithZone:zone];
        }
    });
    
    return sharedManager;
}

+(instancetype)sharedManager{
    
    static dispatch_once_t once = 0;
    static ViewModel *sharedManager;
    
    if (sharedManager) {
        return sharedManager;
    }
    
    dispatch_once(&once, ^{
        
        if (!sharedManager) {
            sharedManager = [[ViewModel alloc]init];
        }
    });
    
    return sharedManager;
}

-(void)getTrackListWithURl:(NSString *)urlString withCompletionBlock:(completionBlock)completionBlock{
    
    NSMutableArray *dataSourceArray = [[NSMutableArray alloc] init];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseData) {
        if (responseData) {
            NSArray *dataArray = (NSArray *)responseData[@"results"];
            
            for (NSDictionary *dict in dataArray) {
                Track *track = [[Track alloc] initWithDict:dict];
                [dataSourceArray addObject:track];
                
            }
            completionBlock([dataSourceArray mutableCopy]);
                   
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error){
        NSLog(@"Error %@",error);
        completionBlock(nil);
    }];
}

-(void)getTrackDetailWithURL:(NSString *)urlString withCompletionBlock:(completionBlock)completionBlock{
    
    NSMutableArray *dataSourceArray = [[NSMutableArray alloc] init];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    
    [manager GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseData) {
        if (responseData) {
            
            // using xml parser since response was not formatted as json
            NSDictionary *dataArray = [[XMLDictionaryParser sharedInstance] dictionaryWithParser:responseData];
            
            TrackDetail *track = [[TrackDetail alloc] initWithDict:dataArray];
            [dataSourceArray addObject:track];
                
            
            completionBlock([dataSourceArray mutableCopy]);
            
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error){
        NSLog(@"Error %@",error);
        completionBlock(nil);
    }];
}

@end
