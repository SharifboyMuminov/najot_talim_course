import 'package:default_project/bloc/history/history_bloc.dart';
import 'package:default_project/bloc/history/history_event.dart';
import 'package:default_project/bloc/history/history_state.dart';
import 'package:default_project/bloc/region/region_bloc.dart';
import 'package:default_project/bloc/region/region_event.dart';
import 'package:default_project/bloc/region/region_state.dart';
import 'package:default_project/data/enums/form_status.dart';
import 'package:default_project/data/models/history/history_model.dart';
import 'package:default_project/screens/info/info_screen.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String inputTitle = "";

  bool showHistory = false;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          "Regions",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: BlocBuilder<RegionBloc, RegionState>(
        builder: (BuildContext context, RegionState state) {
          if (state.formsStatus == FormsStatus.error) {
            return Center(
              child: Text(
                state.errorText,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                ),
              ),
            );
          }

          if (state.formsStatus == FormsStatus.success) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.he,
                    vertical: 10.he,
                  ),
                  child: TextFormField(
                    onTap: () {
                      showHistory = true;
                      setState(() {});
                    },
                    onEditingComplete: () {
                      showHistory = false;
                      setState(() {});
                      FocusScope.of(context).unfocus();
                    },
                    onChanged: (v) {
                      inputTitle = v;
                      context
                          .read<RegionBloc>()
                          .add(SearchRegionCallEvent(searchTitle: v));
                      setState(() {});
                    },
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15.we,
                        vertical: 15.he,
                      ),
                      hintText: "Search...",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 2,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                if (showHistory)
                  BlocBuilder<HistoryBloc, HistoryState>(
                    builder: (BuildContext context, HistoryState historyState) {
                      if (state.formsStatus == FormsStatus.success) {
                        return Column(
                          children: List.generate(
                            historyState.historyModels.length,
                            (index) {
                              return ListTile(
                                title: Text(
                                  historyState.historyModels[index].title,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    context.read<HistoryBloc>().add(
                                          HistoryDeleteEvent(
                                            historyModel: historyState
                                                .historyModels[index],
                                          ),
                                        );
                                  },

                                  icon: Icon(
                                    Icons.remove,
                                    size: 15.sp,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }

                      return const Center(
                          child: CircularProgressIndicator.adaptive());
                    },
                  ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "${state.currentRegions.length} data.  ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                if (state.currentRegions.isEmpty)
                  Column(
                    children: [
                      SizedBox(height: 100.he),
                      Image.asset("assets/images/empty_img.png"),
                    ],
                  ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.currentRegions.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: () {
                          if (inputTitle.isNotEmpty) {
                            context.read<HistoryBloc>().add(
                                  HistoryInsertEvent(
                                    historyModel: HistoryModel(
                                      id: 0,
                                      title: inputTitle,
                                    ),
                                  ),
                                );
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return InfoScreen(
                                  regionModel: state.currentRegions[index],
                                );
                              },
                            ),
                          );
                        },
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              state.currentRegions[index].regionName
                                  .substring(0, inputTitle.length),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: 20.sp,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                state.currentRegions[index].regionName
                                    .substring(
                                  inputTitle.length,
                                  state.currentRegions[index].regionName.length,
                                ),
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }

          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
