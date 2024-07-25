import 'package:racunalni_sah/queens_gambit.dart';
import 'package:flutter/material.dart';

class ChessOpenings extends StatefulWidget {
  const ChessOpenings({super.key});

  @override
  State<ChessOpenings> createState() => _ChessOpeningsState();
}

class _ChessOpeningsState extends State<ChessOpenings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kraljev Gambit'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.brown,
        child: Column(
          children: [
            const SizedBox(height: 30),
            SizedBox(
              height: 300,
              child: Image.asset('images/kingsgambit.jpg'),
            ),
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
                  'Kraljev gambit, otvaranje koje se najviše igralo u doba šahosvkog romantizma odnosno u 19. i početkom 20. stoljeća . Bijeli žrtvuje pješaka kako bi zauzeo centar i dobio inicijativu za napad na crnog kralja. Karakterizira ga veoma oštra i taktička borba. Danas se rijetko viđa na vrhunskom nivou jer so računala pronašla načine da bijeli ne samo izjednači već i dobije blagu prednost iz otvaranja. ',
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const QueensGambit();
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
