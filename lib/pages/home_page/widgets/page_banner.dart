import 'package:flutter/material.dart';

import '../../../constants/app_dimensions.dart';

class PageBanner extends StatefulWidget {
  const PageBanner({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<PageBanner> createState() => _PageBannerState();
}

class _PageBannerState extends State<PageBanner> {
  //pageView builder controller

  List<Widget> pageBanner = [
    Banner1(),
    Banner2(),
    Banner3(),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimension.getProportionalScreenHeight(180),
      child: PageView.builder(
          controller: widget.pageController,
          pageSnapping: true,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              padding:
                  EdgeInsets.only(right: index == 2 ? 0 : AppDimension.width16),
              child: pageBanner[index],
            );
          }),
    );
  }
}

class Banner1 extends StatelessWidget {
  const Banner1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimension.height6),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/food1.jpg'))),
        ),
        Positioned(
          top: AppDimension.height10 * 1.5,
          left: AppDimension.width20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(direction: Axis.vertical, children: [
                Banner1HeaderText(text: 'SUPER'),
                Banner1HeaderText(text: 'DEAL'),
                Banner1HeaderText(text: 'DATE'),
              ]),
              SizedBox(height: AppDimension.height8),
              BannerPromo(promoText: '40% OFF'),
              SizedBox(height: AppDimension.height8 / 2),
              BannerBaseText(text: '*until Oct 15'),
              SizedBox(
                height: AppDimension.height10 * 1.5,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Banner2 extends StatelessWidget {
  const Banner2({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimension.height6),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/food2.jpg'))),
        ),
        Positioned(
          left: AppDimension.getProportionalScreenWidth(76),
          top: AppDimension.height10 * 1.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Banner1HeaderText(text: 'SUPER FAMILY'),
              BannerPromo(promoText: '35% OFF'),
              SizedBox(height: AppDimension.getProportionalScreenHeight(79)),
              BannerBaseText(
                text: '*Minimum 6 people',
              ),
              SizedBox(
                height: AppDimension.height10 * 1.5,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Banner3 extends StatelessWidget {
  const Banner3({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimension.height6),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/food3.jpg'))),
        ),
        Positioned(
            right: -70,
            child: Container(
                height: AppDimension.getProportionalScreenHeight(180),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent.withOpacity(0.2)),
                child: SizedBox(
                  width: 250,
                ))),
        Positioned(
          top: AppDimension.height20 * 2,
          right: AppDimension.width20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(direction: Axis.vertical, children: [
                Banner1HeaderText(text: 'COMBO'),
                Banner1HeaderText(text: 'DEAL'),
              ]),
              SizedBox(height: AppDimension.height8 / 2),
              BannerPromo(promoText: '40% OFF'),
              SizedBox(
                height: AppDimension.height10 * 1.5,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Banner1HeaderText extends StatelessWidget {
  const Banner1HeaderText({
    super.key,
    required this.text,
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      child: Text(
        text,
        style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontSize: AppDimension.height24,
            color: Colors.white,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}

class BannerPromo extends StatelessWidget {
  const BannerPromo({
    super.key,
    required this.promoText,
  });
  final String promoText;
  @override
  Widget build(BuildContext context) {
    return Text(
      promoText,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Colors.white,
          fontSize: AppDimension.height20,
          fontWeight: FontWeight.w600),
    );
  }
}

class BannerBaseText extends StatelessWidget {
  const BannerBaseText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
          fontSize: AppDimension.height10,
          color: Colors.white,
          fontWeight: FontWeight.w400),
    );
  }
}
