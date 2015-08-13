//
//  TrackCell.m
//  MusicSearch
//
//  Created by jitendra rajoria on 8/12/15.
//  Copyright (c) 2015 jitendra rajoria. All rights reserved.
//

#import "TrackCell.h"
#import "UIKit+AFNetworking.h"


@implementation TrackCell
-(void)setDataWithTrack:(Track *)track{
    
    self.lblTrackName.text = track.trackName;
    self.lblTrackName.numberOfLines = 0;
    [self.lblTrackName sizeToFit];
    
    self.lblArtistName.text = track.artistName;
    self.lblArtistName.numberOfLines = 0;
    [self.lblArtistName sizeToFit];
    
    self.lblAlbumName.text = track.collectionName;
    self.lblAlbumName.numberOfLines = 0;
    [self.lblAlbumName sizeToFit];
    
    [self.imageView setImageWithURL:[NSURL URLWithString:track.albumImageURL]];
}

-(void)prepareForReuse{
    self.imageView.image = nil;
    self.lblTrackName.text = @"";
    self.lblArtistName.text = @"";
    self.lblAlbumName.text = @"";
}
@end
