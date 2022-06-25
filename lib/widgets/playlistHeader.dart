import 'package:flutter/material.dart';
import '../data/data.dart';

class PlayListHeader extends StatelessWidget {
  final Playlist playList;

  const PlayListHeader({super.key, required this.playList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              playList.imageURL,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PLAYLIST',
                  style: Theme.of(context)
                      .textTheme
                      .overline!
                      .copyWith(fontSize: 12),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  playList.name,
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  playList.description,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                    'Created by ${playList.creator} · ${playList.songs.length} songs, ${playList.duration}'),
              ],
            ))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        _PlayListButton(followers: playList.followers),
      ],
    );
  }
}

class _PlayListButton extends StatelessWidget {
  final String followers;

  const _PlayListButton({super.key, required this.followers});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 48),
              backgroundColor: Theme.of(context).accentColor,
              textStyle: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(fontSize: 12, letterSpacing: 2),
              primary: Theme.of(context).iconTheme.color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: () {},
          child: Tooltip(message: 'Play This Playlist', child: Text('PLAY')),
        ),
        const SizedBox(
          width: 8,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite_border),
          iconSize: 30,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_horiz),
          iconSize: 30,
        ),
        const Spacer(),
        Tooltip(
          message: 'Followers for this playlist',
          child: Text(
            'FOLLOWERS\n$followers',
            style: Theme.of(context).textTheme.overline!.copyWith(fontSize: 12),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
