import 'package:racunalni_sah/karpov.dart';
import 'package:flutter/material.dart';
import 'package:racunalni_sah/main.dart';
import 'package:racunalni_sah/spassky.dart';

class Fischer extends StatefulWidget {
  const Fischer({super.key});

  @override
  State<Fischer> createState() => _FischerState();
}

class _FischerState extends State<Fischer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bobby Fischer'),
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
            Image.asset('images/fischer.jpg'),
            const SizedBox(
              height: 40,
            ),
            const Divider(),
            Container(
              width: double.infinity,
              color: Colors.brown,
              child: const Center(
                child: Text(
                  'Bobby Fischer je postao svjetski prvak 1972. godine pobjedivši tadašnjeg svjetskog prvaka Borisa Spaskog. To je bio jedan od najgledanijih mečeva za prvaka svijeta u povijesti budući da je u doba Hladnoga rata meč bio između američkog izazivača i Ruskog branitelja titule. Fischer je pobijedio u meču i tako postao jedanaesti prvak svijeta.',
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
                    return const Spassky();
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
                    return const Karpov();
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
