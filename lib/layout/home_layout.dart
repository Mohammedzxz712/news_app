import 'package:flutter/material.dart';
import 'package:news_app3/shared/network/remote/api_manager.dart';

import '../screens/tab_controller.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(
                "assets/pattern.png",
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.green)),
          title: Text(
            "News",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
        body: FutureBuilder(
          future: ApiManager.getSource(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.green,
              ));
            }
            if (snapshot.hasError) {
              return const Text('Something Wrong');
            }
            var source = snapshot.data?.sources ?? [];
            return TabControllerScreen(source);
          },
        ),
      ),
    );
  }
}
