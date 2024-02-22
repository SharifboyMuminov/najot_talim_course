import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';

import '../../widgets/global_text_fild.dart';

class TextFildsWidget extends StatelessWidget {
  const TextFildsWidget(
      {super.key,
      required this.controllerFullname,
      required this.controllerEmail,
      required this.controllerPassword});
  final TextEditingController controllerFullname;
  final TextEditingController controllerEmail;
  final TextEditingController controllerPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GlobalTextFild(
          edgeInsets: EdgeInsets.symmetric(horizontal: 16.we),
          isError: false,
          text: 'Full name',
          hinText: 'Full name',
          controller: controllerFullname,
        ),
        GlobalTextFild(
            textInputType: TextInputType.emailAddress,
            edgeInsets:
                EdgeInsets.symmetric(horizontal: 16.we, vertical: 12.he),
            isError: false,
            text: "Email",
            hinText: "Email",
            controller: controllerEmail),
        GlobalTextFild(
            textInputType: TextInputType.visiblePassword,
            edgeInsets:
                EdgeInsets.symmetric(horizontal: 16.we, vertical: 12.he),
            isError: false,
            text: "Password",
            hinText: "Password",
            controller: controllerPassword),
      ],
    );
  }
}
