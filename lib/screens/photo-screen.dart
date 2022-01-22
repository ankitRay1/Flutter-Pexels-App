import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperapp/models/failuremode.dart';
import 'package:wallpaperapp/models/photosmodel.dart';
import 'package:wallpaperapp/screens/fullimage-screen.dart';

// ignore: must_be_immutable
class PhotoSearch extends StatefulWidget {
  late Future<List<PhotoModel>> photoSearch;

  final String categoryName;
  PhotoSearch({Key? key, required this.photoSearch, required this.categoryName})
      : super(key: key);

  @override
  State<PhotoSearch> createState() => _PhotoSearchState();
}

class _PhotoSearchState extends State<PhotoSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEBF3F5),
      appBar: AppBar(
        title: Text(widget.categoryName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            )),
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffEBF3F5),
        foregroundColor: Colors.black,
      ),
      body: FutureBuilder<List<PhotoModel>>(
          future: widget.photoSearch,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final photoDataList = snapshot.data!;

              return GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(16),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 350,
                  ),
                  itemCount: photoDataList.length,
                  itemBuilder: (context, index) {
                    // if (index == 0) {
                    //   return Text(widget.categoryName,
                    //       style: const TextStyle(
                    //           fontSize: 30,
                    //           fontWeight: FontWeight.bold,
                    //           color: Colors.black));
                    // }
                    final photos = photoDataList[index];
                    return Hero(
                      tag: photos.imageUrl,
                      child: GestureDetector(
                        onTap: () {
                          // ignore: prefer_const_constructors
                          photos.imageUrl == ""
                              ? const SizedBox.shrink()
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FullImageView(
                                          imageUrl: photos.imageUrl)));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(
                              imageUrl: photos.imageUrl,
                              height: double.infinity,
                              width: 180,
                              fit: BoxFit.cover),
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              throw Failure(message: "something went main");
            }

            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
