import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_tutorial/models/album_list.dart';
import 'txt.dart';

class ListRow extends StatelessWidget {
  //
  late final Album album;
  ListRow({required this.album});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Txt(text: album.title),
          Divider(),
        ],
      ),
    );
  }
}
