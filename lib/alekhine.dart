import 'package:flutter/material.dart';
import 'package:racunalni_sah/euwe.dart';
import 'package:racunalni_sah/kapablanka.dart';
import 'package:racunalni_sah/main.dart';

class Alekhine extends StatefulWidget {
  const Alekhine({super.key});

  @override
  State<Alekhine> createState() => _AlekhineState();
}

class _AlekhineState extends State<Alekhine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alexander Alekhine'),
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
            Image.asset('images/alekhine.jpg'),
            const SizedBox(
              height: 30,
            ),
            const Divider(),
            Container(
              width: double.infinity,
              color: Colors.brown,
              child: const Center(
                child: Text(
                  'Alexander Alekhine bio je francuski i ruski šahista. Pošlo mu je za rukom da pobijedi legendarnog Kapablanku 1927.g.  u meču i tako postane 4. svjetskim šahovskim prvakom. Bio je poznat po svojoj sposobnosti da igra simultanke potpuno naslijepo i to na 30 tabli! Bio je prvi svjetski prvak koji je izgubio titulu i u revanšu je uspio vratiti te je umro kao svjetski pvak. Po njegovom imenu je nastalo otvaranje koje se i danas zove Aljehinova obrana. ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.brown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const Kapablanka();
                  }));
                },
                child: const Icon(Icons.keyboard_double_arrow_left),
              ),
            ),
            const SizedBox(width: 200),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const Euwe();
                  }));
                },
                child: const Icon(Icons.keyboard_double_arrow_right),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
