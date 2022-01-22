import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperapp/models/categorymodel.dart';
import 'package:wallpaperapp/models/failuremode.dart';
import 'package:wallpaperapp/models/photosmodel.dart';
import 'package:wallpaperapp/screens/fullimage-screen.dart';

// ignore: must_be_immutable
class BestOfMonth extends StatelessWidget {
  late Future<List<PhotoModel>> photos;
  BestOfMonth({
    required this.photos,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ignore: prefer_const_constructors
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const Text("Best of the Day",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  letterSpacing: 1.2)),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 300.0,
          color: Colors.white,
          child: FutureBuilder<List<PhotoModel>>(
            future: photos,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final photosItems = snapshot.data!;

                return ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemCount: photosItems.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Hero(
                        tag: photosItems[index].imageUrl,
                        child: GestureDetector(
                          // ignore: avoid_print
                          onTap: () {
                            // ignore: prefer_const_constructors
                            photosItems[index].imageUrl == ""
                                ? const SizedBox.shrink()
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FullImageView(
                                            imageUrl:
                                                photosItems[index].imageUrl)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: CachedNetworkImage(
                                      imageUrl: photosItems[index].imageUrl,
                                      height: 300,
                                      width: 180,
                                      fit: BoxFit.cover),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                throw Failure(message: "something went main");
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }
}
