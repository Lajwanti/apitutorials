import 'dart:convert';
import 'package:apitutorials/Models/PostModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 List<PostModel> postList = [];
  Future<List<PostModel>> getPostAPI() async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      //postList.clear();
      for(Map i in data){
        postList.add(PostModel.fromJson(i));

      }

      return postList;

    }
    else {
      return postList;
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Course"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostAPI(),
                builder:(context, snapshot) {

                if(!snapshot.hasData){
                  return Text("Loading");
                }
                else{
                  return ListView.builder(
                    itemCount: postList.length,


                      itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("UserId: ",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),),
                            Text(postList[index].userId.toString()),
                            SizedBox(height: 10,),
                            Text("Id: ",style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),),
                            Text(postList[index].id.toString()),
                            SizedBox(height: 10,),
                            Text("Title: ",style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),),
                            Text(postList[index].title.toString()),
                            SizedBox(height: 10,),
                            Text("Description: ",style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),),
                            Text(postList[index].body.toString()),
                          ],
                        ),
                      ),
                    );

                  });

                }

                }

                ),
          ),



        ],
      ),
    );
  }
}
