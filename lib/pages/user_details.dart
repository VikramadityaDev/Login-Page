class UserDetails {
  String? displayName;
  String? email;
  String? photoURL;


  //constructor
UserDetails({this.displayName, this.email, this.photoURL});

//we need to create map
UserDetails.fromJson(Map<String, dynamic> json)
{
  displayName = json["displayName"];
  photoURL = json["photourl"];
  email = json["email"];
}
Map<String, dynamic> toJson()
{
  //object - data
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['displayName'] = this.displayName;
  data['email'] = this.email;
  data['photoUrl'] = this.photoURL;

  return data;
}

}