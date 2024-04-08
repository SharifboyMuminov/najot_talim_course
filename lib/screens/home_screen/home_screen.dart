import 'package:default_project/bloc/card_bloc.dart';
import 'package:default_project/bloc/card_event.dart';
import 'package:default_project/bloc/card_state.dart';
import 'package:default_project/data/api_provider/api_provider.dart';
import 'package:default_project/data/models/card/card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiProvider apiProvider = ApiProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CardBloc, CardState>(
        builder: (BuildContext context, CardState state) {
          if (state is ErrorState) {
            return Center(child: Text(state.errorText));
          }
          if (state is OkState) {
            return ListView(
              children: [
                ...List.generate(
                  state.cards.length,
                  (index) {
                    CardModel cardModel = state.cards[index];
                    return ListTile(
                      onLongPress: (){
                        context.read<CardBloc>().add(DeleteCardEvent(cardModel: cardModel));
                      },
                      title: Text(cardModel.ownerName),
                    );
                  },
                ),
                TextButton(
                  onPressed: () {
                    context.read<CardBloc>().add(
                          InsertCardEvent(
                            cardModel: CardModel(
                              color: Colors.white,
                              amount: 2002,
                              cardNumber: "1234543212345678",
                              expireDate: "05/33",
                              bankName: "Agro Bank",
                              cardName: "Vica",
                              isMain: false,
                              ownerName: "Shohjahon Murodov mazgi",
                              uuid: "",
                            ),
                          ),
                        );
                  },
                  child: Icon(Icons.add),
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
