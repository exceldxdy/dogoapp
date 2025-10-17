import 'package:flutter/material.dart';
import 'package:dogoapp/appUI/pages/widgets/detailwidgets.dart' as detw;
import 'package:dogoapp/appUI/pages/widgets/commonwidgets.dart' as common;

class DogoDetailPage extends StatefulWidget {
  final String title;
  const DogoDetailPage({super.key, required this.title});

  @override
  State<DogoDetailPage> createState() => _DogoDetailPageState();
}

class _DogoDetailPageState extends State<DogoDetailPage> {
  @override
  Widget build(BuildContext context) {
    /*
    * This is the skeleton of the app detail page.
    * Here the main structure of components is defined,
    * alongside with some styling, just like in the home page.
    * */
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.secondary,
        title: Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Text(widget.title),
        ),
        titleTextStyle: titleStyle,
        centerTitle: true,
      ),
      body: Center(
        child: common.BackgroundContainer(
          child: detw.BreedWidget(),
        ),
      ),
      backgroundColor: theme.splashColor,
    );
  }
}