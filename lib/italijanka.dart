import 'package:flutter/material.dart';
import 'package:racunalni_sah/main.dart';
import 'package:racunalni_sah/ruy_lopez.dart';
import 'package:racunalni_sah/sicilian.dart';

class Italian extends StatefulWidget {
  const Italian({super.key});

  @override
  State<Italian> createState() => _ItalianState();
}

class _ItalianState extends State<Italian> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Italijanska partija'),
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
              child: Image.asset('images/italian.jpg'),
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
                  'Italijanka ili Giuoco Piano što na italijanskom znači "mirna partija" jedno je od najstarijih zabilježenih otvaranja u povijesti ove drevne igre. Iako bijeli postavlja svog lovca na agresivno polje gdje udara na slabu točku f7, praksa je pokazala kako crni ima dosta izbora i u dosta varijanti nastaju remi pozicije te od tuda dolazi i naziv. ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 70),
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
                    return const RuyLopez();
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
                    return const Sicilian();
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
