import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperapp/models/categorymodel.dart';
import 'package:wallpaperapp/models/photosmodel.dart';
import 'package:wallpaperapp/repository/photo-repository.dart';
import 'package:wallpaperapp/screens/screens.dart';

class CategoryWidget extends StatelessWidget {
  final List<CategoryModel> categoriesPics;
  const CategoryWidget({Key? key, required this.categoriesPics})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ignore: prefer_const_constructors
        Padding(
          padding: const EdgeInsets.all(8.0),
          // ignore: prefer_const_constructors
          child: Text("Categories",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2)),
        ),

        GridView.builder(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              mainAxisExtent: 100,
            ),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categoriesPics.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    // ignore: avoid_print
                    onTap: () {
                      // ignore: unused_local_variable
                      late Future<List<PhotoModel>> photoSearch;
                      photoSearch = PhotoRepository()
                          .getSearchPhotos(categoriesPics[index].categoryName);

                      // print(photoSearch.then((value) => value));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PhotoSearch(
                                    photoSearch: photoSearch,
                                    categoryName:
                                        categoriesPics[index].categoryName,
                                  )));
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: categoriesPics[index].imageUrl,
                              fit: BoxFit.cover,
                              height: 100,
                              width: 200,
                              filterQuality: FilterQuality.high,
                            ),
                            Center(
                              heightFactor: 3.5,
                              child: Text(
                                categoriesPics[index].categoryName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              );
            }),
      ],
    );
  }
}
