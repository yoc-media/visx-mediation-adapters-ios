//
//  visxInterstitialAdapter.m
//  visxSDK
//
//  Created by Aleksandar Jovanov on 7/21/20.
//  Copyright © YOC AG. All rights reserved.
//

#import "VISXCustomEventInterstitialGMA.h"

@implementation VISXCustomEventInterstitialGMA

- (void)requestInterstitialAdWithParameter:(nullable NSString *)serverParameter label:(nullable NSString *)serverLabel request:(nonnull GADCustomEventRequest *)request {
    self.adView = [[VisxAdView alloc] initWithAdUnit:VisxGetGoogleAUID(serverParameter)
                                           appDomain:VisxGetGoogleAppDomain(serverParameter)
                                            delegate:self
                                                size:kInterstitial1x1
                                         isUniversal:NO];
    self.adView.delegate = self;
    self.adView.isMediationAdView = YES;
    [self.adView load];
}

- (void)presentFromRootViewController:(nonnull UIViewController *)rootViewController {
    if ([self.adView isInterstitial]) {
      [self.adView showInterstitialFromViewController:rootViewController];
    }
}

- (nonnull instancetype)init {
    self = [super init];
    return self;
}

- (void)visxAdDidReceivedAd:(VisxAdView *)visxAdView {
    [self.delegate customEventInterstitialDidReceiveAd:self];
}

- (void)visxAdViewDidInitialize:(VisxAdView *)visxAdView withPlacementEffect:(VisxPlacementEffect)effect {
    self.adView = visxAdView;
    [self.delegate customEventInterstitialDidReceiveAd:self];
}

- (UIViewController *)viewControllerForPresentingVisxAdView {
    return [[UIViewController alloc] init];
}
@end
