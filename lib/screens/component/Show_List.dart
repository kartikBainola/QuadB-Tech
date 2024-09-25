import 'package:flutter/material.dart';
import 'package:quadbtech/screens/component/Detail_Screen.dart';

import '../../model/Model_vs.dart';

class ShowList extends StatelessWidget {
  final List<Show> shows;
  const ShowList({Key? key, required this.shows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: shows.length,
        itemBuilder: (context, index) {
          final show = shows[index];
          return Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              contentPadding: EdgeInsets.all(16.0),
              leading: show.image != null
                  ? Image.network(
                      show.image!.medium,
                      width: 80,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                  : Icon(Icons.tv, size: 50),
              title: Text(
                show.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              subtitle: Text(
                show.summary
                    .replaceAll('<p>', '')
                    .replaceAll('</p>', '')
                    .replaceAll('<b>', '')
                    .replaceAll('</b>', ''),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => DetailScreen(show: show)));
              },
            ),
          );
        });
  }
}
