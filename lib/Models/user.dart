class User {
  final String uid;
  User({this.uid});
}

class Userdata {
  final String uid;
  final List numberofbookings;
  final String name;
  final List doctor;
  final List time;
  final List date;

  Userdata(
      {this.uid,
      this.numberofbookings,
      this.name,
      this.doctor,
      this.time,
      this.date});
}
