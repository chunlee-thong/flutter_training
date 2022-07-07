import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ScrollController scrollController = ScrollController();

  void listener() {
    ///Get scroll offset
    double offset = scrollController.offset;

    ///Get user's scroll direction
    var axis = scrollController.position.userScrollDirection;
  }

  @override
  void initState() {
    scrollController.addListener(listener);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(listener);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView"),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollStartNotification) {
            print("scroll start");
          }
          return true;
        },
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 2));
          },
          child: ListView(
            controller: scrollController,
            children: [
              for (var i in List.generate(30, (index) => index))
                ListTile(
                  title: Text("title: $i"),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //scrollController.jumpTo(30);
          // scrollController.animateTo(
          //   4000,
          //   duration: const Duration(seconds: 1),
          //   curve: Curves.easeIn,
          // );
          double height = scrollController.position.maxScrollExtent;
          // scrollController.jumpTo(height);
          double offset = scrollController.offset;
          print(offset);
        },
      ),
    );
  }
}
