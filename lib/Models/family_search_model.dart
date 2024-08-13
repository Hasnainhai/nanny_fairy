import 'package:flutter/foundation.dart';

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
    try {
      Map<String, dynamic> referenceData =
          Map<String, dynamic>.from(data['Refernce'] ?? {});
      Map<String, dynamic> idPicsData =
          Map<String, dynamic>.from(data['IdPics'] ?? {});

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
        availability: _parseAvailability(
            Map<String, dynamic>.from(data['Availability'] ?? {})),
        idPics: IdPics.fromMap(idPicsData),
        reference: Reference.fromMap(referenceData),
      );
    } catch (e) {
      debugPrint('Error processing provider $uid: $e');
      throw e; // Rethrow to handle the error higher up if necessary
    }
  }

  static Map<String, Map<String, bool>> _parseAvailability(
      Map<String, dynamic> availability) {
    Map<String, Map<String, bool>> parsedAvailability = {};
    availability.forEach((timeOfDay, daysMap) {
      if (daysMap is Map<String, dynamic>) {
        Map<String, bool> parsedDays = {};
        daysMap.forEach((day, value) {
          if (value is bool) {
            parsedDays[day] = value;
          }
        });
        parsedAvailability[timeOfDay] = parsedDays;
      }
    });
    return parsedAvailability;
  }
}

class IdPics {
  final String backPic;
  final String frontPic;

  IdPics({required this.backPic, required this.frontPic});

  factory IdPics.fromMap(Map<String, dynamic> data) {
    return IdPics(
      backPic: data['backPic'] ?? '',
      frontPic: data['frontPic'] ?? '',
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
    return Reference(
      experience: data['experince'] ?? '',
      job: data['job'] ?? '',
      land: data['land'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      skill: data['skill'] ?? '',
    );
  }
}
