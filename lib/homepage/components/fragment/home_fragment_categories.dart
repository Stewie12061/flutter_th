import 'package:flutter/material.dart';


import '../../../model/categories.dart';
import '../../../model/utilities.dart';

class CategoriesStore extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // final categories = Categories.init();

    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const Row(
              children: [
                Expanded(child: Text('Categories', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.yellow),)),
                Text('See more', style: TextStyle(fontSize: 16, color: Colors.yellowAccent),),
              ],
            ),
            SizedBox(height: 10,),
            FutureBuilder<List<Categories>>(
              future: Utilities().getCate(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context,index){
                        return CategoriesItem(category: snapshot.data![index]);
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class CategoriesItem extends StatelessWidget{
  final Categories category;

  const CategoriesItem({super.key, required this.category});

  @override
  Widget build(BuildContext context){
    String imageUrl = category.image ?? '';

    // check if the imageUrl is a URL or not
    if (!RegExp('^(http|https)://.*').hasMatch(imageUrl)) {
      // extract the URL from the string
      imageUrl = RegExp(
          r'http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+')
          .stringMatch(imageUrl) ?? '';
    }
   return Container(
     width: 150,
     height: 150,
     padding: EdgeInsets.all(5),
     child: Image.network(imageUrl),
   );
  }
}

