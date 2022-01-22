import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FullImageView extends StatefulWidget {
  final String imageUrl;
  const FullImageView({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<FullImageView> createState() => _FullImageViewState();
}

class _FullImageViewState extends State<FullImageView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: widget.imageUrl,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CachedNetworkImage(
              imageUrl: widget.imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: const Color(0xfff5f8fd),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
