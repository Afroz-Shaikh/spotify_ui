import 'package:flutter/material.dart';
import 'package:spotify/data/data.dart';

//TIMESTAP : 41: 27

class SongList extends StatelessWidget {
  final List<Song> tracks;

  const SongList({super.key, required this.tracks});

  @override
  Widget build(BuildContext context) {
    return DataTable(
        decoration: BoxDecoration(color: Colors.green),
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
          return DataRow(
            // onSelectChanged: (value) {},
            // color: MaterialStateProperty.resolveWith(_getDataRowColor),
            cells: [
              DataCell(
                Text(
                  e.title,
                  style: TextStyle(color: Theme.of(context).iconTheme.color),
                ),
              ),
              DataCell(
                Text(
                  e.artist,
                  style: TextStyle(color: Theme.of(context).iconTheme.color),
                ),
              ),
              DataCell(
                Text(
                  e.album,
                  style: TextStyle(color: Theme.of(context).iconTheme.color),
                ),
              ),
              DataCell(
                Text(
                  e.duration,
                  style: TextStyle(color: Theme.of(context).iconTheme.color),
                ),
              ),
            ],
          );
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
    return Colors.red;
  }
  //return Colors.green; // Use the default value.
  return Colors.transparent;
}
