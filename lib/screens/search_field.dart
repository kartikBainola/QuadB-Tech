import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quadbtech/services/services_vs.dart';

import '../model/Model_vs.dart';
import 'component/Show_List.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final AuthApiService _authApiService = AuthApiService();
  List<Show> _searchResults = [];
  TextEditingController _searchController = TextEditingController();
  Timer? _debounce;
  bool _isLoading = false;

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _searchShows(query);
    });
  }

  Future<void> _searchShows(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
        _isLoading = false;
      });
      return;
    }
    setState(() {
      _isLoading = true;
    });
    try {
      final searchResults = await _authApiService.searchShows(query);
      setState(() {
        _searchResults = searchResults
            .map((showData) => Show.fromJson(showData['show']))
            .toList();
        _isLoading = false;
      });
    } catch (e) {
      _isLoading = false;
      print('Error searching shows: $e');
      // You might want to show an error message to the user here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search TV shows'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search TV Shows',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.white70),
              ),
              style: TextStyle(color: Colors.white),
              onChanged: _onSearchChanged,
              autofocus: true,
            ),
          ),
          _isLoading
              ? const Center(
                  child: SpinKitThreeInOut(
                    color: Colors.red,
                  ),
                )
              : Expanded(
                  child: ShowList(shows: _searchResults),
                ),
        ],
      ),
    );
  }
}
