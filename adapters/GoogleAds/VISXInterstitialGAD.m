//
//  VISXInterstitialGAD.m
//  visxSDK
//
//  Created by Stefan Markovic on 8/10/20.
//  Copyright © YOC AG. All rights reserved.
//

#import "VISXInterstitialGAD.h"
#import <VisxSDK/Mediation.h>

@implementation VISXInterstitialGAD

- (void)loadMediationAd:(Mediation *)mediation adView:(VisxAdView *)adView {
    self.interstitial = [[GADInterstitial alloc] initWithAdUnitID:mediation.adunit];
    self.interstitial.delegate = self;
    GADRequest *request = [GADRequest request];
    [self.interstitial loadRequest:request];
}

/// Tells the delegate an ad request succeeded.
- (void)interstitialDidReceiveAd:(GADInterstitial *)ad {
    if (self.interstitial.isReady) {
      [self.interstitial presentFromRootViewController:topMostController()];
    }
  NSLog(@"interstitialDidReceiveAd");
}
/// Tells the delegate an ad request failed.
- (void)interstitial:(GADInterstitial *)ad didFailToReceiveAdWithError:(GADRequestError *)error {
  NSLog(@"interstitial:didFailToReceiveAdWithError: %@", [error localizedDescription]);
}
@end
