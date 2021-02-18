//
//  VISXInterstitialGAD.h
//  visxSDK
//
//  Created by Stefan Markovic on 8/10/20.
//  Copyright © YOC AG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GoogleMobileAds/GoogleMobileAds.h>
#import <VisxSDK/Mediation.h>
#import <VisxSDK/VisxAdView.h>

NS_ASSUME_NONNULL_BEGIN

@interface VISXInterstitialGAD: NSObject <MediationDelegate, GADInterstitialDelegate>

@property (nonatomic, strong, nullable) GADInterstitial *interstitial;
@end

NS_ASSUME_NONNULL_END
