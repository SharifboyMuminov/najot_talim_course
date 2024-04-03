import 'package:cached_network_image/cached_network_image.dart';
import 'package:default_project/data/models/bank/bank_model.dart';
import 'package:default_project/screens/banc/banks_cubit/banc_cubit.dart';
import 'package:default_project/screens/banc/banks_cubit/banc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankScreen extends StatefulWidget {
  const BankScreen({super.key});

  @override
  State<BankScreen> createState() => _BankScreenState();
}

class _BankScreenState extends State<BankScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Banc Screen",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => BankCubit(),
        child: BlocBuilder<BankCubit, BankState>(
          builder: (BuildContext context, state) {
            if (state is LoadingBankState) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            if (state is ErrorBankState) {
              return Center(
                child: Text(
                  state.errorText,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp),
                ),
              );
            }
            state as SuccessBankState;

            return ListView(
              children: List.generate(state.banData.length, (index) {
                BankModel bankModel = state.banData[index];
                return ListTile(
                  title: Text(
                    bankModel.sender.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp),
                  ),
                  subtitle: Text(bankModel.sender.location),
                  leading: CachedNetworkImage(
                    imageUrl: bankModel.sender.brandImage,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator.adaptive(),
                    errorWidget: (context, url, error) => Image.network(
                        "https://api.logobank.uz/media/logos_png/Najot_Talim-01.png"),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
