import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Khana extends StatefulWidget {
  const Khana({Key? key}) : super(key: key);

  @override
  State<Khana> createState() => _KhanaState();
}

class _KhanaState extends State<Khana> {
  borderdec() {
    return const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(17)),
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(255, 185, 184, 184),
              offset: Offset(5, 5),
              blurRadius: 10)
        ]);
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
      child: Column(children: [
        const SizedBox(
          height: 30,
        ),

        //Heading
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .where('email', isEqualTo: user!.email)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text(
                      'No User Data...',
                    );
                  } else {
                    List<QueryDocumentSnapshot<Object?>> firestoreItems =
                        snapshot.data!.docs;
                    var fname = firestoreItems[0]['name'].split(" ");
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello, " + fname[0],
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(user.email.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ))
                      ],
                    );
                  }
                }),
            const Spacer(),
            GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
                child: const Icon(Icons.logout)),
            const SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Text(
                "Log out",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              width: 25,
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //body1_box1
            Container(
              padding: const EdgeInsets.only(top: 19),
              height: 240,
              width: MediaQuery.of(context).size.width / 2.22,
              decoration: borderdec(),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.food_bank,
                        size: 32,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text('Authentics',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    '14',
                    style: TextStyle(fontSize: 80, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text(
                    'Delicious',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 146, 145, 145)),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    'Items',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 146, 145, 145)),
                  )
                ],
              ),
            ),

            //body1_box2
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 24, left: 12, right: 5),
                  height: 112,
                  width: MediaQuery.of(context).size.width / 2.31,
                  decoration: borderdec(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.restaurant,
                            size: 23,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            'Achar',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 7,
                          ),
                          const Text('8',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                          const SizedBox(
                            width: 8,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: const Text(
                              'Special Achar',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 146, 145, 145)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),

                ////body1_box3
                Container(
                  padding: const EdgeInsets.only(top: 23, left: 12, right: 5),
                  margin: const EdgeInsets.only(top: 16),
                  height: 112,
                  width: MediaQuery.of(context).size.width / 2.31,
                  decoration: borderdec(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.local_pizza,
                            size: 26,
                            color: Color.fromARGB(255, 255, 230, 0),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Our Pizza',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          const Text('12',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                          const SizedBox(
                            width: 8,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.27,
                            child: const Text(
                              'Special Pizza',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 146, 145, 145)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),

        //Body 2
        const SizedBox(
          height: 25,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Explore our food items',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),

            //Body3
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(
                  top: 12, right: 16, left: 16, bottom: 10),
              decoration: borderdec(),
              height: 128,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Image.asset(
                    "images/gif.gif",
                    height: 80,
                    width: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7.0, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: const Text(
                            "Free and Quick Delivery!",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Within 30 minutes",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "All over Nepal",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(
                    top: 20, right: 16, left: 16, bottom: 10),
                decoration: borderdec(),
                height: 190,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Image.asset(
                      "images/gif2.gif",
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    )
                  ],
                ))
          ],
        ),
      ]),
    )));
  }
}
