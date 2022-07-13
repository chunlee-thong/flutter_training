import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlutterNotifier extends StatefulWidget {
  const FlutterNotifier({Key? key}) : super(key: key);

  @override
  State<FlutterNotifier> createState() => _FlutterNotifierState();
}

class _FlutterNotifierState extends State<FlutterNotifier> {
  //
  ValueNotifier<int> numberNotifier = ValueNotifier(0);

  @override
  void initState() {
    numberNotifier.addListener(() {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text("My Dialog"),
            content: const Text("You press this 2 times"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Dimiss"),
              ),
            ],
          );
        },
      );
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
            height: 200,
            margin: const EdgeInsets.all(32),
            color: Colors.red,
            child: Column(
              children: const [],
            ),
          );
        },
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    numberNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Rebuild");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifier"),
      ),
      body: Center(
        child: ValueListenableBuilder<int>(
          valueListenable: numberNotifier,
          child: const Text("me"),
          builder: (context, value, child) {
            print("Rebuild Text");
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$value",
                  style: const TextStyle(
                    fontSize: 32,
                    color: Colors.red,
                  ),
                ),
                child!,
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        dismissDirection: DismissDirection.up,
                        content: const Text("You got a message"),
                        action: SnackBarAction(
                          label: "Close",
                          onPressed: () {},
                        ),
                      ),
                    );
                  },
                  child: const Text("Show snackbar"),
                ),
                const CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.red,
                  child: Icon(Icons.add),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          numberNotifier.value++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
