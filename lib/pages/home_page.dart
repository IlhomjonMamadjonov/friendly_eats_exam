import 'package:flutter/material.dart';

class FriendlyEatsApp extends StatefulWidget {
  static const String id = "/main_page";

  @override
  _FriendlyEatsAppState createState() => _FriendlyEatsAppState();
}

class _FriendlyEatsAppState extends State<FriendlyEatsApp> {
  List<String> images = [
    "assets/images/r1.jpg",
    "assets/images/r2.jpg",
    "assets/images/r3.jpg",
    "assets/images/r4.jpg",
    " assets/images/r5.jpg",
    " assets/images/r6.jpg",
    "assets/images/r7.jpg",
    " assets/images/r8.jpg",
    " assets/images/r9.jpg",
    " assets/images/r10.jpg",
    " assets/images/r11.jpg",
    "assets/images/r12.jpg",
    " assets/images/r13.jpg",
    " assets/images/r14.jpg"
  ];
  List<String> namesfood = [
    "Dinner SteakHouse",
    "Fire Hyper",
    "Deli Hyper",
    "Dinner SteakHouse",
    "Fire Hyper",
    "Deli Hyper",
    "Dinner SteakHouse",
    "Fire Hyper",
    "Deli Hyper",
    "Dinner SteakHouse",
    "Fire Hyper",
    "Deli Hyper",
    "Dinner SteakHouse",
    "Fire Hyper",
  ];
  List<String> namesmeal = [
    "Sushi",
    "Brunch",
    "Deli",
    "Sushi",
    "Brunch",
    "Deli",
    "Sushi",
    "Brunch",
    "Deli",
    "Sushi",
    "Brunch",
    "Deli",
    "Sushi",
    "Brunch",
  ];
  List<String> places = [
    "Seattle",
    "Colorado Springs",
    "Los Angeles",
    "Omaha",
    "Seattle",
    "Colorado Springs",
    "Los Angeles",
    "Omaha",
    "Seattle",
    "Colorado Springs",
    "Los Angeles",
    "Omaha",
    "Seattle",
    "Colorado Springs",
  ];

  @override
  Widget build(BuildContext context) {
    bool usingDesktop = MediaQuery.of(context).size.width > 1024;
    return Scaffold(
      ///Appbar
      appBar: AppBar(
        centerTitle: false,
        leading: Icon(Icons.restaurant),
        title: Text("FriendlyEats"),
        bottom: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.06),
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.all(5),
              color: Colors.white,
              child: Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.filter_list,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "All Restaurants",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "by rating",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),

      ///body LitView
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 5),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return _itemBuilder(context, index);
          }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: usingDesktop ? 3 : 1,
          childAspectRatio: usingDesktop ? 2/1.3: 2/1.5,
          crossAxisSpacing: 1,
          mainAxisSpacing: 2,
        ),
        ),
      ),
    );
  }

  ///list Builder
  Container _itemBuilder(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.only(bottom: 10, top: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.30,
                margin: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(images[index]), fit: BoxFit.cover),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        namesfood[index],
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(height: 4,),
                      Text(
                        "\$\$\$",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  rating(),
                  SizedBox(height: 4,),
                  Text("${namesmeal[index]} • ${places[index]}"),
                  SizedBox(height: 4,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  ///rating
  Row rating() {
    return Row(
      children: [
        Icon(
          Icons.star_sharp,
          color: Colors.yellow,
        ),
        Icon(
          Icons.star_sharp,
          color: Colors.yellow,
        ),
        Icon(
          Icons.star_sharp,
          color: Colors.yellow,
        ),
        Icon(
          Icons.star_half,
          color: Colors.yellow,
        ),
        Icon(
          Icons.star_border_sharp,
          color: Colors.yellow,
        ),
      ],
    );
  }
}
