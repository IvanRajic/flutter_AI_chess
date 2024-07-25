import 'package:flutter/material.dart';
import 'package:racunalni_sah/italijanka.dart';
import 'package:racunalni_sah/main.dart';
import 'package:racunalni_sah/queens_gambit.dart';

class RuyLopez extends StatefulWidget {
  const RuyLopez({super.key});

  @override
  State<RuyLopez> createState() => _RuyLopezState();
}

class _RuyLopezState extends State<RuyLopez> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Španjolska partija'),
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
        padding: const EdgeInsets.all(5.0),
        color: Colors.brown,
        child: Column(
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: Image.asset('images/ruylopez.jpg'),
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
                  'Španjolka ili po originalnom nazivu Ruy Lopez otvaranje je također jedno od popularnijih otvaranja koja su se igrala više od jednog stoljeća na najvišem nivou. Poznata je po velikom opsegu šahovske teorije i napisano je mnogo knjiga o ovom otvaranju. Bijeli potezom Lb5 maksimizira aktivnost svojih figura i napada skakača koji brani centralnog e5 pješaka. ',
                  style: TextStyle(
                      color: Colors.black,
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
                    return const QueensGambit();
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
                    return const Italian();
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
