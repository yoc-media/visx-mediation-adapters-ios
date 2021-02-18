//
//  visxInterstitialAdapter.h
//  visxSDK
//
//  Created by Aleksandar Jovanov on 7/21/20.
//  Copyright © YOC AG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GoogleMobileAds/GoogleMobileAds.h>
#import <VisxSDK/VisxSDK.h>

NS_ASSUME_NONNULL_BEGIN

@interface VISXCustomEventInterstitialGMA : NSObject <GADCustomEventInterstitial, VisxAdViewDelegate>

@property(nonatomic, weak, nullable) id<GADCustomEventInterstitialDelegate> delegate;
@property(nonatomic, strong) VisxAdView *adView;

@end

NS_ASSUME_NONNULL_END
