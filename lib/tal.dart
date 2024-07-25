import 'package:flutter/material.dart';
import 'package:racunalni_sah/main.dart';
import 'package:racunalni_sah/petrosian.dart';
import 'package:racunalni_sah/smislov.dart';

class Tal extends StatefulWidget {
  const Tal({super.key});

  @override
  State<Tal> createState() => _TalState();
}

class _TalState extends State<Tal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mikhail Tal'),
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
            Image.asset('images/tal.jpg'),
            const SizedBox(
              height: 30,
            ),
            const Divider(),
            Container(
              width: double.infinity,
              color: Colors.brown,
              child: const Center(
                child: Text(
                  'Mikhail Talj je bio latvijski šahist i 8. svjetski prvak. Imao je nadimak "Misha", a zvali su ga "Mađioničar iz Rige" jer je pravio čuda u svojim partijama. Igrao je veoma agresivno i često žrtvovao figure za napad ili inicijativu te je protivnike dovodio u veoma teške pozicije . Odigrao je mnogo lijepih partija i ostavio neizbrisiv trag u povijesti šaha.  ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 90),
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
                    return const Smislov();
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
                    return const Petrosian();
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
