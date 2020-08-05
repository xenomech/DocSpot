import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sreevaidyanatham/Models/bookings.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // the collection reference

  final CollectionReference bookingCollection =
      Firestore.instance.collection("Bookings");

  Future updateUserData(
      List numberofbookings, String name, List time, List date) async {
    return await bookingCollection.document(uid).setData({
      'uid': uid,
      'bookings': numberofbookings,
      'name': name,
      'time': time,
      'date': date
    });
  }

  // doc list from snapshot
  List<Bookings> _bookingdocsfromsnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Bookings(
        uid: doc.data['uid'] ?? '',
        numberofbookings: doc.data['bookings'] ?? [null],
        name: doc.data['name'] ?? '',
        time: doc.data['time'] ?? [null],
        date: doc.data['date'] ?? [null],
      );
    }).toList();
  }

  //get the booking stream

  Stream<List<Bookings>> get bookings {
    return bookingCollection.snapshots().map(_bookingdocsfromsnapshot);
  }
}
