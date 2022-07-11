import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_homework/src/model/attraction_model.dart';

import '../widgets/attraction_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildSearchTextField(),
              const Text(
                "Explore Cities",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              _buildCategoryFilter(),
              _buildAttractionList(),
              const SizedBox(height: 24),
              const Text(
                "Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              _buildAttractionCategories(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Where do", style: TextStyle(fontSize: 20)),
            Text(
              "you want to go",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          backgroundColor: Colors.amber[100],
          child: const Icon(
            Icons.person,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchTextField() {
    const contentColor = Color(0xFFCBCBCB);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 32),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: const [
          Icon(Icons.search, size: 18, color: contentColor),
          SizedBox(width: 8),
          Text("Discover city", style: TextStyle(color: contentColor)),
          Spacer(),
          Icon(Icons.snippet_folder, color: contentColor),
        ],
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 16,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: ["All", "Popular", "Recommended", "Most viewd", "Most visited"]
                .map(
                  (text) => Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 16,
                        color: text == "All" ? Colors.black : Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        Container(
          width: 20,
          height: 4,
          margin: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            color: Colors.blue[400],
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }

  Widget _buildAttractionList() {
    return Container(
      height: 200,
      margin: const EdgeInsets.only(top: 32),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (var attraction in kAttractionList) AttractionCard(attraction: attraction),
        ],
      ),
    );
  }

  Widget _buildAttractionCategories() {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(top: 24),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: ["Mountain", "Beach", "Park", "Camp"]
            .map(
              (text) => Container(
                width: 64,
                margin: const EdgeInsets.only(right: 16),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: const Icon(Icons.travel_explore),
                    ),
                    const SizedBox(height: 8),
                    Text(text),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
