import 'package:flutter/material.dart';

/*
* In this file are declared widgets used by both,
* the home page and the detail page.
* */

class WaitingIndicator extends StatelessWidget {
  /*
  * The WaitingIndicator widget defines the generic widget
  * shown while data is being retrieved from the API.
  * It consists of a CircularProgressIndicator and
  * a stylized Text that writes 'Fetching data...'
  * */
  const WaitingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final waitTextStyle = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: theme.colorScheme.onPrimary
    );
    return Center(
      child: Column(
        children: [
          CircularProgressIndicator(),
          Text(
            'Fetching data...',
            style: waitTextStyle,
          )
        ],
      ),
    );
  }
}

class BackgroundContainer extends StatelessWidget {
  /*
  * BackgroundContainer is the widget that defines the
  * background in the home page and in the detail page.
  * It consists of a Container that can have a child,
  * painted in the background with a dark purple RadialGradient.
  * */
  final Widget? child;
  const BackgroundContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    final darkGradient = RadialGradient(
        colors: [
          Color(0xff180013),
          Color(0xff1a0116),
          Color(0xff1d0219),
          Color(0xff1e041d),
          Color(0xff200520),
          Color(0xff210623),
          Color(0xff220827),
          Color(0xff23092b),
        ]
    );

    if(child == null){
      return Container(
        decoration: BoxDecoration(
          gradient: darkGradient
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
            gradient: darkGradient
        ),
        child: child,
      );
    }
  }
}