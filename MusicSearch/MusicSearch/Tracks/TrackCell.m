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
    self.lblArtistName.text = track.artistName;
    self.lblAlbumName.text = track.collectionName;
    
    NSURL *url = [NSURL URLWithString:track.albumImageURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIImage *placeholderImage = [UIImage imageNamed:@"placeholder"];
    
    __weak TrackCell *weakCell = self;
    
    [self.imgAlbum setImageWithURLRequest:request
                          placeholderImage:placeholderImage
                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                       
                                       weakCell.imgAlbum.image = image;
                                       [weakCell setNeedsLayout];
                                       
                                   } failure:nil];
}

-(void)prepareForReuse{
    self.imageView.image = nil;
    self.lblTrackName.text = @"";
    self.lblArtistName.text = @"";
    self.lblAlbumName.text = @"";
}

@end
