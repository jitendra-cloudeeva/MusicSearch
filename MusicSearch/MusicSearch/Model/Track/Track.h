//
//  Track.h
//  MusicSearch
//
//  Created by jitendra rajoria on 8/12/15.
//  Copyright (c) 2015 jitendra rajoria. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Track : NSObject
@property (nonatomic, strong) NSString *trackName;
@property (nonatomic, strong) NSString *artistName;
@property (nonatomic, strong) NSString *albumImageURL;
@property (nonatomic, strong) NSString *collectionName;

-(instancetype)initWithDict:(NSDictionary *)dict;
@end
