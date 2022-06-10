import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://idseducation.com/wp-content/uploads/2018/10/152577-OWH7UZ-492-840x430.jpg',
  'https://bealittleweird.com/wp-content/uploads/2019/03/Jasa-Startup-Penyedia-Akses-Pembayaran-Online-Dan-Keunggulannya-800x416.jpg',
  'https://assets.kompasiana.com/items/album/2019/12/26/dcdc71a62e103b8a2093a949b7690ffd-5e0442e0d541df14ce7fe2f2.jpg?t=o&v=740&x=416',
  'https://imgcdn.rri.co.id/__srct/b763d32e20ec5d473fd182b5c78d0964/791750/fixed-va-web.jpg?v=1.0.3',
  'https://cdn1.vectorstock.com/i/thumb-large/41/45/earn-points-benefits-program-shopping-reward-vector-29654145.jpg',
  'https://www.pngitem.com/pimgs/m/420-4209811_point-loyalty-program-emblem-hd-png-download.png'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
      margin: const EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(item, fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                ),
              ),
            ],
          )),
    ))
    .toList();

class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    return CarouselSlider(
        options: CarouselOptions(
          autoPlay: true
        ),
        items: imageSliders,
      );
  }

}