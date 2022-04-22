import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

class PlaylistHeader extends StatelessWidget {
  const PlaylistHeader({Key? key, required this.playlist}) : super(key: key);
  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              playlist.imageURL,
              width: 200.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "PLAYLIST",
                  style: Theme.of(context)
                      .textTheme
                      .overline!
                      .copyWith(fontSize: 12.0),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  playlist.name,
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  playlist.description,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Created by ${playlist.creator} - ${playlist.songs.length} songs, ${playlist.duration}",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            )),
          ],
        ),
        const SizedBox(
          height: 16.0,
        ),
        Row(
          children: [
            Container(
              child: Center(child: Text("PLAY")),
              width: 100,
              height: 35,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20.0)),
            ),
            const SizedBox(
              width: 8.0,
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
            const SizedBox(
              width: 8.0,
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
            const Spacer(),
            Text(
              "FOLLOWERS\n${playlist.followers}",
              style: Theme.of(context)
                  .textTheme
                  .overline!
                  .copyWith(fontSize: 12.0),
              textAlign: TextAlign.right,
            )
          ],
        )
      ],
    );
  }
}
