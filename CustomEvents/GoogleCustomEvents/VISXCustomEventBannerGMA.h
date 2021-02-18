//
//  visxBannerAdapter.h
//  visxSDK
//
//  Created by Aleksandar Jovanov on 7/20/20.
//  Copyright © YOC AG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GoogleMobileAds/GoogleMobileAds.h>
#import <VisxSDK/VisxSDK.h>

NS_ASSUME_NONNULL_BEGIN

@interface VISXCustomEventBannerGMA : NSObject <GADCustomEventBanner, VisxAdViewDelegate>

@property(nonatomic, weak) id<GADCustomEventBannerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
