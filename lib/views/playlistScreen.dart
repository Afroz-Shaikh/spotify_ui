import 'package:flutter/material.dart';
import 'package:spotify/data/data.dart';

import '../widgets/widgets.dart';

class PlayListScreen extends StatefulWidget {
  final Playlist playlist;

  const PlayListScreen({Key? key, required this.playlist}) : super(key: key);

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  ScrollController? _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 140,
        actions: [
          TextButton.icon(
              style: TextButton.styleFrom(
                  primary: Theme.of(context).iconTheme.color),
              onPressed: () {},
              icon: Icon(
                Icons.account_circle_outlined,
                size: 30,
              ),
              label: Text(
                'Shaikh Afroz',
                style: TextStyle(),
              )),
          SizedBox(
            width: 8,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_arrow_down,
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
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
              Color(0xff3A3A3A),
              Theme.of(context).backgroundColor
            ],
                stops: const [
              0,
              0.3
            ])),
        child: Scrollbar(
            controller: _scrollController,
            child: ListView(
              controller: _scrollController,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 60,
              ),
              children: [
                PlayListHeader(playList: widget.playlist),
              ],
            )),
      ),
    );
  }
}
