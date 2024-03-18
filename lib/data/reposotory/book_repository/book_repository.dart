import 'package:default_project/data/models/book/book_model.dart';
import 'package:default_project/data/models/my_response.dart';
import 'package:default_project/data/network/api_provider.dart';

class BookRepository {
  Future<MyRespons> getAllBooks() async => ApiProvider.getAllBook();
  Future<MyRespons> addBook({required BookModel bookModel}) async =>
      ApiProvider.addProduct(bookModel: bookModel);
  Future<MyRespons> deletBook(String uuid) async =>
      ApiProvider.deleteBook(uuid);

  Future<MyRespons> updateBook({required BookModel bookModel}) async =>
      ApiProvider.updateBook(bookModel);
}
