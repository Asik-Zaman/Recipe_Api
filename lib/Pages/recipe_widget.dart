import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;
  const RecipeCard(
      {super.key,
      required this.title,
      required this.rating,
      required this.cookTime,
      required this.thumbnailUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: Container(
        height: 180,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(1),
                blurRadius: 10,
                spreadRadius: -6.0,
                offset: Offset(0.0, 10.0),
              )
            ],
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(.35), BlendMode.multiply),
                image: NetworkImage(thumbnailUrl),
                fit: BoxFit.cover)),
        child: Stack(children: [
          Align(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 19),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            alignment: Alignment.center,
          ),
          Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      SizedBox(width: 7),
                      Text(
                        rating,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      SizedBox(width: 7),
                      Text(
                        cookTime,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
            alignment: Alignment.bottomLeft,
          ),
        ]),
      ),
    );
  }
}
