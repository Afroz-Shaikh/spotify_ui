import 'package:flutter/material.dart';
import 'package:spotify/data/data.dart';
import 'views.dart';

import '../widgets/widgets.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              if (MediaQuery.of(context).size.width > 1000) SideMenu(),
              Expanded(
                child: PlayListScreen(
                  playlist: lofihiphopPlaylist,
                ),
              ),
              //PLaylist -->
            ],
          )),
          NowPlaying(),
        ],
      ),
    );
  }
}
