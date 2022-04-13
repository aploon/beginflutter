import 'package:beginflutter/models/video.dart';
import 'package:beginflutter/services/video_api.dart';
import 'package:beginflutter/utils/constants.dart';
import 'package:beginflutter/utils/helper.dart';
import 'package:beginflutter/widgets/video_grid.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedFilter = VideoSort.id;

  @override
  Widget build(BuildContext context) {
    getVideoFromApi().then((value) => {print(value.length)});

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orange Valley CAA'),
        backgroundColor: Colors.black,
        actions: [
          PopupMenuButton(
            onSelected: _onChangeFilter,
            icon: Icon(Icons.sort),
            offset: Offset(0, 50),
            itemBuilder: (context) => [
              PopupMenuItem(value: VideoSort.id, child: Text('Par défaut')),
              PopupMenuItem(value: VideoSort.name, child: Text('Par nom')),
              PopupMenuItem(
                  value: VideoSort.duration, child: Text('Par durée')),
            ],
          ),
        ],
      ),
      body: Container(
        color: backgroundColor,
        child: FutureBuilder(
          future: getVideoFromApi(filter: _selectedFilter),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(),);
            } else if(snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()),);
            } else {
              return VideosGrid(videos: snapshot.data);
            }
          },
        ),
      ),
    );
  }

  void _onChangeFilter(VideoSort choice) {
    if (choice != _selectedFilter) {
      setState(() {
        _selectedFilter = choice;
      });
    }
  }
}