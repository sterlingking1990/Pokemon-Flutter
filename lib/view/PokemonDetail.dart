import 'package:flutter/material.dart';
import 'package:pokemon_app/model/PokemonCharacterPoDo.dart';
import 'package:pokemon_app/model/SinglePokemonResponse.dart';
import 'package:pokemon_app/model/abilities.dart';
import 'package:pokemon_app/model/moves.dart';
import 'package:pokemon_app/network/appstatemanagement.dart';

class PokemonDetail extends StatefulWidget {
  @override
  PokemonDetailState createState() => PokemonDetailState();
}

class PokemonDetailState extends State<PokemonDetail> {
  @override
  Widget build(BuildContext context) {
    PokemonCharacterPodo pokemonCharacterPodo =
        ModalRoute.of(context).settings.arguments;
    Future.delayed(Duration.zero, () {
      pokemonAppState.getPokemon(pokemonCharacterPodo.name);
    });

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(
                  Icons.directions_walk,
                  color: Colors.green,
                ),
                child: Text(
                  "Moves",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.run_circle,
                  color: Colors.green,
                ),
                child: Text(
                  "Abilities",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ]),
            elevation: 100,
            automaticallyImplyLeading: false,
            toolbarHeight: 250,
            flexibleSpace: Padding(
                padding: EdgeInsets.all(40),
                child: Stack(children: [
                  Positioned(
                      top: 5,
                      left: 50,
                      right: 50,
                      bottom: 5,
                      child: Container(
                          height: 250,
                          width: 250,
                          child: CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(
                                "https://pokeres.bastionbot.org/images/pokemon/${pokemonCharacterPodo.id}.png",
                              ))))
                ])),
          ),
          body: TabBarView(children: [
            StreamBuilder(
                stream: pokemonAppState.singlePokemonCharacterObservable,
                builder:
                    (context, AsyncSnapshot<SinglePokemonResponse> snapshot) {
                  if (snapshot.hasData) {
                    return buildMovesView(snapshot.data.moves);
                  } else {
                    return buildLoadingWidget();
                  }
                }),
            StreamBuilder(
                stream: pokemonAppState.singlePokemonCharacterObservable,
                builder:
                    (context, AsyncSnapshot<SinglePokemonResponse> snapshot) {
                  if (snapshot.hasData) {
                    return buildAbilitiesView(snapshot.data.abilities);
                  } else {
                    return buildLoadingWidget();
                  }
                }),
          ])),
    );
  }

  Widget buildLoadingWidget() => Center(
        child: Column(
          children: [
            Text("Loading pokemon moves..."),
            CircularProgressIndicator()
          ],
        ),
      );

  Widget buildMovesView(List<Moves> moves) => CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverPadding(
              padding: EdgeInsets.all(10),
              sliver: SliverList(
                  delegate: SliverChildListDelegate([
                for (int i = 0; i < moves.length; i++)
                  Container(
                      width: 50,
                      margin: EdgeInsets.all(10),
                      height: 50,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                            Color(0xa9a9333a),
                            Color(0xC3C39999),
                            Color(0xffffbf00)
                          ],
                              stops: [
                            0.3,
                            0.7,
                            1
                          ])),
                      child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            moves[i].move.name,
                            style: TextStyle(
                                fontSize: 15,
                                letterSpacing: 5,
                                color: Colors.white),
                          )))
              ])))
        ],
      );

  Widget buildAbilitiesView(List<Abilities> abilities) => CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverPadding(
              padding: EdgeInsets.all(10),
              sliver: SliverList(
                  delegate: SliverChildListDelegate([
                for (int i = 0; i < abilities.length; i++)
                  Container(
                      width: 50,
                      margin: EdgeInsets.all(10),
                      height: 50,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                            Color(0xa9a9333a),
                            Color(0xC3C39999),
                            Color(0xffffbf00)
                          ],
                              stops: [
                            0.3,
                            0.7,
                            1
                          ])),
                      child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            abilities[i].ability.name,
                            style: TextStyle(
                                fontSize: 15,
                                letterSpacing: 5,
                                color: Colors.white),
                          )))
              ])))
        ],
      );
}
