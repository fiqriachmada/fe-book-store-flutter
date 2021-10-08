class Member{
  final int? id;
  final String firstName;
  final String? lastName;
  final String email;
  final String password;
  final int? status;

  Member({
    this.id,
    required this.firstName,
    this.lastName,
    required this.email,
    required this.password,
    this.status,
  });

  Map<String, dynamic> toMap() => {
    'id' : id ?? '',
    'firstName' : firstName,
    'lastName' : lastName ?? '',
    'email' : email,
    'password' : password,
    'status' : status ?? ''
  };

  Member.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        firstName = map['firstName'],
        lastName = map['lastName'],
        email = map['email'],
        password = map['password'],
        status = map['status'];
}