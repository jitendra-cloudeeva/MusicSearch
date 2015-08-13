//
//  ViewModel.h
//  MusicSearch
//
//  Created by jitendra rajoria on 8/12/15.
//  Copyright (c) 2015 jitendra rajoria. All rights reserved.
//

typedef void(^completionBlock)(id DataArray);
#import <Foundation/Foundation.h>

@interface ViewModel : NSObject

+(instancetype)sharedManager;
-(void)getTrackListWithURl:(NSString *)urlString withCompletionBlock:(completionBlock)completionBlock;
-(void)getTrackDetailWithURL:(NSString *)urlString withCompletionBlock:(completionBlock)completionBlock;
@end
