import 'package:flutter/material.dart';

class ProviderSearchModel {
  final String uid;
  final String firstName;
  final String lastName;
  final String email;
  final String bio;
  final String dob;
  final String education;
  final String address;
  final String houseNumber;
  final String postCode;
  final String phoneNumber;
  final String hoursrate;
  final String profile;
  final List<String> passions;
  final Map<String, Map<String, bool>> availability;
  final IdPics idPics;
  final Reference reference;

  ProviderSearchModel({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.bio,
    required this.dob,
    required this.education,
    required this.address,
    required this.houseNumber,
    required this.postCode,
    required this.phoneNumber,
    required this.hoursrate,
    required this.profile,
    required this.passions,
    required this.availability,
    required this.idPics,
    required this.reference,
  });

  factory ProviderSearchModel.fromMap(Map<String, dynamic> data, String uid) {
    // Safely parse the availability field
    Map<String, Map<String, bool>> parsedAvailability = {};
    if (data['Availability'] != null && data['Availability'] is Map) {
      (data['Availability'] as Map<String, dynamic>)
          .forEach((timeOfDay, daysMap) {
        if (daysMap is Map<String, dynamic>) {
          Map<String, bool> parsedDays = {};
          daysMap.forEach((day, value) {
            if (value is bool) {
              parsedDays[day] = value;
            } else {
              debugPrint(
                  'Invalid value for availability in provider $uid: $value (Expected bool, got ${value.runtimeType})');
            }
          });
          parsedAvailability[timeOfDay] = parsedDays;
        } else {
          debugPrint(
              'Invalid daysMap for timeOfDay $timeOfDay in provider $uid: $daysMap');
        }
      });
    } else {
      debugPrint(
          'Availability data is missing or not in the expected format for provider $uid');
    }

    debugPrint('Parsed provider data: $data');

    try {
      return ProviderSearchModel(
        uid: uid,
        firstName: data['firstName'] ?? '',
        lastName: data['lastName'] ?? '',
        email: data['email'] ?? '',
        bio: data['bio'] ?? '',
        dob: data['dob'] ?? '',
        education: data['education'] ?? '',
        address: data['address'] ?? '',
        houseNumber: data['houseNumber'] ?? '',
        postCode: data['postCode'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        hoursrate: data['hoursrate'] ?? '',
        profile: data['profile'] ?? '',
        passions: List<String>.from(data['Passions'] ?? []),
        availability: parsedAvailability,
        idPics: IdPics.fromMap(data['IdPics'] ?? {}),
        reference: Reference.fromMap(data['Refernce'] ?? {}),
      );
    } catch (e) {
      debugPrint('Error processing provider $uid: $e');
      throw e; // Rethrow the error to be caught by the caller
    }
  }
}

class IdPics {
  final String frontPic;
  final String backPic;

  IdPics({
    required this.frontPic,
    required this.backPic,
  });

  factory IdPics.fromMap(Map<String, dynamic> data) {
    debugPrint('Parsing IdPics data: $data');
    return IdPics(
      frontPic: data['frontPic'] ?? '',
      backPic: data['backPic'] ?? '',
    );
  }
}

class Reference {
  final String experience;
  final String job;
  final String land;
  final String phoneNumber;
  final String skill;

  Reference({
    required this.experience,
    required this.job,
    required this.land,
    required this.phoneNumber,
    required this.skill,
  });

  factory Reference.fromMap(Map<String, dynamic> data) {
    debugPrint('Parsing Reference data: $data');
    return Reference(
      experience: data['experince'] ?? '',
      job: data['job'] ?? '',
      land: data['land'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      skill: data['skill'] ?? '',
    );
  }
}
