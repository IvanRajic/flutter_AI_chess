import 'package:flutter/material.dart';
import 'package:racunalni_sah/main.dart';
import 'package:racunalni_sah/sicilian.dart';

class KingsIndian extends StatefulWidget {
  const KingsIndian({super.key});

  @override
  State<KingsIndian> createState() => _KingsIndianState();
}

class _KingsIndianState extends State<KingsIndian> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kraljeva indijska obrana'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const RootPage();
                },
              ),
            );
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        color: Colors.brown,
        child: Column(
          children: [
            const SizedBox(height: 30),
            SizedBox(
              height: 300,
              child: Image.asset('images/kingsindian.jpg'),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            Container(
              width: double.infinity,
              color: Colors.brown,
              child: const Center(
                child: Text(
                  'Kraljeva indijska obrana je hipermoderno otvaranje u kojem crni pušta bijelom da zauzme centar ali ga kasnije napada pješacima i figurama. Crni fijanketira kraljevog lovca i pravi bunker oko kralja koji je teško probiti. Iz tog razloga glavni plan napada bijelog sastoji se na daminom krilu, a crni gura pješake na kraljevom krilu te ide u napad na bijelog kralja. ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.brown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const Sicilian();
                  }));
                },
                child: const Icon(Icons.keyboard_double_arrow_left),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
