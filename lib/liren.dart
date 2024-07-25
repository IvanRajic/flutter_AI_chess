import 'package:flutter/material.dart';
import 'package:racunalni_sah/magnus.dart';
import 'package:racunalni_sah/main.dart';

class Liren extends StatefulWidget {
  const Liren({super.key});

  @override
  State<Liren> createState() => _LirenState();
}

class _LirenState extends State<Liren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ding Liren'),
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
            Image.asset('images/ding.jpg'),
            const SizedBox(
              height: 30,
            ),
            const Divider(),
            Container(
              width: double.infinity,
              color: Colors.brown,
              child: const Center(
                child: Text(
                  'Ding Liren je trenutni svjetski prvak i ujedno prvi kineski šahosvki prvak. Nakon što je Carlsen odlučio ne braniti meč, meč za svjetskog prvaka se održao između ruskog velemajstora Ian Nepomniachtchi-ja i Ding Lirena. Nakon napete borbe u rapid formatu Ding pobjeđuje i postaje 17. svjetski šahovski prvak.  ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const Magnus();
                  }));
                },
                child: const Icon(Icons.keyboard_double_arrow_left),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
