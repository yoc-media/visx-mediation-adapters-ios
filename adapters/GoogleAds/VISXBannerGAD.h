//
//  VISXBannerGAD.h
//  visxSDK
//
//  Created by Stefan Markovic on 8/5/20.
//  Copyright © YOC AG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GoogleMobileAds/GoogleMobileAds.h>
#import <VisxSDK/VisxAdView.h>
#import <VisxSDK/Mediation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VISXBannerGAD: NSObject <MediationDelegate, GADBannerViewDelegate>

@property (nonatomic, strong, nullable) DFPBannerView *bannerView;
@property (nonatomic, weak) VisxAdView *visxAdView;
@end

NS_ASSUME_NONNULL_END
