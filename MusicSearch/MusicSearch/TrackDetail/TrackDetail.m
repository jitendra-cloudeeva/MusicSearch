//
//  TrackDetail.h
//  MusicSearch
//
//  Created by jitendra rajoria on 8/12/15.
//  Copyright (c) 2015 jitendra rajoria. All rights reserved.
//

#import "TrackDetail.h"

@implementation TrackDetail

-(instancetype)initWithDict:(NSDictionary *)dict{
    
    self = [super init];
    if (self) {
        self.artist = dict[@"artist"];
        self.song = dict[@"song"];
        self.lyrics = dict[@"lyrics"];
    }
    return self;
}

@end
