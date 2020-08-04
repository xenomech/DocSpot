import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // the collection reference

  final CollectionReference bookingCollection =
      Firestore.instance.collection("Bookings");

  Future updateUserData(
      List bookings, String name, List time, List date) async {
    return await bookingCollection.document(uid).setData(
        {'bookings': bookings, 'name': name, 'time': time, 'date': date});
  }
}
