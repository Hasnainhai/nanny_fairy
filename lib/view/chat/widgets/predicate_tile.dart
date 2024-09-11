import 'package:flutter/material.dart';

import 'package:nanny_fairy/Models/predicate_model.dart';
import 'package:nanny_fairy/res/components/colors.dart';
import 'package:nanny_fairy/view/auth/signup/register_details.dart';
import 'package:nanny_fairy/view/chat/widgets/predicate_request.dart';
import 'package:nanny_fairy/view/chat/widgets/progress_dialog.dart';

String? providerAddress;

class PlacePredicationTile extends StatefulWidget {
  const PlacePredicationTile({super.key, this.predicatedPlaceses});

  final PredictedPlaces? predicatedPlaceses;

  @override
  State<PlacePredicationTile> createState() => _PlacePredicationTileState();
}

class _PlacePredicationTileState extends State<PlacePredicationTile> {
  Future<void> getPlaceDirectionDetails(String? placeId, context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => PrograssDialog(
        message: 'Please wait.....',
      ),
    );
    // String placeId = 'ChIJsUMlZONJ5jgRKygXyqMM_UA';
    String placeDirectionDetailsUrl =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=AIzaSyCBUyZVjnq9IGxH9Zu6ACNRIJXtkfZ2iuQ';
    var responeApi =
        await RequestAssistant.getRequest(placeDirectionDetailsUrl);
    Navigator.pop(context);
    if (responeApi == "failed") {
      return;
    }
    if (responeApi['status'] == 'OK') {
      String locationName = responeApi['result']['name'];

      setState(() {
        providerAddress = locationName;
      });
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (c) => RegisterDetails()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Icon(
        Icons.location_on,
        color: AppColor.primaryColor,
      ),
      Expanded(
        child: GestureDetector(
          onTap: () {
            getPlaceDirectionDetails(
                widget.predicatedPlaceses!.placeId, context);
          },
          child: Text(
            widget.predicatedPlaceses!.mainText!,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 95, 94, 94)),
          ),
        ),
      )
    ]);
  }
}
