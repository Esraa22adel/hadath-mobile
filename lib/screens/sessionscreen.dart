import 'package:flutter/material.dart';
import '../models/session.dart';

import '../apis/Api.dart';

class SessionScreen extends StatefulWidget {
  SessionScreen({Key key}) : super(key: key);

  @override
  _SessionScreenState createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  Future<List<Session>> sessions;
  @override
  void initState() {
    super.initState();
    sessions = API.getAllSessions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: FutureBuilder<List<Session>>(
                future: sessions,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, int i) {
                        return Card(
                           shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                          margin: EdgeInsets.only(bottom: 30),
                          child: Column(
                            children: [
                              Stack(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                    child: Image.network(
                                      'https://moh.hadath.app' +
                                          snapshot.data[i].image,
                                      height: 250,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 20,
                                    right: 10,
                                    child: Container(
                                      width: 300,
                                      color: Colors.black54,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: 20,
                                      ),
                                      child: Text(
                                        snapshot.data[i].title,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 26,
                                          color: Colors.white,
                                          
                                        ),
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            
                          
                          Padding(
                              padding: EdgeInsets.all(20),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.room,
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text(snapshot.data[i].location),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.access_time,
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text(snapshot.data[i].startdate,style:TextStyle(fontSize: 8)),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.access_alarms_rounded
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text(snapshot.data[i].enddate,style:TextStyle(fontSize: 8)),
                                      ],
                                    ),
                                  ])
                                  )
                            ]),
                        )
 ;
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                },
              )),
        );
  }
}
