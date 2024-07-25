import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:racunalni_sah/home_page.dart';
import 'package:racunalni_sah/legal.dart';
import 'package:racunalni_sah/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class Tactics extends StatefulWidget {
  const Tactics({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Tactics createState() => _Tactics();
}

class _Tactics extends State<Tactics> {
  ChessBoardController controller = ChessBoardController();
  String correctMove = 'Qh5#';

  @override
  void initState() {
    super.initState();
    controller.game
        .load('rnbqkbnr/ppppp2p/5p2/6p1/3PP3/8/PPP2PPP/RNBQKBNR w KQkq - 0 1');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chessmasters'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
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
      backgroundColor: Colors.brown,
      body: Container(
        color: Colors.brown,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Center(
                  child: ChessBoard(
                    controller: controller,
                    boardColor: BoardColor.brown,
                    boardOrientation: PlayerColor.white,
                    onMove: () {
                      String pgn = controller.game.pgn();
                      if (pgn.isNotEmpty) {
                        List<String> moves = pgn.split(' ');
                        String lastMove = moves.last;
                        if (lastMove != correctMove) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                duration: const Duration(days: 1),
                                content: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      const Text('Pogrešno'),
                                      SnackBarAction(
                                        label: 'Pokušajte ponovno',
                                        onPressed: () {
                                          setState(() {
                                            controller.game.load(
                                                'rnbqkbnr/ppppp2p/5p2/6p1/3PP3/8/PPP2PPP/RNBQKBNR w KQkq - 0 1');
                                          });
                                        },
                                      ),
                                    ])),
                          );
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: (Text('Bravo!')),
                          ));
                        }
                      }
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: ValueListenableBuilder<Chess>(
                valueListenable: controller,
                builder: (BuildContext context, Chess game, Widget? child) {
                  return Text(
                    controller.getSan().fold(
                          '',
                          (previousValue, element) =>
                              '$previousValue\n${element ?? ''}',
                        ),
                  );
                },
              ),
            ),
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
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const Legal();
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
