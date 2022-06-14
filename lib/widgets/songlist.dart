import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/data/data.dart';
import 'package:spotify/model/current_song.dart';

//TIMESTAP : 41: 27

class SongList extends StatelessWidget {
  final List<Song> tracks;

  const SongList({super.key, required this.tracks});

  @override
  Widget build(BuildContext context) {
    return DataTable(
        showCheckboxColumn: false,
        headingTextStyle:
            Theme.of(context).textTheme.overline!.copyWith(fontSize: 14),
        dataRowHeight: 55,
        // decoration: BoxDecoration(color: Colors.green),
        dataRowColor: MaterialStateProperty.resolveWith(_getDataRowColor),
        columns: [
          DataColumn(label: Text('TITLE')),
          DataColumn(label: Text('ARTIST')),
          DataColumn(label: Text('ALBUM')),
          DataColumn(
            label: Icon(Icons.access_time),
          )
        ],
        rows: tracks.map((e) {
          final selected =
              context.watch<CurrentSongModel>().selected?.id == e.id;
          final textstyle = TextStyle(
              color: selected
                  ? Theme.of(context).accentColor
                  : Theme.of(context).iconTheme.color);
          return DataRow(
              // onSelectChanged: (value) {},
              // color: MaterialStateProperty.resolveWith(_getDataRowColor),
              cells: [
                DataCell(
                  Text(
                    e.title,
                    style: textstyle,
                  ),
                ),
                DataCell(
                  Text(
                    e.artist,
                    style: textstyle,
                  ),
                ),
                DataCell(
                  Text(
                    e.album,
                    style: textstyle,
                  ),
                ),
                DataCell(
                  Text(
                    e.duration,
                    style: textstyle,
                  ),
                ),
              ],
              selected: selected,
              onSelectChanged: (_) =>
                  context.read<CurrentSongModel>().selectSong(e));
        }).toList());
  }
}

Color _getDataRowColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };

  if (states.any(interactiveStates.contains)) {
    return Colors.greenAccent.withOpacity(0.3);
  }
  //return Colors.green; // Use the default value.
  return Colors.transparent;
}
