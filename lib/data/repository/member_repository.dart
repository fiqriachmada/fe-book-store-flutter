import 'package:flutter_api/data/api/api_helper.dart';
import 'package:flutter_api/data/model/member.dart';
import 'package:flutter_api/data/model/member_response.dart';

class MemberRepository{
  final ApiHelper _apiHelper = ApiHelper.INSTANCE;

  Future<Member> addMember(Member newMember) async{
    final response = await _apiHelper.postData('/member', newMember.toMap());
    return Member.fromMap(response);
  }

  Future<List<dynamic>> getMember()async{
    final response = await _apiHelper.getData('/member');
    return MemberResponse.fromList(response).books;
  }
}