import 'package:flutter/material.dart';
import 'package:racunalni_sah/euwe.dart';
import 'package:racunalni_sah/main.dart';
import 'package:racunalni_sah/smislov.dart';

class Botvinik extends StatefulWidget {
  const Botvinik({super.key});

  @override
  State<Botvinik> createState() => _BotvinikState();
}

class _BotvinikState extends State<Botvinik> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mihail Botvinik'),
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
            Image.asset('images/botvinik.jpg'),
            const SizedBox(
              height: 40,
            ),
            const Divider(),
            Container(
              width: double.infinity,
              color: Colors.brown,
              child: const Center(
                child: Text(
                  'Mihail Botvinik je bio ruski šahovski velemajstor i svjetski prvak koji je čak 3 puta uspio osvojiti titulu svjetskog prvaka (1948., 1958., 1961.). Njegov stil igre je bio konkretan i po njemu je više otvaranja dobilo ime. Također je osnivač sovjetske škole šaha i podučavao je buduće svjetske prvake kao što su Karpov, Kasparov i Kramnik. ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 80),
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
                    return const Euwe();
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
                    return const Smislov();
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
