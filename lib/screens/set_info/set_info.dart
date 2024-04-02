import 'package:default_project/cubits/paln/plan_cubit.dart';
import 'package:default_project/cubits/paln/plan_state.dart';
import 'package:default_project/cubits/timer/timer_cubit.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String hourText = "01";
String minuteText = "00";

class SetInfo extends StatefulWidget {
  const SetInfo({super.key});

  @override
  State<SetInfo> createState() => _SetInfoState();
}

class _SetInfoState extends State<SetInfo> {
  String planText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.we, vertical: 30.he),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Set Your Time",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                30.getH(),
                const TimeMyWidget(),
                30.getH(),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      myShowBottomSheet(context);
                    },
                    icon: Icon(
                      Icons.add,
                      size: 24.sp,
                    ),
                  ),
                ),
                BlocBuilder<PlanCubit, PlanState>(
                  builder: (BuildContext context, PlanState state) {
                    return Column(
                      children: [
                        ...List.generate(
                          state.plans.length,
                          (index) {
                            return ListTile(
                              title: Text("Tag"),
                              subtitle: Text(
                                state.plans[index],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25.sp,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 24.we, vertical: 20.he),
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 13.he),
                    backgroundColor: Colors.green),
                onPressed: () {
                  if(hourText.isNotEmpty && minuteText.isNotEmpty){
                    context.read<TimerCubit>().setHourAndMinute(hourText, minuteText);
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

myShowBottomSheet(BuildContext context) {
  String planText = "";
  showModalBottomSheet(
    context: context,
    builder: (newContext) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.we, vertical: 20.he),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              topRight: Radius.circular(10.r),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                onChanged: (v) {
                  planText = v;
                },
                maxLines: null,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: const BorderSide(color: Colors.black, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                  ),
                ),
              ),
              20.getH(),
              Container(
                width: double.infinity,
                margin:
                    EdgeInsets.symmetric(horizontal: 24.we, vertical: 10.he),
                child: TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 13.he),
                      backgroundColor: Colors.green),
                  onPressed: () {
                    context.read<PlanCubit>().addPlan(planText);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Save Plan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class TimeMyWidget extends StatelessWidget {
  const TimeMyWidget({super.key});



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.we, vertical: 20.he),
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Enter time"),
          10.getH(),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  onChanged: (v){
                    hourText = v;
                  },
                  controller: TextEditingController(text: "01"),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d+$'))
                  ],
                  maxLength: 2,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15.we),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                  10.getH(),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 15.we),
              Expanded(
                child: TextFormField(
                  onChanged: (v){
                    minuteText = v;
                  },
                  controller: TextEditingController(text: "00"),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d+$'))
                  ],
                  maxLength: 2,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text("Hour"),
              SizedBox(width: 140.we),
              Text("Minute"),
            ],
          ),
        ],
      ),
    );
  }
}
