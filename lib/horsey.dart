import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:racunalni_sah/home_page.dart';
import 'package:racunalni_sah/main.dart';
import 'package:racunalni_sah/skewer.dart';

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

class Horsey extends StatefulWidget {
  const Horsey({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Tactics createState() => _Tactics();
}

class _Tactics extends State<Horsey> {
  ChessBoardController controller = ChessBoardController();
  List<String> correctMoves = ['Qxc6', 'Ne7+', 'Nxc6'];
  int moveIndex = 0;

  @override
  void initState() {
    super.initState();
    controller.game
        .load('3r1rk1/p1pq1ppp/1pn2p2/1Q1N4/2P5/1P6/P4PPP/R3R1K1 w - - 0 25');
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
                                                '3r1rk1/p1pq1ppp/1pn2p2/1Q1N4/2P5/1P6/P4PPP/R3R1K1 w - - 0 25');
                                          } else if (moveIndex == 1) {
                                            controller.game.load(
                                                '3r1rk1/p1p2ppp/1pq2p2/3N4/2P5/1P6/P4PPP/R3R1K1 w - - 0 25');
                                          } else if (moveIndex == 2) {
                                            controller.game.load(
                                                '3r1r1k/p1p1Nppp/1pq2p2/8/2P5/1P6/P4PPP/R3R1K1 w - - 0 25');
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
                          controller.game.move(('Qxc6'));
                        } else if (moveIndex == 2) {
                          controller.game.move(('Kh8'));
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const Skewer();
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
