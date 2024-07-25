import 'package:flutter/material.dart';
import 'package:racunalni_sah/anand.dart';
import 'package:racunalni_sah/kasparov.dart';
import 'package:racunalni_sah/main.dart';

class Kramnik extends StatefulWidget {
  const Kramnik({super.key});

  @override
  State<Kramnik> createState() => _KramnikState();
}

class _KramnikState extends State<Kramnik> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vladimir Kramnik'),
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
            Image.asset('images/kramnik.jpg'),
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
                  'Kramnik postaje svjetski prvak 2000. godine pobjedivši legendarnog Kasparova u meču. Iako je Kasparov bio veliki favorit, Kramnikova priprema Berlinske obrane s crnim figurama je predstavljala veliki problem Kasparovu jer je nije mogao probiti i osovjiti cijeli bod. Kramnik ostaje prvak do 2007. godine kada gubi protiv Indijca Ananda.    ',
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
                    return const Kasparov();
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
                    return const Anand();
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
