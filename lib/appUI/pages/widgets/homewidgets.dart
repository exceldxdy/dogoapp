import 'package:dogoapp/appUI/appwindow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dogoapp/appUI/pages/detailpage.dart';
import 'package:dogoapp/networking/fetching.dart' as fetch;
import 'commonwidgets.dart' as common;

/*
* This file has widgets that are going to be used only on the home page.
* */

final String allBreedsUri = 'https://api.thedogapi.com/v1/breeds';
final String imagesBaseUri = 'https://api.thedogapi.com/v1/images/';

class DogsWidget extends StatelessWidget {
  const DogsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    /*
    * The DogsWidget is the base of all the home page functionality.
    * Here the data of all the dog breeds is fetched and the grid for
    * all the fetched data is set.
    * */
    final screenSize = MediaQuery.of(context).size;

    Future retrieveAllBreeds() async{
      return fetch.noAuthApiCallList(allBreedsUri);
    }

    return SizedBox(
      height: screenSize.height,
      child: FutureBuilder(
        future: retrieveAllBreeds(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return common.WaitingIndicator();
          }else{
            return GridView.count(
              padding: EdgeInsets.all(12),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount: screenSize.width < 500 ? 2 : 4,
              children: [
                for(var element in snapshot.data)
                  DogButton(
                    imgId: element['reference_image_id'],
                    dogName: element['name'],
                    dogBreed: element
                  ),
              ],
            );
          }
        },
      ),
    );
  }
}

class DogButton extends StatelessWidget {
  final String imgId;
  final String dogName;
  final Map<dynamic, dynamic> dogBreed;

  const DogButton({super.key, required this.imgId, required this.dogName, required this.dogBreed});

  Future retrieveImageInfo(String imageId) async{
    return fetch.noAuthApiCallMap(imagesBaseUri+imageId);
  }

  @override
  Widget build(BuildContext context) {
    /*
    * The DogButton widget defines the buttons for each dog,
    * with the breed name and a characteristic picture of that breed.
    * The buttons made rely on the fact that the data of all the breeds
    * has been correctly retrieved from the API. If that's not the case,
    * the buttons are not generated and instead the WaitingIndicator widget appears.
    * */
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final dogNameStyle = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: screenWidth < 600 ? 10 : 16,
        color: theme.colorScheme.onPrimary
    );
    var appState = context.watch<DogoAppState>();
    return Center(
      child: FutureBuilder(
        future: retrieveImageInfo(imgId),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return common.WaitingIndicator();
          } else{
            return Material(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(16),
              child: InkWell(
                child: Column(
                  children: [
                    Ink.image(
                      image: NetworkImage(
                        snapshot.data['url'],
                      ),
                      width: screenWidth < 500 ? screenWidth*0.45 : screenWidth*0.225,
                      height: screenWidth < 500 ? screenWidth*0.35 : screenWidth*0.175,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 6,),
                    Expanded(
                      child: Text(
                        dogName,
                        style: dogNameStyle,
                      ),
                    ),
                    SizedBox(height: 6,)
                  ],
                ),
                onTap: (){
                  appState.getDogBreed(dogBreed);
                  appState.getImageUrl(snapshot.data['url']);
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => const DogoDetailPage(title: 'DogoApp',),
                    ),
                  );
                },
              ),
            );
          }
        },
      )
    );
  }
}