import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AgeDisplayState {}

class AgesLoading extends AgeDisplayState {}

class AgesLoaded extends AgeDisplayState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> ages;

  AgesLoaded({required this.ages});
}

class AgesLoadFailure extends AgeDisplayState {
  final String message;

  AgesLoadFailure({required this.message});
}
