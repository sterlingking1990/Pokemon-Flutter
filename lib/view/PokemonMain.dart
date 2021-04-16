import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pokemon_app/model/PokemonBaseResponse.dart';
import 'package:pokemon_app/model/SinglePokemonResponse.dart';
import 'package:pokemon_app/network/appstatemanagement.dart';

void main() => runApp(PokemonMain());

class PokemonMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.amber,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: SafeArea(child: PokemonAppEntry(title: 'PokemonApp')),
      );
}

class PokemonAppEntry extends StatefulWidget {
  final String title;

  const PokemonAppEntry({Key key, this.title}) : super(key: key);

  @override
  _PokemonAppEntryState createState() => _PokemonAppEntryState();
}

class _PokemonAppEntryState extends State<PokemonAppEntry> {
  PokemonBaseResponse pokemonBaseResponse;
  TextEditingController etSearchPokemon;

  String searching = "";

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  void initState() {
    // TODO: implement initState
    pokemonAppState.getPokemonCharacters();
    pokemonBaseResponse = pokemonAppState.pokemonDataStateObservable.value;
    etSearchPokemon = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle headline4 = Theme.of(context).textTheme.headline4;
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Image.network(
              "https://www.gannett-cdn.com/presto/2019/12/13/PREN/056dc099-5c18-47af-a416-435f29175b70-Switch_PokemonSwordPokemonShield_artwork_01_png_jpgcopy.jpg?crop=5852,3292,x0,y227&width=3200&height=1801&format=pjpg&auto=webp",
              fit: BoxFit.cover,
            ),
            Text("Explore your Pokemon",
                style: TextStyle(
                    backgroundColor: Colors.black,
                    decorationStyle: TextDecorationStyle.dotted,
                    fontStyle: FontStyle.italic,
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            Positioned(
              top: 50.0,
              child: Text(
                "izundukingsley",
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    decorationStyle: TextDecorationStyle.dashed),
              ),
            )
          ],
        ),
        Padding(
            padding: EdgeInsets.all(10),
            child: Stack(
              children: [
                TextField(
                    controller: etSearchPokemon,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        hintText: "Search by pokemon name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                Positioned(
                    right: 30,
                    child: MaterialButton(
                      onPressed: filterPokemon,
                      child: Icon(Icons.search),
                    )),
                Positioned(
                    left: 330,
                    child: MaterialButton(
                        elevation: 100,
                        onPressed: refreshPokemonList,
                        child: Icon(Icons.refresh)))
              ],
            )),
        Expanded(
            flex: 1,
            child: Padding(padding: EdgeInsets.all(10), child: _generateView()))
      ],
    ));
  }

  Widget _generateView() {
    if (searching.isEmpty) {
      return StreamBuilder<PokemonBaseResponse>(
          stream: pokemonAppState.pokemonDataStateObservable,
          builder: (context, AsyncSnapshot<PokemonBaseResponse> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.error != "") {
                return _buildErrorWidget(snapshot.data.error);
              } else {
                return CustomScrollView(
                  shrinkWrap: true,
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate([
                        for (int i = 0; i < snapshot.data.results.length; i++)
                          Padding(
                              padding: EdgeInsets.all(10),
                              child: Stack(
                                  alignment: AlignmentDirectional.bottomStart,
                                  children: [
                                    Card(
                                        elevation: 100,
                                        child: Container(
                                          child: Image.network(
                                              "https://pokeres.bastionbot.org/images/pokemon/${i + 1}.png"),
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: AlignmentDirectional
                                                      .topStart,
                                                  end: AlignmentDirectional
                                                      .topEnd,
                                                  stops: [
                                                0.3,
                                                0.7,
                                                1
                                              ],
                                                  colors: <Color>[
                                                Color(0x9c9cfff),
                                                Color(0xc3c3bbbb),
                                                Color(0x1212dddd)
                                              ])),
                                        )),
                                    Text(
                                      snapshot.data.results[i].name,
                                      style: TextStyle(
                                          backgroundColor: Colors.amber,
                                          color: Colors.white,
                                          fontSize: 25,
                                          decorationThickness: 10),
                                    )
                                  ]))
                      ]),
                    ),
                  ],
                  // ignore: missing_return
                );
              }
            } else {
              return buildLoadingWidget();
            }
          });
    } else {
      return StreamBuilder<SinglePokemonResponse>(
          stream: pokemonAppState.singlePokemonCharacterObservable,
          builder: (context, AsyncSnapshot<SinglePokemonResponse> snapshots) {
            try {
              if (snapshots.hasData) {
                if (snapshots.data.error != "") {
                  return _buildErrorWidget(snapshots.data.error);
                } else {
                  return CustomScrollView(
                    shrinkWrap: true,
                    slivers: [
                      SliverList(
                        delegate: SliverChildListDelegate([
                          Padding(
                              padding: EdgeInsets.all(10),
                              child: Stack(
                                  alignment: AlignmentDirectional.bottomStart,
                                  children: [
                                    Card(
                                        elevation: 100,
                                        child: Container(
                                          child: Image.network(
                                              "https://pokeres.bastionbot.org/images/pokemon/${snapshots.data.id}.png"),
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: AlignmentDirectional
                                                      .topStart,
                                                  end: AlignmentDirectional
                                                      .topEnd,
                                                  stops: [
                                                0.3,
                                                0.7,
                                                1
                                              ],
                                                  colors: <Color>[
                                                Color(0x9c9cfff),
                                                Color(0xc3c3bbbb),
                                                Color(0x1212dddd)
                                              ])),
                                        )),
                                    Text(
                                      snapshots.data.name,
                                      style: TextStyle(
                                          backgroundColor: Colors.amber,
                                          color: Colors.white,
                                          fontSize: 25,
                                          decorationThickness: 10),
                                    )
                                  ]))
                        ]),
                      ),
                    ],
                    // ignore: missing_return
                  );
                }
              } else {
                return buildLoadingWidget();
              }
            } catch (error, stacktrace) {
              return _buildErrorWidget("Search does not exist");
            }
          });
    }
  }

  filterPokemon() {
    setState(() {
      searching = etSearchPokemon.text;
      pokemonAppState.getPokemon(etSearchPokemon.text);
    });
  }

  refreshPokemonList() {
    setState(() {
      searching = "";
      etSearchPokemon.clear();
      pokemonAppState.getPokemonCharacters();
    });
  }

  refreshMovieList(BuildContext context) {
    pokemonAppState.getPokemonCharacters();
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error"),
        MaterialButton(
            onPressed: refreshMovieList(context),
            color: Colors.amber,
            elevation: 100,
            child: Icon(Icons.refresh, color: Colors.amber, size: 50))
      ],
    ));
  }

  Widget buildLoadingWidget() => Center(
        child: Column(
          children: [Text("Loading pokemon..."), CircularProgressIndicator()],
        ),
      );
}
