
class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String password;

  const UserModel(
      {this.id,
      required this.fullName,
      required this.password,
      required this.email});

  toJson(){

    return{

      "fullName": fullName,
      "Email": email,
      "Password": password
    };

  }
}
