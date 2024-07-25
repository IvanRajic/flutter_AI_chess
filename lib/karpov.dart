import 'package:flutter/material.dart';
import 'package:racunalni_sah/fischer.dart';
import 'package:racunalni_sah/kasparov.dart';
import 'package:racunalni_sah/main.dart';

class Karpov extends StatefulWidget {
  const Karpov({super.key});

  @override
  State<Karpov> createState() => _KarpovState();
}

class _KarpovState extends State<Karpov> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anatoly Karpov'),
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
            Image.asset('images/karpov.jpg'),
            const SizedBox(
              height: 30,
            ),
            const Divider(),
            Container(
              width: double.infinity,
              color: Colors.brown,
              child: const Center(
                child: Text(
                  'Anatoly Karpov postao je svjetski prvaj 1975. nakon što je Fischer odbio igrati meč pod kontroverznim okolnostima. Karpov je želio igrati meč ali tadašnji Sovjetski Savez postavljao uvjete koje Fischer nije želio prihvatiti. Nakon dolaska na tron Karpov je 10 godina osvajao najjače turnire i pokazao svijetu zašto je tu gdje jest.  ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 90),
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
                    return const Fischer();
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
                    return const Kasparov();
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
