//
//  TrackDetail.h
//  MusicSearch
//
//  Created by jitendra rajoria on 8/12/15.
//  Copyright (c) 2015 jitendra rajoria. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TrackDetail : NSObject

@property (nonatomic, strong) NSString *artist;
@property (nonatomic, strong) NSString *song;
@property (nonatomic, strong) NSString *lyrics;

-(instancetype)initWithDict:(NSDictionary *)dict;

@end
