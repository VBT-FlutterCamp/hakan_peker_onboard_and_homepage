import 'package:email_screen/components/constants/padding/app_padding.dart';
import 'package:email_screen/features/httpService/model/todo_model.dart';
import 'package:email_screen/features/httpService/service/todo_service.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../components/constants/color/app_color.dart';
import '../../components/constants/text/app_string.dart';
import '../../components/widget/bottom_navigation_bar.dart';
import '../../components/widget/elevated_button.dart';
import '../model/inbox_model.dart';

class InboxView extends StatefulWidget {
  const InboxView({Key? key}) : super(key: key);

  @override
  _InboxViewState createState() => _InboxViewState();
}

class _InboxViewState extends State<InboxView> {
  

  final _sizedBoxHeight = const SizedBox(height: 30);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: Padding(
          padding: AppPadding.pageTopPadding,
          child: _scrollview(context),
        ));
  }

  SingleChildScrollView _scrollview(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Padding(
            padding: AppPadding.inboxtitlePadding,
            child: _titleOfThePage(context),
          ),
          _sizedBoxHeight,
          _buildRow(context),
          Padding(
            padding: AppPadding.rowPadding,
            child:listviewBuilder(),
          )
        ],
      ),
    );
  }

  Text _titleOfThePage(BuildContext context) {
    return Text(
      AppString.homeText,
      textAlign: TextAlign.left,
      style: Theme.of(context).textTheme.headline3?.copyWith(fontWeight: FontWeight.bold, color: AppColor.inboxTitleColor),
    );
  }

  Row _buildRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [_subText(context), const CustomElevatedButton()],
    );
  }

  Text _subText(BuildContext context) {
    return Text(
      AppString.subText,
      style: Theme.of(context).textTheme.headline5?.copyWith(color: AppColor.subColor),
    );
  }
}

ListView listviewBuilder() {
  return ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: models.length,
    itemBuilder: (context, index) {
      return Card(
          shape: RoundedRectangleBorder(borderRadius: context.normalBorderRadius),
          child: ListTile(
            title: Padding(
              padding: context.verticalPaddingLow,
              child: Text(
                models[index].title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColor.cardTitleColor),
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  models[index].subtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(decoration: TextDecoration.underline, color: AppColor.cardSubtitleColor),
                )
              ],
            ),
            trailing: Container(
              decoration: BoxDecoration(color: AppColor.deleteContainerColor, borderRadius: context.lowBorderRadius),
              padding: context.paddingLow,
              child: const Icon(
                Icons.delete,
                color: AppColor.deleteColor,
              ),
            ),
          ));
    },
  );
}
