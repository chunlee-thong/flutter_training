import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_homework/src/model/attraction_model.dart';

import '../widgets/custom_icon_button.dart';

class AttractionDetailPage extends StatefulWidget {
  final AttractionModel attraction;
  const AttractionDetailPage({Key? key, required this.attraction}) : super(key: key);

  @override
  State<AttractionDetailPage> createState() => _AttractionDetailPageState();
}

class _AttractionDetailPageState extends State<AttractionDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildImage(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Hero(
      tag: widget.attraction.name,
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.attraction.imageUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(24),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(),
              const Spacer(),
              _buildImageSlideShow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CustomIconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
          const Spacer(),
          CustomIconButton(
            onPressed: () {},
            icon: const Icon(Icons.drive_folder_upload_outlined),
          ),
          const SizedBox(width: 8),
          CustomIconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSlideShow() {
    final imageRadius = BorderRadius.circular(12);
    return Container(
      height: 90,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var index in [1, 2, 3, 4])
            Expanded(
              child: index == 4
                  ? Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: imageRadius,
                            child: Image.network(
                              widget.attraction.imageUrl,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: imageRadius,
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              "+5",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      child: ClipRRect(
                        borderRadius: imageRadius,
                        child: Image.network(
                          widget.attraction.imageUrl,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
            ),
        ],
      ),
    );
  }
}
