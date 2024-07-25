import 'package:flutter/material.dart';
import 'package:racunalni_sah/alekhine.dart';
import 'package:racunalni_sah/lasker.dart';
import 'package:racunalni_sah/main.dart';

class Kapablanka extends StatefulWidget {
  const Kapablanka({super.key});

  @override
  State<Kapablanka> createState() => _KapablankaState();
}

class _KapablankaState extends State<Kapablanka> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('José Raúl Capablanca'),
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
            Image.asset('images/kapablanka.jpg'),
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
                  'José Raúl Capablanca pobijedio je 1921. Laskera i tako postao 3. svjetski šahovski prvak. Bio je kubanski šahista i smatra se jednim od najtalentiranijih šahista u povijesti drevne igre. Njegov stil je bio veoma jednostavan i principijelan. Završnice su mu bile specijalnost i često mu je polazilo za rukom da dobije potpuno jednake završnice.   ',
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
                    return const Lasker();
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
                    return const Alekhine();
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
