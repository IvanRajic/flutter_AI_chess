import 'package:flutter/material.dart';
import 'package:racunalni_sah/botvinik.dart';
import 'package:racunalni_sah/main.dart';
import 'package:racunalni_sah/tal.dart';

class Smislov extends StatefulWidget {
  const Smislov({super.key});

  @override
  State<Smislov> createState() => _SmislovState();
}

class _SmislovState extends State<Smislov> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vasilij Smislov'),
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
            Image.asset('images/smislov.jpg'),
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
                  'Vasilij Smislov je bio ruski šahovski velemajstor i svjetski prvak pobjedom u meču protiv Botvinika 1957. Bio je poznat po pozicionoj igri i svojim završnicama iako ima i dosta lijepih partija taktičkog karaktera. Dao je veliki doprinos teoriji šahovskih otvaranja kao što su Englesko otvaranje, Sicilijanka i Španjolka.   ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),
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
                    return const Botvinik();
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
                    return const Tal();
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
