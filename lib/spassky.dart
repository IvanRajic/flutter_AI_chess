import 'package:flutter/material.dart';
import 'package:racunalni_sah/fischer.dart';
import 'package:racunalni_sah/main.dart';
import 'package:racunalni_sah/petrosian.dart';

class Spassky extends StatefulWidget {
  const Spassky({super.key});

  @override
  State<Spassky> createState() => _SpasskyState();
}

class _SpasskyState extends State<Spassky> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boris Spassky'),
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
            Image.asset('images/spassky.jpg'),
            const SizedBox(
              height: 30,
            ),
            const Divider(),
            Container(
              width: double.infinity,
              color: Colors.brown,
              child: const Center(
                child: Text(
                  'Boris Spassky je postao svjetski prvak porazivši Petrosjana u meču 1969. godine. nakon što je prethodni meč izgubio. Vladao je tronom do dolaska Fischera i meč koji je odigrao sa njim 1972. je najgledaniji meč u povijesti igre. Iako je poražen u tom meču, dostojanstveno je podnio poraz i čak je prilikom gubitka jedne partije ustao i aplaudirao Fischeru na fantastičnoj igri. ',
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
                    return const Petrosian();
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
                    return const Fischer();
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
