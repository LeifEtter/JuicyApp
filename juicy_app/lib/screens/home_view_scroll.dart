import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:juicy_app/widgets/buttons.dart';
import 'package:juicy_app/widgets/top_bar.dart';
import 'package:juicy_app/extra/categories.dart';
import 'package:juicy_app/widgets/product_card_redesign.dart';
import 'package:juicy_app/screens/product_view.dart';
import 'package:juicy_app/extra/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollViewController;
  bool _showAppbar = true;
  bool isScrollingDown = false;
  bool _iconOpacity = true;
  List activeCategories = ["sweater", "hoodie", "placeholder"];

  @override
  void initState() {
    super.initState();
    _scrollViewController = new ScrollController();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection == ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          _iconOpacity = false;
          setState(() {});
        }
      }
      if (_scrollViewController.position.userScrollDirection == ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          _iconOpacity = true;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _scrollViewController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopBar(
              showAppbar: _showAppbar,
              iconOpacity: _iconOpacity,
              isSearching: false,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 3.0),
                    spreadRadius: 1.0,
                    blurRadius: 1.0,
                    color: Colors.black12,
                  )
                ],
              ),
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categorySwitches.length,
                  itemBuilder: (context, index) {
                    bool categoryActive = false;
                    if(activeCategories.contains(categorySwitches[index][0])) {
                      categoryActive = true;
                      print("contains Category");
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: CategoryButton(
                        buttonColor: categorySwitches[index][2],
                        categoryActive: categoryActive,
                        activateCategory: activateCategory,
                        categoryIcon: categorySwitches[index][1],
                        category: categorySwitches[index][0],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("products")
                    .where("categories", arrayContainsAny: activeCategories)
                    .snapshots(),
                builder: (context, snapshot) {
                  if(snapshot.data == null) return CircularProgressIndicator();
                  return GridView.builder(
                    controller: _scrollViewController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 0.8,
                    ),
                    shrinkWrap: true,
                    itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot productItem = snapshot.data.documents[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(CustomPageRoute(ProductView(product: productItem, screenHeight: MediaQuery.of(context).size.height, screenWidth: MediaQuery.of(context).size.width)));
                            },
                            child: ProductCardRedesign(
                              product: productItem,
                            ),
                          ),
                        );
                      }
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void activateCategory(category, categoryActive) {
    if(categoryActive){
      setState(() {
        activeCategories.remove(category);
      });
    } else {
      setState(() {
        activeCategories.add(category);
      });
    }

  }

}
