import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:resto_reservation_app/allmenus.dart';
import 'package:resto_reservation_app/components/menu_card.dart';
import 'package:resto_reservation_app/models/menu.dart';
import 'package:resto_reservation_app/pages/login_page.dart';
import 'package:resto_reservation_app/models/category.dart';
import 'package:resto_reservation_app/models/user.dart';
import 'package:resto_reservation_app/services/authentication.dart';
import 'package:resto_reservation_app/services/data_fetch.dart';
import 'package:resto_reservation_app/allcategories.dart';
import 'package:resto_reservation_app/components/image_slider.dart';
import 'package:resto_reservation_app/components/category_button.dart';

class HomeNavPage extends StatefulWidget {
  const HomeNavPage({Key? key}) : super(key: key);

  @override
  State<HomeNavPage> createState() => _HomeNavPageState();
}

class _HomeNavPageState extends State<HomeNavPage> {
  @override
  Widget build(BuildContext context) {
    void logout() {
      Authentication authentication = Authentication();
      authentication.logout(context: context);
    }

    // List<Widget> imageList = [
    //   ImageSlider(
    //       path: "assets/slider_1.jpeg", imageText: "We Offer The Best Quality"),
    //   ImageSlider(
    //       path: "assets/slider_4.jpeg",
    //       imageText: "You'll Get Very Comfortable"),
    //   ImageSlider(
    //       path: "assets/slider_3.jpeg",
    //       imageText: "And, Gain A Joyful Experience"),
    // ];

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(
          shadowColor: Colors.amberAccent,
          backgroundColor: Colors.white,
          child: ListView(
            children: [
              SizedBox(
                height: 210.0,
                child: DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.orangeAccent,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.info,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Personal Info',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.numbers,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            Provider.of<User>(context, listen: false).getId().toString(),
                            style: TextStyle(
                                color: Colors.grey.shade50, fontSize: 15),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            Provider.of<User>(context, listen: false).getName(),
                            style: TextStyle(
                                color: Colors.grey.shade50, fontSize: 15),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            Provider.of<User>(context, listen: false).getEmail(),
                            style: TextStyle(
                                color: Colors.grey.shade100, fontSize: 15),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.token,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                              width: 150,
                              child: Text(
                                Provider.of<User>(context, listen: false)
                                    .getToken(),
                                style:
                                    TextStyle(color: Colors.white, fontSize: 13),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                hoverColor: Colors.grey,
                onTap: () {
                  logout();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  }));
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Builder(
              builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 40,
                    ),
                  ))),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.waving_hand_sharp,
                        color: Colors.orangeAccent,
                        size: 40,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Welcome, ${Provider.of<User>(context).getName()}!',
                          style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54)),
                    ],
                  ),
                  const Text(
                    'Your comfort is essential for us! Explore more',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Search for categories, menus...",
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 40),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/slider_1.jpeg',
                          fit: BoxFit.cover,
                          height: 150,
                          width: double.infinity,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 5, top: 5, right: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Categories',
                              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const AllCategories()));
                              },
                              child: const Text('See All', style: TextStyle( fontSize: 24,color: Colors.orange, fontWeight: FontWeight.bold),),
                            )
                          ],
                        ),

                        const SizedBox(height: 15,),
                        FutureBuilder<List<Category>>(
                            future: FetchData.getAllCategories(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: const CircularProgressIndicator(),
                                );
                              } else if (snapshot.hasData) {
                                List<Category> _categories = snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  height: 200,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: _categories.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                          child: CategoryButton(
                                            name: _categories[index].name.toString(),
                                            image: _categories[index].image,
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => AllMenus(
                                                          cat_id: _categories[index]
                                                              .id)));
                                            },
                                          ),
                                        );
                                      }),
                                );
                              }
                              return Center(
                                child: Text('Categories'),
                              );
                            }),
                      ],
                    ),
                  ),
                   Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'New Additions',
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(height: 15,),
                        FutureBuilder<List<Menu>>(
                            future: FetchData.getAllMenus(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (snapshot.hasData) {
                                List<Menu> _menus = snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  height: 270,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 2,
                                      itemBuilder: (context, index) {
                                        return MenuCard(
                                            name: _menus[index].name.toString(),
                                            price: _menus[index].price.toString(),
                                            description: _menus[index].description.toString(),
                                            category: _menus[index].category_name.toString(),
                                            image: "http://192.168.0.109:8000/api/images/${_menus[index].image.toString()}"
                                        );
                                      }),
                                );
                              }
                              return const Center(
                                child: Text('Menus'),
                              );
                            }),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



