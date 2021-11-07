// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:first_flutter/constants/assets_path.dart';

class Home3Page extends StatefulWidget {

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const Home3Page());
  }

  const Home3Page({Key? key}) : super(key: key);

  @override
  _Home3PageState createState() => _Home3PageState();
}

class _Home3PageState extends State<Home3Page> {
  final String _svgUrl = 'https://raw.githubusercontent.com/dnfield/flutter_svg/7d374d7107561cbd906d7c0ca26fef02cc01e7c8/example/assets/flutter_logo.svg';
  final List<Color> _colors = [
    Colors.transparent,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue
  ];
  final List<String> _letters = [
    "A",
    "B",
    "C",
    "D",
    "E"
  ];

  bool _isPlaying = false;
  late CarouselSliderController _sliderController;

  @override
  void initState() {
    super.initState();
    _sliderController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home 3'),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 500,
            child: CarouselSlider.builder(
              unlimitedMode: true,
              controller: _sliderController,
              slideBuilder: (index) {
                return Container(
                  alignment: Alignment.center,
                  color: _colors[index],
                  child: index == 0 ? SvgPicture.network(_svgUrl,
                    placeholderBuilder: (BuildContext context) => Container(
                        padding: const EdgeInsets.all(30.0),
                        child: const CircularProgressIndicator()),
                  ) : Text(
                    _letters[index],
                    style: const TextStyle(fontSize: 200, color: Colors.white),
                  ),
                );
              },
              slideTransform: const CubeTransform(),
              slideIndicator: CircularSlideIndicator(
                padding: const EdgeInsets.only(bottom: 32),
                indicatorBorderColor: Colors.black,
              ),
              itemCount: _colors.length,
              initialPage: 0,
              enableAutoSlider: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Align(
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 240, maxWidth: 600),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      iconSize: 48,
                      icon: SvgPicture.asset(Images.ic_back),
                      onPressed: () => _sliderController.previousPage()
                    ),
                    IconButton(
                      iconSize: 64,
                      icon: SvgPicture.asset(_isPlaying ? Images.ic_pause : Images.ic_play),
                      onPressed: () => setState(() {
                          _isPlaying = !_isPlaying;
                          _sliderController.setAutoSliderEnabled(_isPlaying);
                        },
                      ),
                    ),
                    IconButton(
                      iconSize: 48,
                      icon: SvgPicture.asset(Images.ic_next),
                      onPressed: () => _sliderController.nextPage()
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

