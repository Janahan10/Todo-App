class User {
  String username;
  String password;
  String firstname;
  String lastname;
  String email;
  String apiKey;

  User({
    this.username,
    this.password,
    this.firstname,
    this.lastname,
    this.email,
    this.apiKey
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User (
      username : json['username'],
      password : json['password'],
      firstname : json['firstname'],
      lastname : json['lastname'],
      email : json['email'],
      apiKey: json['api_key']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data["api_key"] = this.apiKey;
    return data;
  }
}