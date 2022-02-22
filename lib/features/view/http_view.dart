import 'package:email_screen/components/constants/padding/app_padding.dart';
import 'package:flutter/material.dart';

import '../../components/constants/color/app_color.dart';
import '../../components/constants/text/app_string.dart';
import '../../components/widget/bottom_navigation_bar.dart';
import '../../components/widget/elevated_button.dart';
import '../httpService/model/todo_model.dart';
import '../httpService/service/todo_service.dart';
import 'package:kartal/kartal.dart';

class HttpView extends StatefulWidget {
  const HttpView({Key? key}) : super(key: key);

  @override
  _HttpViewState createState() => _HttpViewState();
}

class _HttpViewState extends State<HttpView> {
  final _sizedBoxHeight = const SizedBox(height: 30);

  TodoService _todoService = TodoService();
  List<TodoModel>? _todoModel;
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> init() async {
    _todoModel = await _todoService.fetchPost();
    changeLoading();
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: isLoading ? _scrollView(context) : progressIndicator());
  }

  SingleChildScrollView _scrollView(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: _columnOfScroll(context),
    );
  }

  Column _columnOfScroll(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: AppPadding.inboxtitlePadding,
          child: _mainTitle(context),
        ),
        _sizedBoxHeight,
        _rowButtonAndText(context),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _listviewBuilder(),
        ),
      ],
    );
  }

  Text _mainTitle(BuildContext context) {
    return Text(
      AppString.homeText,
      textAlign: TextAlign.left,
      style: Theme.of(context).textTheme.headline3?.copyWith(fontWeight: FontWeight.bold, color: AppColor.inboxTitleColor),
    );
  }

  Row _rowButtonAndText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          AppString.subText,
          style: Theme.of(context).textTheme.headline5?.copyWith(color: AppColor.subColor),
        ),
        const CustomElevatedButton()
      ],
    );
  }

  ListView _listviewBuilder() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: _todoModel?.length,
      itemBuilder: (context, index) {
        return _buildCard(context, index);
      },
    );
  }

  Card _buildCard(BuildContext context, int index) {
    return Card(
        child: ListTile(
      title: Padding(
        padding: context.verticalPaddingLow,
        child: Text(
          _todoModel?[index].title.toString() ?? "",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColor.cardTitleColor),
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_todoModel?[index].id.toString() ?? "",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(decoration: TextDecoration.underline, color: AppColor.cardSubtitleColor))
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
  }
}

Center progressIndicator() => Center(child: CircularProgressIndicator());
