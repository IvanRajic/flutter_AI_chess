import 'package:flutter/material.dart';
import 'package:racunalni_sah/kramnik.dart';
import 'package:racunalni_sah/magnus.dart';
import 'package:racunalni_sah/main.dart';

class Anand extends StatefulWidget {
  const Anand({super.key});

  @override
  State<Anand> createState() => _AnandState();
}

class _AnandState extends State<Anand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Viswanathan Anand'),
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
            Image.asset('images/anand.jpg'),
            const SizedBox(
              height: 40,
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.all(10.0),
              width: double.infinity,
              color: Colors.brown,
              child: const Center(
                child: Text(
                  'Anand je postao prvi indijski velemajstor 1988. godine i neosporivi svjetski prvak 2007. pobjedom nad Kramnikom. Uspješno je branio titulu protiv Topalova 2010. i protiv Gelfanda 2012. Izgubio je titulu 2013. protiv Carlsena. Anand i dan danas igra šah na vrhunskom svjetskom nivou i uzor je mnogim indijskim talentima.  ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
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
                    return const Kramnik();
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
                    return const Magnus();
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
