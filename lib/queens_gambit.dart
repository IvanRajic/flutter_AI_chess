import 'package:racunalni_sah/chessopenings.dart';
import 'package:racunalni_sah/main.dart';
import 'package:racunalni_sah/ruy_lopez.dart';
import 'package:flutter/material.dart';

class QueensGambit extends StatefulWidget {
  const QueensGambit({super.key});

  @override
  State<QueensGambit> createState() => _QueensGambitState();
}

class _QueensGambitState extends State<QueensGambit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Queen\'s gambit'),
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
            SizedBox(
              height: 300,
              child: Image.asset('images/queensgambit.jpg'),
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
                  'Queen\'s gambit, opening that is very popular at the highest level and has been played for more than 150 years. White sacrifices a pawn with a goal of controlling the center. The sacrifice is often rejected because black has trouble defending taken pawn and gives white more than enough compensation. This opening inspired popular Netflix show "Queen\'s Gambit". ',
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
                    return const ChessOpenings();
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
                    return const RuyLopez();
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
