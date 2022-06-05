class User {
  String id, fullName, email;
  String? userName, phone, phoneCountry, country, avatar;

 User({
   required this.id,
   required this.fullName,
   required this.email,
   this.userName,
   this.phone,
   this.phoneCountry,
   this.country,
   this.avatar,
});
}