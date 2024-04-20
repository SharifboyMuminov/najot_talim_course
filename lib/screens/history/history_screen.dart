import 'package:default_project/blocs/qr_data_bloc/qr_bloc_state.dart';
import 'package:default_project/blocs/qr_data_bloc/qr_data_bloc.dart';
import 'package:default_project/data/models/qr/qr_scanner_model.dart';
import 'package:default_project/screens/history/info_screen.dart';
import 'package:default_project/screens/history/widget/history_item.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_333333.withOpacity(0.84),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "History",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
      ),
      body: BlocBuilder<QrDataBloc, QrDataState>(
        builder: (BuildContext context, QrDataState state) {
          if (state is QrErrorState) {
            return Center(
                child: Text(
              state.errorText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.sp,
              ),
            ));
          }

          if (state is QrSuccessState) {
            if (state.qrModels.isEmpty) {
              return Center(
                child: Image.asset(
                  "assets/images/empty_image.png",
                  color: Colors.white,
                  fit: BoxFit.cover,
                ),
              );
            }
            debugPrint(state.qrModels.length.toString());
            return ListView.builder(
              padding: EdgeInsets.only(top: 10.he, bottom: 80.he),
              itemCount: state.qrModels.length,
              itemBuilder: (BuildContext context, int index) {
                return HistoryItem(qrScannerModel: state.qrModels[index]);
              },
            );
          }

          return const Center(
              child: CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black38)));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return InfoScreen(
                  qrScannerModel: QrScannerModel(
                    date: DateTime.now().toString(),
                    qrCode: '1234566',
                    name: 'asdfadsf ',
                  ),
                );
              },
            ),
          );
        },
        child: Icon(Icons.info),
      ),
    );
  }
}
