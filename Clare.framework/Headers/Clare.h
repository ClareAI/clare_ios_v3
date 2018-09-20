//
//  Clare.h
//  Clare
//
//  Created by LiuZekai on 22/06/2018.
//  Copyright © 2018 LiuZekai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLSettings.h"

//! Project version number for Clare.
FOUNDATION_EXPORT double ClareVersionNumber;

//! Project version string for Clare.
FOUNDATION_EXPORT const unsigned char ClareVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <Clare/PublicHeader.h>

@interface Clare : NSObject
+ (Clare*)sharedManager;
-(void)init:(CLSettings *)settings;
-(void)show;
-(void)hide;
-(void)recover;
-(void)showWithoudWidget;
-(void)collapse;

@property(nonatomic) CLSettings* settings;

@end
