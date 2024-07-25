import 'package:flutter/material.dart';
import 'package:racunalni_sah/champions.dart';
import 'package:racunalni_sah/kapablanka.dart';
import 'package:racunalni_sah/main.dart';

class Lasker extends StatefulWidget {
  const Lasker({super.key});

  @override
  State<Lasker> createState() => _LaskerState();
}

class _LaskerState extends State<Lasker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emanuel Lasker'),
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
        color: Colors.brown,
        child: Column(
          children: [
            const SizedBox(height: 30),
            Image.asset('images/lasker.jpg'),
            const SizedBox(
              height: 30,
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.all(10.0),
              width: double.infinity,
              color: Colors.brown,
              child: const Center(
                child: Text(
                  'Emanuel Lasker je postao svjetski prvak 1894. porazivši Steinitza u meču. Na tronu se zadržao punih 27 godina što više nikome nije uspjelo. Pored šaha se bavio matematikom i filozofijom. Optuživali su ga da hipnotizira protivnike, baca uroke, koristi psihološke trikove i na kraju da ima nevjerojatnu sreću. Njegov stil se može opisati kao veoma agresivan, a bio je veoma borben i izdržljiv u dugim partijama. ',
                  textAlign: TextAlign.start,
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const WorldChampions();
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
                    return const Kapablanka();
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
