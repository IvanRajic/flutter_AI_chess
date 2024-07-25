import 'package:flutter/material.dart';
import 'package:racunalni_sah/alekhine.dart';
import 'package:racunalni_sah/botvinik.dart';
import 'package:racunalni_sah/main.dart';

class Euwe extends StatefulWidget {
  const Euwe({super.key});

  @override
  State<Euwe> createState() => _EuweState();
}

class _EuweState extends State<Euwe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Max Euwe'),
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
            Image.asset('images/euwe.jpg'),
            const SizedBox(
              height: 30,
            ),
            const Divider(),
            Container(
              width: double.infinity,
              color: Colors.brown,
              child: const Center(
                child: Text(
                  'Max Euwe je bio nizozemski šahist, matematičar i predsjednik svjetske šahovske organizacije FIDE. Iako je bio šahist amater, dubinskim pripremama i proučavanjem Aljehinovih partija je uspio da ga pobijedi 1935. i tako postane svjetski prvak iako mu mnogi nisu davali šanse. Njegova uloga u organizaciji FIDE je veoma značajna jer je bio predsjednik od 1970. - 1978. i bio je značajna figura u organizaciji meča Fischer-Spassky.   ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 30),
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
                    return const Alekhine();
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
                    return const Botvinik();
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
