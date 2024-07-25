import 'package:flutter/material.dart';
import 'package:racunalni_sah/italijanka.dart';
import 'package:racunalni_sah/kingsindian.dart';
import 'package:racunalni_sah/main.dart';

class Sicilian extends StatefulWidget {
  const Sicilian({super.key});

  @override
  State<Sicilian> createState() => _SicilianState();
}

class _SicilianState extends State<Sicilian> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sicilijanska obrana'),
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
            SizedBox(
              height: 300,
              child: Image.asset('images/sicilian.jpg'),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.all(10.0),
              width: double.infinity,
              color: Colors.brown,
              child: const Center(
                child: Text(
                  'Sicilijanska obrana je jedno od najboljih odgovara crnog na 1.e4. Crni već prvim potezom narušava ravnotežu u centru i sprema se na agresivnu i dinamičnu igru. Pored toga, postoji širok opseg varijanti u ovom otvaranju i crni ima jako puno opcija. Ovo otvaranje je bilo glavni repertoar svjetskih prvaka kao što su Fischer i Kasparov. ',
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
                    return const Italian();
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
                    return const KingsIndian();
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
