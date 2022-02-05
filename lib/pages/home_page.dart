import 'package:flutter/material.dart';
import 'package:friendly_eats/models/food_models.dart';
import 'package:friendly_eats/models/post%20models.dart';

class FriendlyEatsApp extends StatefulWidget {
  static const String id = "/main_page";

  @override
  _FriendlyEatsAppState createState() => _FriendlyEatsAppState();
}

class _FriendlyEatsAppState extends State<FriendlyEatsApp> {
  List<Food> allFoods = Foods().foods;
  List<Food> foods = [];
  int perPage = 9;
  int present = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      foods.addAll(allFoods.getRange(present, present + perPage));
      present += perPage;
    });
  }

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

      ///body GridView
      body: GridView.builder(
        padding: EdgeInsets.only(left: 10, right: 10, top: 5),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount:
            (present <= allFoods.length) ? foods.length + 1 : allFoods.length,
        itemBuilder: (context, index) {
          return index == foods.length
              ? buttonLoadMore()
              : _meals(food: Foods().foods[index]);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: usingDesktop ? 3 : 1,
          childAspectRatio: usingDesktop ? 2 / 1.3 : 2 / 1.5,
          crossAxisSpacing: 1,
          mainAxisSpacing: 2,
        ),
      ),
    );
  }

  /// List Builder
  Container _meals({Food? food}) {
    return Container(
      padding: EdgeInsets.only(bottom: 10, top: 5),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
            Expanded(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(food!.image!), fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        food.title!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "\$\$\$",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),

                  ///Rating Bar
                  rating(),
                  Text("${food.name!} • ${food.location!}"),
                  SizedBox(
                    height: 4,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Rating Bar
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
          Icons.star_sharp,
          color: Colors.yellow,
        ),
        Icon(
          Icons.star_outline_outlined,
          color: Colors.yellow,
        )
      ],
    );
  }

  /// Button Loader
  Widget buttonLoadMore() {
    return Container(
      alignment: Alignment.center,
      width: 150,
      height: 30,
      child: MaterialButton(
        shape: const StadiumBorder(),
        color: Colors.blue,
        onPressed: () {
          setState(() {
            if ((present + perPage) > allFoods.length) {
              foods.addAll(allFoods.getRange(present, allFoods.length));
            } else {
              foods.addAll(allFoods.getRange(present, present + perPage));
            }
            present = present + perPage;
          });
        },
        child: const Text(
          "Load More",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
