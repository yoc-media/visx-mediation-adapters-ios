//
//  VISXBannerGAD.m
//  visxSDK
//
//  Created by Stefan Markovic on 8/5/20.
//  Copyright © YOC AG. All rights reserved.
//

#import "VISXBannerGAD.h"
#import <VisxSDK/Mediation.h>

@implementation VISXBannerGAD

- (void)loadMediationAd:(Mediation *)mediation adView:(VisxAdView *)adView {
    self.visxAdView = adView;
    UIViewController *controller = topMostController();
    self.bannerView = [DFPBannerView new];
    self.bannerView.validAdSizes = [self bannerSize:mediation.sizes];
    [self.visxAdView addSubview:self.bannerView];
    self.bannerView.adUnitID = mediation.adunit;
    self.bannerView.rootViewController = controller;
    DFPRequest *request = [DFPRequest new];
    self.bannerView.delegate = self;
    [self.bannerView loadRequest:request];
}

- (NSMutableArray *)bannerSize:(NSArray *)sizeArr {
    GADAdSize gadSize;
    NSMutableArray *validSizes = [NSMutableArray array];
    for (NSArray *array in sizeArr) {
        if (array.count == 2) {
            int width = [array[0] intValue];
            int height = [array[1] intValue];
            switch (height) {
                case 50:
                    gadSize = GADAdSizeFromCGSize(CGSizeMake(320, 50));
                case 100:
                    gadSize = GADAdSizeFromCGSize(CGSizeMake(320, 100));
                case 250:
                    gadSize = GADAdSizeFromCGSize(CGSizeMake(300, 250));
                case 60:
                    gadSize = GADAdSizeFromCGSize(CGSizeMake(468, 60));
                case 90:
                    gadSize = GADAdSizeFromCGSize(CGSizeMake(728, 90));
                case 600:
                    gadSize = GADAdSizeFromCGSize(CGSizeMake(120, 600));
                default:
                    gadSize = GADAdSizeFromCGSize(CGSizeMake(width, height));
            }
            [validSizes addObject:[NSValue valueWithBytes:&gadSize objCType:@encode(GADAdSize)]];
        }
    }
    return validSizes;
}

- (UIViewController *)viewControllerForPresentingVisxAdView {
    return [UIViewController new];
}

- (void)adViewDidReceiveAd:(GADBannerView *)bannerView {
    [self.visxAdView adViewDidReceiveAd:bannerView];
}

- (void)adView:(GADBannerView *)bannerView didFailToReceiveAdWithError:(GADRequestError *)error {
    [self.visxAdView adView:bannerView didFailToReceiveAdWithError:error];
}

@end
