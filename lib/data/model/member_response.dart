import 'member.dart';

class MemberResponse{
  List<dynamic> books;

  MemberResponse({required this.books});

  factory MemberResponse.fromList(List<dynamic> listOfMember){
    List<dynamic> listMember = listOfMember.map((e) => Member.fromMap(e)).toList();
    return MemberResponse(books: listMember);
  }

}