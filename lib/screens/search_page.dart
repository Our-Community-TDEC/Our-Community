// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:our_community/nuemorphism/border_effect.dart';
import 'package:our_community/nuemorphism/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isDark = false;
  String refferalcode = "";
  var head_text_style;
  var detail_text_style;

  getPreference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.containsKey("Theme")) {
      isDark = pref.getBool("Theme")!;
    }
    refferalcode = await getCurrentUserRefferalCode();
    setState(() {
      themeF(isDark);
    });
  }

  Future<String> getCurrentUserRefferalCode() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return snapshot.get("refferalcode");
  }

  themeF(isDark) {
    if (isDark) {
      head_text_style = TextStyle(
        color: HexColor.text_color,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );
      detail_text_style = TextStyle(
        color: HexColor.text_color,
        fontSize: 16,
        // fontWeight: FontWeight.bold,
      );
    } else {
      detail_text_style = TextStyle(
        color: HexColor.WblueText,
        fontSize: 16,
        // fontWeight: FontWeight.bold,
      );
      detail_text_style = TextStyle(
        color: HexColor.WblueText,
        fontSize: 16,
        // fontWeight: FontWeight.bold,
      );
    }
  }

  @override
  initState() {
    super.initState();
    getPreference();
  }

  // themeF(isDark) {}

  TextEditingController queryString = new TextEditingController();
  String name = "";

  @override
  Widget build(BuildContext context) {
    print(refferalcode);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final theme = isDark ? DarkTheme() : WhiteTheme();
    return Scaffold(
        body: Container(
      decoration: theme.background_color,
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: NeumorphicButton(
                        onPressed: () => {Navigator.pop(context)},
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: isDark
                              ? HexColor.icon_color
                              : HexColor.WiconColor,
                        ),
                        style: theme.back_button,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.4,
                      child: Neumorphic(
                        style: theme.text_field,
                        child: TextField(
                          style: TextStyle(
                              color: isDark
                                  ? HexColor.text_color
                                  : HexColor.WblueText),
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: isDark
                                    ? HexColor.icon_color
                                    : HexColor.WiconColor,
                              ),
                              hintText: 'Search...',
                              hintStyle: TextStyle(
                                  color: isDark
                                      ? HexColor.text_color
                                      : HexColor.WblueText)),
                          onChanged: (val) {
                            setState(() {
                              name = val;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 5,
                indent: 12,
                endIndent: 12,
                color: Colors.black,
              ),
            ],
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('user')
                .where("refferalcode", isEqualTo: refferalcode)
                .snapshots(),
            builder: (context, snapshots) {
              return (snapshots.connectionState == ConnectionState.waiting)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: ListView.builder(
                          itemCount: snapshots.data!.docs.length,
                          itemBuilder: (context, index) {
                            var data = snapshots.data!.docs[index].data()
                                as Map<String, dynamic>;
                            if (name.isEmpty) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 10),
                                child: Neumorphic(
                                  style: theme.com_sugge_container,
                                  child: Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: ListTile(
                                      title: Row(
                                        children: [
                                          Container(
                                            width: (width / 6) - 10,
                                            height: (width / 6) - 10,
                                            child: data['profileImg'] != ""
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(width),
                                                    ),
                                                    child: Image.network(
                                                      data['profileImg'],
                                                      loadingBuilder: (BuildContext
                                                              context,
                                                          Widget child,
                                                          ImageChunkEvent?
                                                              loadingProgress) {
                                                        if (loadingProgress ==
                                                            null) {
                                                          return child;
                                                        }
                                                        return Center(
                                                          child:
                                                              CircularProgressIndicator(
                                                            value: loadingProgress
                                                                        .expectedTotalBytes !=
                                                                    null
                                                                ? loadingProgress
                                                                        .cumulativeBytesLoaded /
                                                                    loadingProgress
                                                                        .expectedTotalBytes!
                                                                : null,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  )
                                                : Container(
                                                    width: (width / 2.28) - 10,
                                                    height: (width / 2.28) - 10,
                                                    child: CircleAvatar(
                                                      radius: 30,
                                                      child: Image.asset(
                                                        'assets/Images/user.png',
                                                        width: 40,
                                                      ),
                                                    ),
                                                  ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 0, 0, 0),
                                            child: Column(
                                              // mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data['userName'],
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: head_text_style,
                                                ),
                                                Text(
                                                  data['email'],
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: head_text_style,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      subtitle: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Mobile : " + data['mobile'],
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: detail_text_style,
                                            ),
                                            Text(
                                              "Vehical number : " +
                                                  data['vehical'],
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: detail_text_style,
                                            ),
                                            Text(
                                              "House number : " +
                                                  data['flatNumber'],
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: detail_text_style,
                                            ),
                                          ],
                                        ),
                                      ),
                                      // leading: CircleAvatar(
                                      //   backgroundImage: NetworkImage(data['image']),
                                      // ),
                                    ),
                                  ),
                                ),
                              );
                            }
                            if (data['userName']
                                    .toString()
                                    .toLowerCase()
                                    .startsWith(
                                      name.toLowerCase(),
                                    ) ||
                                data['vehical']
                                    .toString()
                                    .toLowerCase()
                                    .startsWith(
                                      name.toLowerCase(),
                                    ) ||
                                data['mobile']
                                    .toString()
                                    .toLowerCase()
                                    .startsWith(
                                      name.toLowerCase(),
                                    ) ||
                                data['flatNumber']
                                    .toString()
                                    .toLowerCase()
                                    .startsWith(
                                      name.toLowerCase(),
                                    )) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 10),
                                child: Neumorphic(
                                  style: theme.com_sugge_container,
                                  child: Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: ListTile(
                                      title: Row(
                                        children: [
                                          Container(
                                            width: (width / 6) - 10,
                                            height: (width / 6) - 10,
                                            child: data['profileImg'] != ""
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(width),
                                                    ),
                                                    child: Image.network(
                                                      data['profileImg'],
                                                      loadingBuilder: (BuildContext
                                                              context,
                                                          Widget child,
                                                          ImageChunkEvent?
                                                              loadingProgress) {
                                                        if (loadingProgress ==
                                                            null) {
                                                          return child;
                                                        }
                                                        return Center(
                                                          child:
                                                              CircularProgressIndicator(
                                                            value: loadingProgress
                                                                        .expectedTotalBytes !=
                                                                    null
                                                                ? loadingProgress
                                                                        .cumulativeBytesLoaded /
                                                                    loadingProgress
                                                                        .expectedTotalBytes!
                                                                : null,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  )
                                                : Container(
                                                    width: (width / 2.28) - 10,
                                                    height: (width / 2.28) - 10,
                                                    child: CircleAvatar(
                                                      radius: 30,
                                                      child: Image.asset(
                                                        'assets/Images/user.png',
                                                        width: 40,
                                                      ),
                                                    ),
                                                  ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 0, 0, 0),
                                            child: Column(
                                              // mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data['userName'],
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: head_text_style,
                                                ),
                                                Text(
                                                  data['email'],
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: head_text_style,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      subtitle: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Mobile : " + data['mobile'],
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: detail_text_style,
                                            ),
                                            Text(
                                              "Vehical number : " +
                                                  data['vehical'],
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: detail_text_style,
                                            ),
                                            Text(
                                              "House number : " +
                                                  data['flatNumber'],
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: detail_text_style,
                                            ),
                                          ],
                                        ),
                                      ),
                                      // leading: CircleAvatar(
                                      //   backgroundImage: NetworkImage(data['image']),
                                      // ),
                                    ),
                                  ),
                                ),
                              );
                            }
                            return Container();
                          }),
                    );
            },
          ),
        ],
      ),
    ));
  }
}
