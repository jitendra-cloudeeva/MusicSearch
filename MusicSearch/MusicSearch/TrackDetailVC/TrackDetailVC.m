//
//  TrackDetailVC.m
//  MusicSearch
//
//  Created by jitendra rajoria on 8/12/15.
//  Copyright (c) 2015 jitendra rajoria. All rights reserved.
//

#define DETAILS_URL @"http://lyrics.wikia.com/api.php?action=lyrics&"

#import "TrackDetailVC.h"
#import "ViewModel.h"
#import "TrackDetail.h"
#import "UIKit+AFNetworking.h"

@interface TrackDetailVC ()
@property (weak, nonatomic) IBOutlet UIImageView *imgViewAlbum;
@property (weak, nonatomic) IBOutlet UILabel *lblTrackName;
@property (weak, nonatomic) IBOutlet UILabel *lblArtistName;
@property (weak, nonatomic) IBOutlet UILabel *lblAlbumName;
@property (weak, nonatomic) IBOutlet UIWebView *lblLyrics;

@end

@interface TrackDetailVC ()

@property (nonatomic, strong) NSArray *dataSourceArray;

@end

@implementation TrackDetailVC

@synthesize track;
@synthesize imgAlbum;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _lblTrackName.text = track.trackName;
    _lblArtistName.text = track.artistName;
    _lblAlbumName.text = track.collectionName;
    
    NSURL *url = [NSURL URLWithString:track.albumImageURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIImage *placeholderImage = [UIImage imageNamed:@"placeholder"];
    
    __weak TrackDetailVC *weakSelf = self;
    
    [self.imgViewAlbum setImageWithURLRequest:request
                         placeholderImage:placeholderImage
                                  success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                      
                                      weakSelf.imgViewAlbum.image = image;
                                      [weakSelf.view setNeedsLayout];
                                      
                                  } failure:nil];
    
    self.navigationItem.title = _lblTrackName.text;
    
    [self getSongLyrics];
}

-(void)getSongLyrics
{
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(135,140,100,100)];
    spinner.color = [UIColor blueColor];
    [spinner startAnimating];
    [self.view addSubview:spinner];
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    
    __weak TrackDetailVC *weakSelf = self;
    NSString *url = [NSString stringWithFormat:@"%@artist=%@&song=%@&fmt=xml",DETAILS_URL,_lblArtistName.text,_lblTrackName.text];
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[ViewModel sharedManager] getTrackDetailWithURL:url withCompletionBlock:^(id response) {
        weakSelf.dataSourceArray = (NSArray *)response;
        TrackDetail *trackDetails = (TrackDetail*)weakSelf.dataSourceArray[0];
        [weakSelf.lblLyrics loadHTMLString:trackDetails.lyrics baseURL:nil];
        
        [spinner removeFromSuperview];
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    }];
}

-(void)setTrackDeatils:(Track*)trackDetails
{
    self.track = trackDetails;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
