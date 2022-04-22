import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/models/current_track.dart';
import 'package:provider/provider.dart';

class CurrentTrackWidget extends StatelessWidget {
  const CurrentTrackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 84.0,
      decoration: const BoxDecoration(color: Colors.black87),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            _TrackInfo(),
            const Spacer(),
            _PlayerControls(),
            const Spacer(),
            if (MediaQuery.of(context).size.width > 800) MoreControls(),
          ],
        ),
      ),
    );
  }
}

class _TrackInfo extends StatelessWidget {
  const _TrackInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrack>().currentTrack;
    if (selected == null) {
      return const SizedBox.shrink();
    }
    return Row(
      children: [
        Image.asset(
          "assets/lofigirl.jpg",
          height: 50.0,
          width: 50.0,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 12.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selected.title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              selected.artist,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.grey[300], fontSize: 12.0),
            )
          ],
        ),
        const SizedBox(
          width: 12.0,
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border))
      ],
    );
  }
}

class _PlayerControls extends StatelessWidget {
  const _PlayerControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrack>().currentTrack;
    if (selected == null) {
      return const SizedBox.shrink();
    }
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shuffle,
                    size: 20.0,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_previous_outlined,
                    size: 20.0,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_circle_fill_outlined,
                    size: 34.0,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_next_outlined,
                    size: 20.0,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.repeat,
                    size: 20.0,
                  )),
            )
          ],
        ),
        const SizedBox(
          height: 4.0,
        ),
        Row(
          children: [
            Text(
              "0.00",
              style: Theme.of(context).textTheme.caption,
            ),
            const SizedBox(
              width: 8.0,
            ),
            Container(
              height: 5.0,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(selected.duration),
          ],
        )
      ],
    );
  }
}

class MoreControls extends StatelessWidget {
  const MoreControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.devices_outlined,
              size: 20,
            )),
        const SizedBox(
          width: 5.0,
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.volume_up_outlined,
                  size: 20,
                )),
            Container(
                height: 5,
                width: 70,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2.5))),
          ],
        ),
        const SizedBox(
          width: 5.0,
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.fullscreen,
            )),
      ],
    );
  }
}
