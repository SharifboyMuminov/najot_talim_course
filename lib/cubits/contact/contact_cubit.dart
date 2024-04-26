import 'package:default_project/data/local/local_varibals.dart';
import 'package:default_project/data/models/contact/contact.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactCubit extends Cubit<List<ContactModel>> {
  ContactCubit() : super(allContacts);
}
