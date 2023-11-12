import 'dart:developer';
import 'package:flutter_base_project/app/managers/google_ads_manager/ad_types/ads_without_view/base_ads_without_view.dart';
import 'package:flutter_base_project/app/managers/google_ads_manager/constants/ad_constants.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardedAdService extends BaseAdsWithoutView<RewardedAd> {
  
  
  @override
  Future<void> createAd() async {
    await RewardedAd.load(
      adUnitId: getAdId(AdsType.REWARDED),
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(onAdLoaded: onAdLoaded, onAdFailedToLoad: onAdFailedToLoad),
    );
  }

  @override
  Future<void> showAd() async {
    super.showAd();
    currentAd?.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: onAdShowedFullScreenContent,
      onAdDismissedFullScreenContent: onAdDismissedFullScreenContent,
      onAdFailedToShowFullScreenContent: onAdFailedToShowFullScreenContent,
    );
    currentAd?.setImmersiveMode(true);

    
    showAdAfterDelay(
        onAdIsValid: () => currentAd!.show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
              log('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
            }));
  }
}