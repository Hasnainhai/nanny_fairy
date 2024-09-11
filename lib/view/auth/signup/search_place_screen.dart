import 'package:flutter/material.dart';
import 'package:nanny_fairy/Models/predicate_model.dart';
import 'package:nanny_fairy/view/chat/widgets/predicate_request.dart';
import 'package:nanny_fairy/view/chat/widgets/predicate_tile.dart';

class SearchPlacesScreen extends StatefulWidget {
  const SearchPlacesScreen({super.key});

  @override
  State<SearchPlacesScreen> createState() => _SearchPlacesScreenState();
}

class _SearchPlacesScreenState extends State<SearchPlacesScreen> {
  List<PredictedPlaces> placePredictedList = [];
  findPlaceAutoCompleteSearch(String inputText) async {
    if (inputText.length > 1) {
      String components = 'country:PK|administrative_area:GB';
      String urlAutoCompleteSearch =
          'https://maps.googleapis.com/maps/api/place/queryautocomplete/json?input=$inputText&key=AIzaSyCBUyZVjnq9IGxH9Zu6ACNRIJXtkfZ2iuQ&components=$components';
      var responseAutoCompleteSearch =
          await RequestAssistant.getRequest(urlAutoCompleteSearch);
      debugPrint("this is search Response : $responseAutoCompleteSearch");
      if (responseAutoCompleteSearch == 'failed') {
        return;
      }
      if (responseAutoCompleteSearch['status'] == "OK") {
        var placePredictions = responseAutoCompleteSearch["predictions"];
        if (placePredictions is List) {
          var placePredictionsList = placePredictions
              .map((jsonData) => PredictedPlaces.fromJson(jsonData))
              .toList();
          debugPrint(
            "Place Predictions List: ${placePredictionsList.toString()}",
          );

          setState(() {
            placePredictedList = placePredictionsList;
          });
          debugPrint("Updated Place Predicted List: $placePredictedList");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Set Address',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 16,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 46,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        spreadRadius: 0.5,
                        offset: Offset(
                          0.7,
                          0.7,
                        ),
                      ),
                    ],
                  ),
                  child: TextField(
                    onChanged: (value) {
                      findPlaceAutoCompleteSearch(value);
                    },
                    decoration: const InputDecoration(
                      hintText: 'Search Address Here',
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.only(left: 11, top: 8, bottom: 8),
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              //display place predications result
              (placePredictedList.isNotEmpty)
                  ? Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: PlacePredicationTile(
                                predicatedPlaceses: placePredictedList[index],
                              ),
                            );
                          },
                          physics: const ClampingScrollPhysics(),
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 30,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Divider(
                                  height: 0,
                                  color: Colors.grey,
                                  thickness: 0,
                                ),
                              ),
                            );
                          },
                          itemCount: placePredictedList.length),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
