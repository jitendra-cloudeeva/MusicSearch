//
//  TrackDetailVC.h
//  MusicSearch
//
//  Created by jitendra rajoria on 8/12/15.
//  Copyright (c) 2015 jitendra rajoria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Track.h"

@interface TrackDetailVC : UIViewController

@property(nonatomic,strong)UIImageView *imgAlbum;
@property(nonatomic,strong)Track *track;
-(void)setTrackDeatils:(Track*)track;

@end
