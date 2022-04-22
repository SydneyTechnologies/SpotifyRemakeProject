import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';
import 'package:flutter_spotify_ui/models/current_track.dart';
import 'package:provider/provider.dart';

class TracksList extends StatelessWidget {
  const TracksList({Key? key, required this.tracks}) : super(key: key);
  final List<Song> tracks;

  @override
  Widget build(BuildContext context) {
    return DataTable(
        showCheckboxColumn: false,
        dataRowHeight: 54.0,
        columns: const [
          DataColumn(label: Text("TITLE")),
          DataColumn(label: Text("ARTIST")),
          DataColumn(label: Text("ALBUM")),
          DataColumn(label: Icon(Icons.access_time)),
        ],
        rows: tracks.map((e) {
          final selected =
              context.watch<CurrentTrack>().currentTrack?.id == e.id;
          final textStyle = TextStyle(
              color: selected
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).iconTheme.color);
          return DataRow(
              cells: [
                DataCell(Text(
                  e.title,
                  style: textStyle,
                )),
                DataCell(Text(
                  e.artist,
                  style: textStyle,
                )),
                DataCell(Text(
                  e.album,
                  style: textStyle,
                )),
                DataCell(Text(
                  e.duration,
                  style: textStyle,
                ))
              ],
              selected: selected,
              onSelectChanged: (i) =>
                  context.read<CurrentTrack>().changeSong(e));
        }).toList());
  }
}
