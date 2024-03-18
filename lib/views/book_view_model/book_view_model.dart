import 'package:default_project/data/local/local_varibalse.dart';
import 'package:default_project/data/models/book/book_model.dart';
import 'package:default_project/data/models/my_response.dart';
import 'package:default_project/data/reposotory/book_repository/book_repository.dart';
import 'package:flutter/material.dart';

class BookViewModel extends ChangeNotifier {
  BookRepository bookRepository;
  List<BookModel> books = [];
  List<BookModel> activList = [];
  bool isLoading = false;
  String errorText = "";

  BookViewModel({required this.bookRepository}) {
    getAllBook();
  }

  Future<void> getAllBook() async {
    MyRespons myRespons = await bookRepository.getAllBooks();

    if (myRespons.data != null) {
      books = myRespons.data as List<BookModel>;
      activCategory();
    } else {
      debugPrint(books.toString());

      errorText = myRespons.errorText;
    }
    isLoading = true;
    notifyListeners();
  }

  Future<void> addBook({required BookModel bookModel}) async {
    await bookRepository.addBook(bookModel: bookModel);
    getAllBook();
  }

  Future<void> deletBook({required BookModel bookModel}) async {
    if (bookModel.uuid == null) return;
    MyRespons myRespons = await bookRepository.deletBook(bookModel.uuid!);

    if (myRespons.data == null) {
      errorText = myRespons.errorText;
      notifyListeners();
      return;
    } else {
      getAllBook();
    }
  }

  Future<void> updateBook({required BookModel bookModel}) async {
    if (bookModel.uuid == null) {
      debugPrint(";(");
      return;
    }
    MyRespons myRespons = await bookRepository.updateBook(bookModel: bookModel);

    if (myRespons.data == null) {
      errorText = myRespons.errorText;
      notifyListeners();
      return;
    } else {
      getAllBook();
    }
  }

  Future<void> activCategory() async {
    if (activCategoriyIndex == 0) {
      activList = books;
    } else {
      activList = books
          .where((element) => element.category.id == activCategoriyIndex)
          .toList();
    }
    notifyListeners();
  }
}
