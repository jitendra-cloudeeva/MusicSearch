//
//  Track.m
//  MusicSearch
//
//  Created by jitendra rajoria on 8/12/15.
//  Copyright (c) 2015 jitendra rajoria. All rights reserved.
//

#import "Track.h"

@implementation Track

-(instancetype)initWithDict:(NSDictionary *)dict{
  
    self = [super init];
    if (self) {
        self.trackName = dict[@"trackName"];
        self.artistName = dict[@"artistName"];
        self.albumImageURL = dict[@"artworkUrl100"];
        self.collectionName = dict[@"collectionName"];
        self.lyrics = dict[@"lyrics"];

    }
    return self;
}
@end
