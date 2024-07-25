import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:racunalni_sah/home_page.dart';
import 'package:racunalni_sah/main.dart';
import 'package:racunalni_sah/skewer.dart';
import 'package:racunalni_sah/smothered.dart';

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

class Deflect extends StatefulWidget {
  const Deflect({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Tactics createState() => _Tactics();
}

class _Tactics extends State<Deflect> {
  ChessBoardController controller = ChessBoardController();
  List<String> correctMoves = ['Rh8+', 'Qh6+', 'Qg7#'];
  int moveIndex = 0;

  @override
  void initState() {
    super.initState();
    controller.game
        .load('r1r3k1/5p2/1n3Pp1/4p3/4p3/pPq1Q3/P1P3P1/1KB4R w - - 0 27');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chessmasters'),
        centerTitle: true,
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
      body: Column(
        children: [
          const SizedBox(height: 30),
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
                      if (lastMove != correctMoves[moveIndex]) {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
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
                                          if (moveIndex == 0) {
                                            controller.game.load(
                                                'r1r3k1/5p2/1n3Pp1/4p3/4p3/pPq1Q3/P1P3P1/1KB4R w - - 0 27');
                                          } else if (moveIndex == 1) {
                                            controller.game.load(
                                                'r1r4k/5p2/1n3Pp1/4p3/4p3/pPq1Q3/P1P3P1/1KB5 w - - 0 27');
                                          } else if (moveIndex == 2) {
                                            controller.game.load(
                                                'r1r3k1/5p2/1n3PpQ/4p3/4p3/pPq5/P1P3P1/1KB5 w - - 0 27');
                                          }
                                        });
                                      },
                                    ),
                                  ])),
                        );
                      } else {
                        String message = moveIndex == correctMoves.length - 1
                            ? 'Bravo!'
                            : 'Točno....nastavite';
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(message),
                            duration: const Duration(days: 1),
                          ),
                        );
                        moveIndex++;
                        if (moveIndex == 1) {
                          controller.game.move(('Kxh8'));
                        } else if (moveIndex == 2) {
                          controller.game.move(('Kg8'));
                        }
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
      bottomNavigationBar: BottomAppBar(
        color: Colors.brown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const Smother();
                  }));
                },
                child: const Icon(Icons.keyboard_double_arrow_left),
              ),
            ),
            const SizedBox(width: 200),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const Skewer();
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
