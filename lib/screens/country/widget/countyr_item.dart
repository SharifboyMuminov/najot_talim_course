import 'package:default_project/data/models/country/countyr_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryItem extends StatelessWidget {
  const CountryItem({super.key, required this.countryModel});
  final CountryModel countryModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Text(
        countryModel.emoji,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.sp,
        ),
      ),
      title: Text(
        countryModel.name,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.sp,
        ),
      ),
      subtitle: Text(
        countryModel.continent.name,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
