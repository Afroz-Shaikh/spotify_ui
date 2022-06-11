import 'package:flutter/material.dart';
import 'package:spotify/data/data.dart';

class PlayListScreen extends StatefulWidget {
  final Playlist playlist;

  const PlayListScreen({Key? key, required this.playlist}) : super(key: key);

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 140,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {},
                  customBorder: const CircleBorder(),
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: Colors.black26, shape: BoxShape.circle),
                    child: Icon(
                      Icons.chevron_left,
                      size: 28,
                    ),
                  )),
              SizedBox(
                width: 15,
              ),
              InkWell(
                  onTap: () {},
                  customBorder: const CircleBorder(),
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: Colors.black26, shape: BoxShape.circle),
                    child: Icon(
                      Icons.chevron_right,
                      size: 28,
                    ),
                  ))
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              // Color(0xffE5DBBD),
              Colors.blue,
              Theme.of(context).backgroundColor
            ],
                stops: const [
              0,
              0.3
            ])),
      ),
    );
  }
}
