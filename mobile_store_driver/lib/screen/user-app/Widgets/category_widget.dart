import 'package:flutter/material.dart';
import 'package:mobile_store_driver/model/category_model.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;

  CategoryWidget({@required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff721b65),
              Color(0xffb80d57),
              Color(0xfff8615a),
              Color(0xffffd868),
            ]),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          category.name,
          style: TextStyle(color: Colors.white, fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
