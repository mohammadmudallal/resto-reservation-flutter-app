import 'package:flutter/material.dart';
import 'package:resto_reservation_app/models/menu.dart';
import 'package:resto_reservation_app/services/data_fetch.dart';

class AllMenus extends StatefulWidget {
  dynamic? cat_id;

  AllMenus({required this.cat_id});

  @override
  State<AllMenus> createState() => _AllMenusState();
}

class _AllMenusState extends State<AllMenus> {
  @override
  Widget build(BuildContext context) {
    dynamic? catid = widget.cat_id;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.teal,
              )),
          title: const Text('All Categories'),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: FutureBuilder<List<Menu>>(
              future: FetchData.getMenus(catid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  List<Menu> _menus = snapshot.data!;
                  return Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: ListView.builder(
                        itemCount: _menus.length < 2 ? 1 : _menus.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 18),
                            child: Container(
                              height: 150,
                              child: Card(
                                elevation: 6,
                                shadowColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            _menus[index].name.toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          Text('\$'+_menus[index].price.toString()),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Text(_menus[index].description.toString()),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                } else if (snapshot.hasError) {
                  return const Text('Error');
                }
                return const Text('Categories');
              }),
        ));
  }
}
