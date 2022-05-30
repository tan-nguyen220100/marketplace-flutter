import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_nft_marketplace/utils/colors.dart';

class NftCard extends StatefulWidget {
  const NftCard({Key? key, this.width, this.height}) : super(key: key);

  final double? width;
  final double? height;

  @override
  State<NftCard> createState() => _NftCardState();
}

class _NftCardState extends State<NftCard> {
  bool isLiked = false;

  void like() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = widget.height ?? MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width / 2.0 - 20;

    double imageHeight = height * 0.55;
    Widget heartIcon = isLiked
        ? SvgPicture.asset(
            "assets/icons/heart_filled.svg",
            color: red,
            width: 16,
          )
        : SvgPicture.asset(
            "assets/icons/heart.svg",
            color: greyscale[700],
            width: 16,
          );

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4.0,
            offset: const Offset(0.0, 2.0),
          ),
        ],
        color: lightBlack,
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: width,
                height: imageHeight,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/item1.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  "Shapire Cole",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: greyscale[700],
                    height: 1.66,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12.0, right: 12.0),
                child: Text(
                  "The Space 305",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    height: 1.77,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SvgPicture.asset(
                          'assets/icons/ethereum.svg',
                          color: Colors.white,
                          height: 12,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          '0.1345',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(4.0),
                        primary: grey,
                        elevation: 1,
                        shape: const CircleBorder(),
                      ),
                      child: heartIcon,
                      onPressed: like,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
