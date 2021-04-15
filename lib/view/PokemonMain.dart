import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pokemon_app/model/PokemonBaseResponse.dart';
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
  int pokemonCharSize;
  TextEditingController etSearchPokemon;

  @override
  void setState(fn) {
    // TODO: implement setState
    this.pokemonCharSize = pokemonAppState.pokemonApiRepository
        .getAllPokemonCharacter()
        .asStream()
        .length as int;
    super.setState(fn);
  }

  @override
  void initState() {
    // TODO: implement initState
    pokemonAppState.getPokemonCharacters();
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
            child: TextField(
              controller: etSearchPokemon,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(5),
                  hintText: "Search by pokemon name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            )),
        Expanded(
            flex: 1,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: StreamBuilder<PokemonBaseResponse>(
                  stream: pokemonAppState.pokemonDataStateObservable,
                  builder:
                      (context, AsyncSnapshot<PokemonBaseResponse> snapshot) {
                    return CustomScrollView(
                      shrinkWrap: true,
                      slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate([
                            for (int i = 0;
                                i < snapshot.data.results.length;
                                i++)
                              Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Stack(
                                      alignment:
                                          AlignmentDirectional.bottomStart,
                                      children: [
                                        Card(
                                            elevation: 100,
                                            child: Container(
                                              child: Image.network(
                                                  "https://pokeres.bastionbot.org/images/pokemon/${i + 1}.png"),
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      begin:
                                                          AlignmentDirectional
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
                    );
                  },
                )))
      ],
    ));
  }
}
