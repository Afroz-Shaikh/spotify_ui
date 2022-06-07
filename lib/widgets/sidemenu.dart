import 'package:flutter/material.dart';
import 'package:spotify/data/data.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/spotify_logo.png',
                  filterQuality: FilterQuality.high,
                  height: 55.0,
                ),
              ),
            ],
          ),
          _iconTabs(
            iconData: Icons.home,
            ontap: () {},
            title: 'Home',
          ),
          _iconTabs(
            iconData: Icons.search,
            ontap: () {},
            title: 'Search',
          ),
          _iconTabs(
            iconData: Icons.audiotrack,
            ontap: () {},
            title: 'Radio',
          ),
          const SizedBox(
            height: 13.0,
          ),
          _PlaylistLibrary(),
        ],
      ),
    );
  }
}

class _iconTabs extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback ontap;

  const _iconTabs(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      leading: Icon(
        iconData,
        color: Theme.of(context).iconTheme.color,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _PlaylistLibrary extends StatefulWidget {
  _PlaylistLibrary({Key? key}) : super(key: key);

  @override
  State<_PlaylistLibrary> createState() => __PlaylistLibraryState();
}

class __PlaylistLibraryState extends State<_PlaylistLibrary> {
  ScrollController? _scrollbar;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollbar = ScrollController();
  }

  @override
  void dispose() {
    _scrollbar?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        controller: _scrollbar,
        // isAlwaysShown: true,
        child: ListView(
          controller: _scrollbar,
          padding: EdgeInsets.symmetric(vertical: 12.0),
          physics: const ClampingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Text(
                    'YOUR LIBRARY',
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...yourLibrary
                    .map((e) => ListTile(
                          dense: true,
                          onTap: () {},
                          title: Text(
                            e,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ))
                    .toList()
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Text(
                    'PLAYLISTS',
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...playlists
                    .map((e) => ListTile(
                          dense: true,
                          onTap: () {},
                          title: Text(
                            e,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ))
                    .toList()
              ],
            )
          ],
        ),
      ),
    );
  }
}
