import 'package:flutter/material.dart';
import 'package:dogoapp/appUI/pages/widgets/homewidgets.dart' as homew;
import 'package:dogoapp/appUI/pages/widgets/commonwidgets.dart' as common;

class DogoHomePage extends StatefulWidget {
  const DogoHomePage({super.key, required this.title});
  final String title;

  @override
  State<DogoHomePage> createState() => _DogoHomePageState();
}

class _DogoHomePageState extends State<DogoHomePage> {

  @override
  Widget build(BuildContext context) {
    /*
    * This is the skeleton of the app home page.
    * Here the main structure of components is defined,
    * alongside with some styling.
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
          child: homew.DogsWidget(),
        ),
      ),
      backgroundColor: theme.splashColor,
    );
  }
}
