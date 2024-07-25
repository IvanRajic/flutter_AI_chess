import 'package:flutter/material.dart';
import 'package:racunalni_sah/anand.dart';
import 'package:racunalni_sah/liren.dart';
import 'package:racunalni_sah/main.dart';

class Magnus extends StatefulWidget {
  const Magnus({super.key});

  @override
  State<Magnus> createState() => _MagnusState();
}

class _MagnusState extends State<Magnus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Magnus Carlsen'),
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
            Image.asset('images/magnus.jpg'),
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
                  'Magnus Carlsen, norveški šahovski velemajstor postao je svjetski prvak 2013. porazivši Indijca Ananda u meču. Prozvan je šahovskim Mozartom kao vrlo mladi. Postao je prvak sa 22 godine, isto kao Kasparov ali sa malo više mjeseci. Branio je titulu 5 puta i dominirao je posljednju deceniju kao i dan danas. Trenutno je svjetski prvak u blitz i rapid kategoriji.',
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
                    return const Anand();
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
                    return const Liren();
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
