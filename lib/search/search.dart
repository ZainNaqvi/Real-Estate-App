import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:houses_olx/profile/profile.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchEditingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchEditingController.dispose();
  }

  bool isShowUser = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: TextFormField(
            controller: searchEditingController,
            decoration: InputDecoration(
              hintText: "Search user here....",
            ),
            onFieldSubmitted: (String _) {
              print(_);
              setState(() {
                isShowUser = true;
              });
            },
          ),
        ),
        body: isShowUser
            ? FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .where(
                      'userName',
                      isGreaterThanOrEqualTo: searchEditingController.text,
                    )
                    .get(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CupertinoActivityIndicator(
                          animating: true,
                          color: Colors.green,
                          radius: 24,
                          key: UniqueKey()),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              snapshot.data!.docs[index]['photoURL'],
                            ),
                          ),
                          title: Text(
                            (snapshot.data! as dynamic).docs[index]['userName'],
                          ),
                          subtitle: Text(
                            (snapshot.data! as dynamic).docs[index]['email'],
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          trailing: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                            ),
                            child: Text(
                              "Follow",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      );
                    },
                  );
                },
              )
            : FutureBuilder(
                future: FirebaseFirestore.instance.collection('users').get(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LinearProgressIndicator(
                      color: Colors.white,
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        child: InkWell(
                          onTap: () {},
                          child: ListTile(
                            title: Text(
                              snapshot.data!.docs[index]['userName'],
                            ),
                            subtitle: Text(
                              snapshot.data!.docs[index]['email'],
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                snapshot.data!.docs[index]['photoURL'],
                              ),
                            ),
                            trailing: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                              ),
                              child: Text(
                                "Follow",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}
