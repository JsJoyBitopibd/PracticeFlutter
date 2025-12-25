import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Models/posts_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {

  List<PostsModel> postList = [];

  Future<List<PostsModel>> getPostApi() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );
    var data =jsonDecode(response.body.toString());
    var i;
    if(response.statusCode==200){
      for(Map i in data){
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    }else{
      return postList;
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<PostsModel>>(
              future: getPostApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(postList[index].title.toString()),
                        subtitle: Text(postList[index].body.toString()),
                      );
                    },
                  );
                }
              },
            ),
          ),

        ],
      ),
    );
  }
}
