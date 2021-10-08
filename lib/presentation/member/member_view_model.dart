import 'package:flutter_api/data/model/member.dart';
import 'package:flutter_api/data/repository/member_repository.dart';

class MemberViewModel{
  MemberRepository _memberRepository = MemberRepository();

  addMember(Member newMember)async{
    final newMemberRegistered = await _memberRepository.addMember(newMember);
    print(newMemberRegistered);
  }

  Future<List<dynamic>> getMember()async{
    final getListMember = await _memberRepository.getMember();
    print(getListMember);
    return getListMember;
  }
}