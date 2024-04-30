import 'package:default_project/blocs/connectivity/connectivity_bloc.dart';
import 'package:default_project/blocs/connectivity/connectivity_state.dart';
import 'package:default_project/cubits/currensy_singl/currency_cubit_singl.dart';
import 'package:default_project/cubits/currensy_singl/currency_cubit_singl_state.dart';
import 'package:default_project/data/models/currency/currency_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyCubitSinglScreen extends StatefulWidget {
  const CurrencyCubitSinglScreen({super.key});

  @override
  State<CurrencyCubitSinglScreen> createState() =>
      _CurrencyCubitSinglScreenState();
}

class _CurrencyCubitSinglScreenState extends State<CurrencyCubitSinglScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CurrencyCubitSinglScreen",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.sp,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CurrencyCubitSingl, CurrencyCubitSinglState>(
              builder: (BuildContext context, CurrencyCubitSinglState state) {
                if (state.errorText.isNotEmpty) {
                  return Center(child: Text(state.errorText));
                }

                if (state.errorText.isEmpty && !state.loading) {
                  return ListView.builder(
                    itemCount: state.currencyModels.length,
                    itemBuilder: (BuildContext context, int index) {
                      CurrencyModel currencyModel = state.currencyModels[index];
                      return ListTile(
                        title: Text(
                          currencyModel.title,
                          style: TextStyle(fontSize: 22.sp),
                        ),
                        subtitle: Text(currencyModel.cbPrice,
                            style: TextStyle(fontSize: 18.sp)),
                        trailing: Text(currencyModel.code,
                            style: TextStyle(fontSize: 16.sp)),
                      );
                    },
                  );
                }

                return const Center(
                    child: CircularProgressIndicator.adaptive());
              },
            ),
          ),
          BlocListener<ConnectivityBloc, ConnectivityState>(
            listener: (context, state) {
              if (!state.hasInternet) {
                debugPrint("hasInternet--------");
                context.read<CurrencyCubitSingl>().errorConnectInternet();
              } else {
                context.read<CurrencyCubitSingl>().callCurrency();
              }
            },
            child: const SizedBox(),
          ),
        ],
      ),
    );
  }
}
