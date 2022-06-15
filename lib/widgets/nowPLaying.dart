import 'package:flutter/material.dart';
import 'package:spotify/model/current_song.dart';
import 'package:provider/provider.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final songPlaying = context.watch<CurrentSongModel>().selected;
    if (songPlaying == null) return const SizedBox.shrink();

    return Container(
      height: 84,
      width: double.infinity,
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [_NowPlayingInfo(), _playingControls()],
        ),
      ),
    );
  }
}

class _NowPlayingInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentSongModel>().selected;
    if (selected == null) return const SizedBox.shrink();
    return Row(
      children: [
        Image.asset(
          'assets/asset01.png',
          height: 60,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selected.title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(selected.artist,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.grey[300], fontSize: 12))
          ],
        ),
        const SizedBox(
          width: 12,
        ),
        likeButton(),
      ],
    );
  }
}

class likeButton extends StatefulWidget {
  //  final bool isLiked;
  const likeButton({
    Key? key,
    // required this.isLiked,
  }) : super(key: key);

  @override
  State<likeButton> createState() => _likeButtonState();
}

class _playingControls extends StatelessWidget {
  const _playingControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentSongModel>().selected;
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              padding: EdgeInsets.only(),
              iconSize: 20,
              onPressed: () {},
              icon: Icon(Icons.shuffle),
            ),
            IconButton(
              padding: EdgeInsets.only(),
              iconSize: 20,
              onPressed: () {},
              icon: Icon(Icons.skip_previous_outlined),
            ),
            play_pause(),
            IconButton(
              padding: EdgeInsets.only(),
              iconSize: 20,
              onPressed: () {},
              icon: Icon(Icons.skip_next_outlined),
            ),
            IconButton(
              padding: EdgeInsets.only(),
              iconSize: 20,
              onPressed: () {},
              icon: Icon(Icons.repeat),
            ),
          ],
        ),
        SizedBox(
          height: 3,
        ),
        Row(
          children: [
            Text(
              '0:00',
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.red, Colors.green]),
              ),
              height: 5,
              width: MediaQuery.of(context).size.width * 0.3,
            ),
            Text(selected!.duration)
          ],
        )
      ],
    );
  }
}

class play_pause extends StatefulWidget {
  const play_pause({
    Key? key,
  }) : super(key: key);

  @override
  State<play_pause> createState() => _play_pauseState();
}

class _play_pauseState extends State<play_pause> {
  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.only(),
      iconSize: 35,
      onPressed: () {
        setState(() {
          isPlaying = !isPlaying;
        });
      },
      icon: isPlaying
          ? Icon(Icons.pause_circle_outline)
          : Icon(Icons.play_circle_outline),
    );
  }
}

class _likeButtonState extends State<likeButton> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            isLiked = !isLiked;
          });
        },
        icon: isLiked
            ? Icon(
                Icons.favorite_rounded,
                color: Colors.red,
              )
            : Icon(Icons.favorite_border));
  }
}
