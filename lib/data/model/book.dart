class Book{
  final int? id;
  final String title;
  final String description;
  final int year;
  final int pages;
  final String language;
  final String publisher;
  final int price;
  final int stock;

  Book({
    this.id,
    required this.title,
    required this.description,
    required this.year,
    required this.pages,
    required this.language,
    required this.publisher,
    required this.price,
    required this.stock
  });

  Map<String, dynamic> toMap() => {
    'id' : id ?? '',
    'title' : title,
    'description' : description,
    'year' : year,
    'pages' : pages,
    'language' : language,
    'publisher' : publisher,
    'price' : price,
    'stock' : stock
  };

  Book.fromMap(Map<String, dynamic> map)
  : id = map['id'],
  title = map['title'],
  description = map['description'],
  year = map['year'],
  pages = map['pages'],
  language = map['language'],
  publisher = map['publisher'],
  price = map['price'],
  stock = map['stock'];
}