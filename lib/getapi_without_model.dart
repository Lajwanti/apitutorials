import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class GetapiWithoutModel extends StatefulWidget {
  const GetapiWithoutModel({Key? key}) : super(key: key);

  @override
  _GetapiWithoutModelState createState() => _GetapiWithoutModelState();
}

class _GetapiWithoutModelState extends State<GetapiWithoutModel> {

  var data;

  Future<void> getApi() async{

    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if(response.statusCode == 200){
      data = jsonDecode(response.body.toString());

    }
    else{


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
                future: getApi(),
                builder:(context, snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  else{

                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context,index){
                        return Card(
                          child: Column(
                            children: [
                              ReuseableRow(title: "Name", value:data[index]["name"].toString()),
                              ReuseableRow(title: "UserName", value:data[index]["username"].toString()),
                              ReuseableRow(title: "Street", value:data[index]["address"]["street"].toString()),
                              ReuseableRow(title: "Latitude", value:data[index]["address"]["geo"]["lat"].toString()),
                              ReuseableRow(title: "Longitude", value:data[index]["address"]["geo"]["lng"].toString()),
                              //ReuseableRow(title: "UserName", value:data[index]["address"]["geo"]["lng"].toString()),
                               ],
                          ),
                        );

                      },
                    );
                  }

                }),
          )
        ],
      ),
    );
  }
}


class ReuseableRow extends StatelessWidget {
  String title, value;
  ReuseableRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}