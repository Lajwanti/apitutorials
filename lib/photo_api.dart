import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PhotoApi extends StatefulWidget {
  const PhotoApi({Key? key}) : super(key: key);

  @override
  _PhotoApiState createState() => _PhotoApiState();
}

class _PhotoApiState extends State<PhotoApi> {

  List<Photos> photoList = [];

  Future<List<Photos>> getPhotoApi() async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map i in data){
        Photos photos = Photos(title: i["title"], url: i["url"],id:i["id"]);
        photoList.add(photos);
      }
      return photoList;

    }
    else{

      return photoList;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Course"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPhotoApi(),
                builder:(context,AsyncSnapshot<List<Photos>> snapshot){
              return ListView.builder(
                itemCount: photoList.length,
                itemBuilder: (context,index){
                  return ListTile(
                    leading: CircleAvatar(
                      //radius: 40,
                      backgroundImage: NetworkImage(snapshot.data![index].url.toString()),
                    ),
                    subtitle: Text(snapshot.data![index].id.toString()),
                    title: Text(snapshot.data![index].title.toString()),

                  );

                },
              );

            }),
          )
        ],
      ),
    );
  }
}

class Photos{
  String title, url;
  int id;

  Photos({required this.title, required this.url,required this.id});
}
