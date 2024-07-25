import 'package:flutter/material.dart';
import 'package:racunalni_sah/main.dart';
import 'package:racunalni_sah/spassky.dart';
import 'package:racunalni_sah/tal.dart';

class Petrosian extends StatefulWidget {
  const Petrosian({super.key});

  @override
  State<Petrosian> createState() => _PetrosianState();
}

class _PetrosianState extends State<Petrosian> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tigran Petrosian'),
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
            Image.asset('images/petrosian.jpg'),
            const SizedBox(
              height: 40,
            ),
            const Divider(),
            Container(
              width: double.infinity,
              color: Colors.brown,
              child: const Center(
                child: Text(
                  'Tigran Petrosjan bio je Armenski šahista i svjetski prvak. Porazio je Botvinika u meču. Zvali su ga "Željezni Tigran" zbog njegovog defanzivnog stila koji prioritizira sigurnost iznad svega. Bio je poznat po strateškom motivu poziciona žrtva kvalitete žrtvujući topa za skakača ili lovca kako bi dobio inicijativu ili pozicionu prednost. ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
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
                    return const Tal();
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
                    return const Spassky();
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
