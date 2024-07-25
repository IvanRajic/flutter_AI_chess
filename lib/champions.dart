import 'package:flutter/material.dart';
import 'package:racunalni_sah/lasker.dart';

class WorldChampions extends StatefulWidget {
  const WorldChampions({super.key});

  @override
  State<WorldChampions> createState() => _WorldChampionsState();
}

class _WorldChampionsState extends State<WorldChampions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wilhelm Steinitz'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.brown,
        child: Column(
          children: [
            const SizedBox(height: 30),
            Image.asset('images/steinitz.jpg'),
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
                  'Wilhelm Steinitz was an Austrian chess player and the first official world chess champion. In 1886. in a match he won against Zukertot and became first world chess champion. He defended his title successfully up to 1894. when he lost to Emanuel Lasker. He is considered to be the founder of positional school of chess.  ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 0),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.brown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const Lasker();
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
