import 'package:flutter/material.dart';
import 'package:flutter_api/data/model/book.dart';
import 'package:flutter_api/presentation/book/book_view_model.dart';

class BookListScreen extends StatefulWidget {
  BookViewModel bookViewModel = BookViewModel();

  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {

  @override
  void initState(){
    super.initState();
    _getListBook();
  }

  List<dynamic> listBook = <Book>[];

  _getListBook()async{
    listBook = await widget.bookViewModel.getBook();
    Future.delayed(const Duration(microseconds: 500), (){
      setState(() {
        listBook = listBook;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text('Book List'),
            FloatingActionButton(
              onPressed: () async {
                final status = await Navigator.pushNamed(context, '/add-book');
                if(status=='done'){
                  setState(() {
                    _getListBook();
                  });
                }
              },
              child: Text(
                '+',
                style: TextStyle(fontSize: 34),
              ),
            ),
            Expanded(child: Card(
              child: Scrollbar(
                child: ListView.builder(itemBuilder: (context, index) {
                  return Column(children: [
                    Row(
                      children: [
                        Expanded(
                            child: ListTile(
                          leading: Icon(
                            Icons.book,
                            size: 40.0,
                          ),
                          title: Text(listBook[index].title),
                        )),
                      ],
                    ),
                    Divider(height: 5, color: Colors.cyan,)
                  ]);
                },
                  itemCount: listBook.length,
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
