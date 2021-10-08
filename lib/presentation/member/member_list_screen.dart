import 'package:flutter/material.dart';
import 'package:flutter_api/data/model/member.dart';
import 'package:flutter_api/presentation/member/member_view_model.dart';

class MemberListScreen extends StatefulWidget {
  MemberViewModel memberViewModel = MemberViewModel();

  @override
  _MemberListScreenState createState() => _MemberListScreenState();
}

class _MemberListScreenState extends State<MemberListScreen> {
  @override
  void initState() {
    super.initState();
    _getListMember();
  }

  List<dynamic> listMember = <Member>[];

  _getListMember() async {
    listMember = await widget.memberViewModel.getMember();
    Future.delayed(const Duration(microseconds: 500), () {
      setState(() {
        listMember = listMember;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text('Member List'),
            FloatingActionButton(
              onPressed: () async {
                final status =
                    await Navigator.pushNamed(context, '/add-member');
                if (status == 'done') {
                  setState(() {
                    _getListMember();
                  });
                }
              },
              child: Text(
                '+',
                style: TextStyle(fontSize: 34),
              ),
            ),
            Expanded(
                child: Card(
              child: Scrollbar(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(children: [
                      Row(
                        children: [
                          Expanded(
                              child: ListTile(
                            leading: Icon(
                              Icons.perm_identity,
                              size: 40.0,
                            ),
                            title: Text(listMember[index].firstName +
                                (" ") +
                                listMember[index].lastName),
                          )),
                        ],
                      ),
                      Divider(
                        height: 5,
                        color: Colors.cyan,
                      )
                    ]);
                  },
                  itemCount: listMember.length,
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
