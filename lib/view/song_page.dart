import 'package:flutter/material.dart';
import 'package:music_player/components/neo_box.dart';
import 'package:music_player/provider/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
//get playlist
        final playlist = value.playlist;
//get currebt song index
        final currentsong = playlist[value.currentSongIndex ?? 0];
        //return scaffold ui
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SafeArea(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
                  const Text(
                    'S O N G E S',
                    style: TextStyle(fontSize: 20),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              NeoBox(
                  child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(currentsong.imagePath)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            currentsong.songName,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 1,
                          ),
                          Text(currentsong.artistName)
                        ],
                      ),
                      const Icon(Icons.favorite_border)
                    ],
                  )
                ],
              )),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('00.00'),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.shuffle)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.repeat)),
                        const Text('00:00')
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 0)),
                    child: Slider(
                      min: 0,
                      max: value.totalDuration.inSeconds.toDouble(),
                      value: value.currentDuration.inSeconds.toDouble(),
                      activeColor: Colors.green,
                      onChanged: (value) {},
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: () {},
                        child: const NeoBox(
                            child: Icon(Icons.skip_previous_rounded))),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                        onTap: () {
                          value.play();
                        },
                        child: const NeoBox(
                            child: Icon(Icons.play_arrow_rounded))),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: () {},
                        child:
                            const NeoBox(child: Icon(Icons.skip_next_rounded))),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              )
            ],
          )),
        );
      },
    );
  }
}
