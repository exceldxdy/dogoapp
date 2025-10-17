import 'package:dogoapp/appUI/appwindow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
* This file has the widget that is going to be used only on the detail page.
* */

class BreedWidget extends StatelessWidget {
  const BreedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    /*
    * The BreedWidget is the main (and only) widget in the detail page.
    * It uses the state handler of the program to get the fetched data of
    * an specific dog breed and show it on detail.
    * */
    var appState = context.watch<DogoAppState>();
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;
    final dogNameStyle = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: theme.colorScheme.onPrimary
    );
    final dogInfoStyle = TextStyle(
        fontSize: 14,
        color: theme.colorScheme.onPrimary
    );
    
    return SizedBox(
      height: screenSize.height,
      child: Center(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: screenSize.width*0.2,
                right: screenSize.width*0.2,
                top: 40
              ),
              child: Image.network(appState.imageUrl),
            ),
            SizedBox(height: 10,),
            Center(
              child: Text(
                appState.selectedDogBreed['name'],
                style: dogNameStyle,
              ),
            ),
            SizedBox(height: 10,),
            if(appState.selectedDogBreed['temperament']!=null)
              Center(
                child: Text(
                    'The main characteristics of the temperament of this breed are: '
                        '${appState.selectedDogBreed['temperament']}',
                  style: dogInfoStyle,
                  maxLines: 4,
                ),
              ),
            SizedBox(height: 20,),
            Builder(
              builder: (context){
                if(appState.selectedDogBreed['origin'] == null){
                  return Center(
                    child: Text(
                      'This breed has unknown origin.',
                      style: dogInfoStyle,
                      maxLines: 4,
                    ),
                  );
                }
                else if(appState.selectedDogBreed['origin'] == ''){
                  return Center(
                    child: Text(
                      'This breed has unknown origin.',
                      style: dogInfoStyle,
                      maxLines: 4,
                    ),
                  );
                }
                else {
                  return Center(
                    child: Text(
                      'This breed comes from : '
                          '${appState.selectedDogBreed['origin']}',
                      style: dogInfoStyle,
                      maxLines: 4,
                    ),
                  );
                }
              },
            )
          ],
        ),
      )
    );
  }
}
