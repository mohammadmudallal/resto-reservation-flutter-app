import 'package:flutter/material.dart';
import 'package:resto_reservation_app/allmenus.dart';
import 'package:resto_reservation_app/components/category_button.dart';
import 'package:resto_reservation_app/models/category.dart';
import 'package:resto_reservation_app/services/data_fetch.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios, color: Colors.teal,)),
        title: const Text('All Categories'),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: FutureBuilder<List<Category>>(
            future: FetchData.getAllCategories(),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Text('Waiting');
              }else if(snapshot.hasData){
                List<Category> _categories = snapshot.data!;
                return Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: GridView.builder(
                      itemCount: _categories.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        itemBuilder: (context, index){
                          return CategoryButton(
                              name: _categories[index].name.toString(),
                              image: _categories[index].image,
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AllMenus(cat_id: _categories[index].id)));
                              }
                          );
                        })
                  );
              }else if(snapshot.hasError){
                return const Text('Error');
              }
              return const Text('Categories');
            }
        ),
      ),
    );
  }
}
