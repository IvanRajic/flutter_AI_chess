import 'package:racunalni_sah/karpov.dart';
import 'package:racunalni_sah/kramnik.dart';
import 'package:flutter/material.dart';
import 'package:racunalni_sah/main.dart';

class Kasparov extends StatefulWidget {
  const Kasparov({super.key});

  @override
  State<Kasparov> createState() => _KasparovState();
}

class _KasparovState extends State<Kasparov> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gari Kasparov'),
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
            Image.asset('images/kasparov.jpg'),
            const SizedBox(
              height: 30,
            ),
            const Divider(),
            Container(
              width: double.infinity,
              color: Colors.brown,
              child: const Center(
                child: Text(
                  'Gari Kasparov, prema mnogima najbolji šahist koji je ikad postojao, postao je svjetski prvak sa samo 22 godine postavivši rekord koji do dan danas nije srušen. Dominirao je turnirima i bio je poznat po svom agresivnom stilu. 1997. godine igrao je meč protiv računalnog programa Deep Blue koji je izgubio i tada su računala preuzela vodstvo. ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 100),
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
                    return const Karpov();
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
                    return const Kramnik();
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
