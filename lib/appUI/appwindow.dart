import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dogoapp/appUI/pages/homepage.dart' as home;

class DogoApp extends StatelessWidget {
  /*
  * Declaration of the main widget of the app.
  * This widget defines the app Look and Feel.
  * It also calls the home page widget.
  * All is wrapped in a ChangeNotifierProvider
  * to handle information passed in the app.
  * */
  const DogoApp({super.key});
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => DogoAppState(),
      child: MaterialApp(
        title: 'DogoApp',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        ),
        home: const home.DogoHomePage(title: 'DogoApp'),
      ),
    );
  }
}

class DogoAppState extends ChangeNotifier {
  /*
  * A class made to handle the current state of the app.
  * The variable isDarkModeEnabled was intended to switch between darkmode and lightmode, but it wasn't implemented
  * selectedDogBreed gets the last dog breed selected in the main window of the app.
  * imageUrl gets the url to the representative image of a breed.
  * */
  bool isDarkModeEnabled = true;
  Map selectedDogBreed = <dynamic, dynamic>{};
  String imageUrl = '';

  //Getter method of all the info of the dog breed.
  void getDogBreed(Map dogBreed){
    selectedDogBreed = dogBreed;
    notifyListeners();
  }

  //Getter method of the url that has the image of the breed.
  void getImageUrl(String url){
    imageUrl = url;
    notifyListeners();
  }

  //Not implemented, this was intended to switch the Look and Feel of the app.
  void setUIMode(){
    notifyListeners();
  }
}