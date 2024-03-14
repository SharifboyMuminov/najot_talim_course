import 'package:default_project/data/models/state/state_model.dart';
import 'package:default_project/view_models/state_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "States",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
          ),
        ),
      ),
      body: context.watch<StateView>().states.isNotEmpty
          ? ListView(
              children: [
                ...List.generate(
                  context.watch<StateView>().states.length,
                  (index) {
                    StateModel stateModel =
                        context.watch<StateView>().states[index];

                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: ListTile(
                        title: Text(stateModel.stateNameModel.nameState),
                        leading: Image.network(
                          stateModel.stateGerbModel.png,
                          width: 50,
                          height: 50,
                        ),
                        trailing: Image.network(
                          stateModel.stateFlagModel.png,
                          width: 70,
                        ),
                      ),
                    );
                  },
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
    );
  }
}
