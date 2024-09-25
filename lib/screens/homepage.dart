import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quadbtech/screens/component/Show_List.dart';

import '../model/Model_vs.dart';
import '../services/services_vs.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Show> shows = [];
  final AuthApiService _authApiService = AuthApiService();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchAllShows();
  }

  Future<void> _fetchAllShows() async {
    setState(() {
      isLoading = true;
    });
    try {
      final fetchedShows = await _authApiService.fetchAllShows();
      setState(() {
        shows = fetchedShows
            .map((showData) => Show.fromJson(showData['show']))
            .toList();
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching shows: $e');
      // You might want to show an error message to the user here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TV Shows"),
      ),
      body: isLoading
          ? Center(
              child: SpinKitWave(
                color: Colors.red,
                type: SpinKitWaveType.start,
              ),
            )
          : ShowList(shows: shows),
    );
  }
}
