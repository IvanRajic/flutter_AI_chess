import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:racunalni_sah/home_page.dart';
import 'package:racunalni_sah/main.dart';
import 'package:racunalni_sah/smothered.dart';
import 'package:racunalni_sah/tactics.dart';

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

class Legal extends StatefulWidget {
  const Legal({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Tactics createState() => _Tactics();
}

class _Tactics extends State<Legal> {
  ChessBoardController controller = ChessBoardController();
  List<String> correctMoves = ['Bxf7+', 'Nd5#'];
  int moveIndex = 0;

  @override
  void initState() {
    super.initState();
    controller.game.load(
        'rnbqkbnr/1pp2ppp/p2p4/4N3/2B1P3/2N5/PPPP1PPP/R1BbK2R w KQkq - 0 5');
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
                                    const Text('Wrong'),
                                    SnackBarAction(
                                      label: 'Try again',
                                      onPressed: () {
                                        setState(() {
                                          if (moveIndex == 0) {
                                            controller.game.load(
                                                'rnbqkbnr/1pp2ppp/p2p4/4N3/2B1P3/2N5/PPPP1PPP/R1BbK2R w KQkq - 0 5');
                                          } else if (moveIndex == 1) {
                                            controller.game.load(
                                                'rnbqkbnr/1pp2ppp/p2p4/4N3/2B1P3/2N5/PPPP1PPP/R1BbK2R w KQkq - 0 5');
                                            controller.game.move('Bxf7+');
                                            controller.game.move('Ke7');
                                          }
                                        });
                                      },
                                    ),
                                  ])),
                        );
                      } else {
                        String message = moveIndex == correctMoves.length - 1
                            ? 'Solved!'
                            : 'Correct....continue';
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(message),
                            duration: const Duration(days: 1),
                          ),
                        );
                        moveIndex++;
                        if (moveIndex == 1) {
                          controller.game.move(('Ke7'));
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
                    return const Tactics();
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
                    return const Smother();
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
