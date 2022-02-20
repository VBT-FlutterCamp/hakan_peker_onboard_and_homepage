import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../components/constants/color/app_color.dart';
import '../../components/constants/text/app_string.dart';
import '../view/inbox_view.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  _OnBoardViewState createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  final String _study = "assets/images/onboardImage.png";
  final String _green = "assets/images/Background.png";
  static const IconData _double_arrow_rounded = IconData(0xf6db, fontFamily: 'MaterialIcons');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8edfc),
      body: _mainPage(context),
    );
  }

  Column _mainPage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
          child: _firstText(context),
        ),
        Padding(
          padding: context.verticalPaddingLow,
          child: _secondTextNormal(context),
        ),
         _secondTextBold(context),
        
        _stackImages(context),
        _elevatedButtonWithIcon(context),
      ],
    );
  }

  Text _firstText(BuildContext context) {
    return Text(AppString.onboardFirstText,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline3?.copyWith(color: AppColor.onboardTextColor, fontWeight: FontWeight.bold));
  }

  Text _secondTextNormal(BuildContext context) {
    return Text(
      AppString.onboardSecondTextNormal,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline5?.copyWith(color: AppColor.onboardTextColor),
    );
  }

  Text _secondTextBold(BuildContext context) {
    return Text(
      AppString.onboardSecondTextBold,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline5?.copyWith(color: AppColor.onboardTextColor, fontWeight: FontWeight.bold),
    );
  }

  SizedBox _stackImages(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.5),
      child: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox(child: Image.asset(_green)),
          SizedBox(child: Image.asset(_study)),
        ],
      ),
    );
  }

  Row _elevatedButtonWithIcon(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: context.dynamicHeight(0.06),
          width: context.dynamicWidth(0.5),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: AppColor.onboardElevatedButtonColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InboxView(),
                    ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [_getStartedTitle(context), _nextIcon()],
              )),
        )
      ],
    );
  }

  Text _getStartedTitle(BuildContext context) {
    return Text(
      AppString.getStartedText,
      style: context.textTheme.headline6?.copyWith(color: AppColor.onboardTextColor),
    );
  }

  Icon _nextIcon() {
    return const Icon(
      _double_arrow_rounded,
      color: AppColor.onboardTextColor,
    );
  }
}
