//
//  visxBannerAdapter.m
//  visxSDK
//
//  Created by Aleksandar Jovanov on 7/20/20.
//  Copyright © YOC AG. All rights reserved.
//

#import "VISXCustomEventBannerGMA.h"

@implementation VISXCustomEventBannerGMA

- (void)requestBannerAd:(GADAdSize)adSize parameter:(NSString *)serverParameter label:(NSString *)serverLabel request:(GADCustomEventRequest *)request {
    VisxAdView *adView = [[VisxAdView alloc] initWithAdUnit:VisxGetGoogleAUID(serverParameter)
                                                  appDomain:VisxGetGoogleAppDomain(serverParameter)
                                                   delegate:self
                                                       size:VisxGetGoogleAdSize(serverParameter)
                                                isUniversal:NO];
    adView.tag = 332;
    adView.isMediationAdView = YES;
    [adView load];
}

- (UIViewController *)viewControllerForPresentingVisxAdView {
    return [[UIViewController alloc] init];
}

- (void)visxAdDidReceivedAd:(VisxAdView *)visxAdView {
    [self.delegate customEventBanner:self didReceiveAd:visxAdView];
}

- (void)visxAdViewDidInitialize:(VisxAdView *)visxAdView withPlacementEffect:(VisxPlacementEffect)effect {
    [self.delegate customEventBanner:self didReceiveAd:visxAdView];
}

- (void)visxAdViewDidChangePlacementDimension:(VisxAdView *)visxAdView {
    CGFloat width = visxAdView.frame.size.width;
    CGFloat height = visxAdView.frame.size.height;
    NSDictionary *dict = @{@"width" : @(width), @"height" : @(height)};
    [[NSNotificationCenter defaultCenter] postNotificationName:VisxGoogleAdUpdatedViewString() object:self userInfo:dict];
}
@end

