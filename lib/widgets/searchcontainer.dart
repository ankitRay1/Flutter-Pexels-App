// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wallpaperapp/models/photosmodel.dart';
import 'package:wallpaperapp/repository/photo-repository.dart';
import 'package:wallpaperapp/screens/photo-screen.dart';

// ignore: must_be_immutable
class SearchContainer extends StatelessWidget {
  SearchContainer({Key? key}) : super(key: key);

  late TextEditingController textEditingController = TextEditingController();

  dynamic searchImage(String searchText, BuildContext context) {
    late Future<List<PhotoModel>> photoSearch;
    photoSearch = PhotoRepository().getSearchPhotos(textEditingController.text);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PhotoSearch(
                  photoSearch: photoSearch,
                  categoryName: textEditingController.text,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[350],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textEditingController,
              // ignore: avoid_print
              onSubmitted: (text) =>
                  text == "" ? SizedBox.shrink() : searchImage(text, context),
              decoration: InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                // ignore: unnecessary_null_comparison
                // if (textEditingController.text != null) {
                //   searchImage(textEditingController.text, context);
                // }

                textEditingController.text == ""
                    ? SizedBox.shrink()
                    : searchImage(textEditingController.text, context);
                print(textEditingController.text);
              },
              icon: Icon(Icons.search_outlined)),
        ],
      ),
    );
  }
}
