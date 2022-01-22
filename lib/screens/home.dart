// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperapp/data/data.dart';
import 'package:wallpaperapp/models/categorymodel.dart';
import 'package:wallpaperapp/models/photosmodel.dart';
import 'package:wallpaperapp/repository/photo-repository.dart';
import 'package:wallpaperapp/widgets/bestofmonth.dart';
import 'package:wallpaperapp/widgets/brandname.dart';
import 'package:wallpaperapp/widgets/categorywidget.dart';
import 'package:wallpaperapp/widgets/searchcontainer.dart';

class HomeScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late TextEditingController _textEditingController;

  late Future<List<PhotoModel>> photomodel;

  @override
  void initState() {
    photomodel = PhotoRepository().getPhotos();

    // print(_photosData.then((value) => value));

    // print(_photosData)

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeScreenMobile(photos: photomodel),
    );
  }
}

// ignore: must_be_immutable
class _HomeScreenMobile extends StatelessWidget {
  late Future<List<PhotoModel>> photos;
  _HomeScreenMobile({
    required this.photos,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: brandName(),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          floating: true,
          // pinned: true,
        ),
        SliverToBoxAdapter(
          child: SearchContainer(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 2),
          sliver: SliverToBoxAdapter(
            child: BestOfMonth(photos: photos),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          sliver: SliverToBoxAdapter(
            child: CategoryWidget(categoriesPics: categoryList),
          ),
        )
      ],
    );
  }
}
