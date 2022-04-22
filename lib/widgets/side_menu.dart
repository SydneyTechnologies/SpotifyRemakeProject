import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

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
                  "assets/spotify_logo.png",
                  height: 55.0,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
          sideMenuItem(
            itemName: "Home",
            icon: Icons.home,
          ),
          sideMenuItem(
            itemName: "Search",
            icon: Icons.search,
          ),
          sideMenuItem(
            itemName: "Radio",
            icon: Icons.audiotrack,
          ),
          SizedBox(
            height: 12.0,
          ),
          _libraryPlaylist(),
        ],
      ),
    );
  }
}

class sideMenuItem extends StatelessWidget {
  sideMenuItem({required this.itemName, required this.icon});
  final String itemName;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28.0,
      ),
      title: Text(
        itemName,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _libraryPlaylist extends StatefulWidget {
  const _libraryPlaylist({Key? key}) : super(key: key);

  @override
  State<_libraryPlaylist> createState() => __libraryPlaylistState();
}

class __libraryPlaylistState extends State<_libraryPlaylist> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        isAlwaysShown: true,
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
          physics: const ClampingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                  child: Text("YOUR LIBRARY"),
                ),
                ...yourLibrary.map((e) => ListTile(
                      dense: true,
                      title: Text(
                        e,
                        style: Theme.of(context).textTheme.bodyText2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                  child: Text(
                    "PLAYLISTS",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                ...playlists.map((e) => ListTile(
                      dense: true,
                      title: Text(
                        e,
                        style: Theme.of(context).textTheme.bodyText2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
