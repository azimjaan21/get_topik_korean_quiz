import 'package:get_topik_korean_quiz/tools/file_importer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:yandex_mobileads/mobile_ads.dart';

class ResultScreen extends StatefulWidget {
  final int totalQuestions;
  final int correctAnswers;

  const ResultScreen(
      {super.key, required this.totalQuestions, required this.correctAnswers});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  // ##########--- YandexAds ---##########

  late final Future<InterstitialAdLoader> _adLoader;
  InterstitialAd? _ad;
  bool _isAdDismissed = false;

  @override
  void initState() {
    super.initState();
    MobileAds.initialize();
    _adLoader = _createInterstitialAdLoader();
    _loadInterstitialAd();
    _showAd();
  }

  Future<InterstitialAdLoader> _createInterstitialAdLoader() {
    return InterstitialAdLoader.create(
      onAdLoaded: (InterstitialAd interstitialAd) {
        // The ad was loaded successfully. Now you can show loaded ad
        _ad = interstitialAd;
      },
      onAdFailedToLoad: (error) {
        // Ad failed to load with AdRequestError.
        // Attempting to load a new ad from the onAdFailedToLoad() method is strongly discouraged.
        setState(() {
          _isAdDismissed = true; // Proceed to show results if ad failed to load
        });
      },
    );
  }

  Future<void> _loadInterstitialAd() async {
    final adLoader = await _adLoader;
    await adLoader.loadAd(
      adRequestConfiguration:
          const AdRequestConfiguration(adUnitId: 'R-M-9429559-1'),
    );
  }

  _showAd() async {
    _ad?.setAdEventListener(
      eventListener: InterstitialAdEventListener(
        onAdShown: () {
          // Called when an ad is shown.
        },
        onAdFailedToShow: (error) {
          // Called when an InterstitialAd failed to show.
          // Destroy the ad so you don't show the ad a second time.
          _ad?.destroy();
          _ad = null;

          // Now you can preload the next interstitial ad.
          _loadInterstitialAd();

          setState(() {
            _isAdDismissed = true; // Proceed to show results if ad failed to show
          });
        },
        onAdClicked: () {
          // Called when a click is recorded for an ad.
        },
        onAdDismissed: () {
          // Called when ad is dismissed.
          // Destroy the ad so you don't show the ad a second time.
          _ad?.destroy();
          _ad = null;

          // Now you can preload the next interstitial ad.
          _loadInterstitialAd();

          setState(() {
            _isAdDismissed = true; // Proceed to show results after ad is dismissed
          });
        },
        onAdImpression: (impressionData) {
          // Called when an impression is recorded for an ad.
        },
      ),
    );
    await _ad?.show();
    await _ad?.waitForDismiss();
  }

  // ##########--- YandexAds ---##########

  @override
  Widget build(BuildContext context) {
    int percentage = (widget.correctAnswers * 100) ~/ widget.totalQuestions;

    // Show a loading indicator until the ad is dismissed
    if (!_isAdDismissed) {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: CircularProgressIndicator(
            color: AppColors.gettopikColor,
          ),
        ),
      );
    }

    // Show the results after the ad is dismissed
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar:
          AppBar(toolbarHeight: 10.0, backgroundColor: AppColors.background),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularPercentIndicator(
              radius: 100.0,
              lineWidth: 30.0,
              animation: true,
              percent: widget.correctAnswers / widget.totalQuestions,
              center: Text(
                '$percentage %',
                style: quizWord,
              ),
              footer: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "${widget.correctAnswers} / ${widget.totalQuestions}",
                  style: quizSliderText,
                ),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: percentage == 100 || percentage >= 88
                  ? Colors.green
                  : percentage >= 60 && percentage < 88
                      ? Colors.amber
                      : percentage < 60
                          ? const Color(0xFFFF1201)
                          : Colors.grey,
            ),
            percentage == 100 || percentage >= 88
                ? const Text('완벽해요 !', style: resultTextExcel)
                : percentage >= 60 && percentage < 88
                    ? const Text('괜찮아요 !', style: resultTextGood)
                    : percentage < 60
                        ? const Text('불만족해요 !', style: resultTextBad)
                        : const SizedBox(),
            20.kH,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.topBarColor),
                  child: Row(
                    children: [
                      Icon(
                        Icons.menu_book,
                        size: 25.0,
                        color: AppColors.gettopikColor,
                      ),
                      5.wH,
                      Text(
                        '초급 1',
                        style: resultButText,
                      ),
                    ],
                  ),
                ),
                10.wH,
                // #goHome
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.topBarColor),
                  child: Row(
                    children: [
                      Icon(
                        Icons.home,
                        size: 25.0,
                        color: AppColors.gettopikColor,
                      ),
                      5.wH,
                      Text(
                        'Bosh menyu',
                        style: resultButText,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
