import 'book.dart';

class BookResponse{
  List<dynamic> books;

  BookResponse({required this.books});

  factory BookResponse.fromList(List<dynamic> listOfBook){
    List<dynamic> listBook = listOfBook.map((e) => Book.fromMap(e)).toList();
    return BookResponse(books: listBook);
  }

}