import 'package:flutter/material.dart';

class Channel extends StatelessWidget {
  const Channel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListViewPage(),
    );
  }
}
// First Stateless Widget with MaterialApp Ends

// Main Stateful Widget Start
class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  // Title List Here
  var titleList = [
    "Nerium Oleander",
    "Aconitum",
    "Dracunculus",
    "Rafflesia Arnoldii",
    "Titan Arum",
    "Deadly Nightshade",
    "Angel’s Trumpet"
  ];

  // Description List Here
  var descList = [
    "It looks so soothing with white, magenta and crimson colours, elegantly spreading its fragrance, but did you know it is one of the most toxic, poisonous flowers in the world",
    "These Aconitum flowers with 250 species are also known as wolfsbane, mousebane, dogbane, leopard’s bane, women’s bane, tiger’s bane, and witch’s bane. Even witches used this most poisonous flower in the world as their flying potion in older times.",
    "It releases the aroma of rotting meat and is a way of attracting flies towards it. These flies help in pollinating it, but unfortunately, the smell vanishes in a day. Voodoo Lily, just like its name, hates direct sunlight and loves shade",
    "Rafflesia arnoldii is the largest individual flower in the world, weighing 15 pounds (6.8 kilograms) and can reach up to 3 feet in height. This puffy, giant, polka-dotted looks strange and different in itself.",
    "Titan Arum at that time attracts insects for pollination and is infamously known as the corpse flower. The poison flowers of this plant have a central spike where insects pollinate. ",
    "Deadly Nightshade is hands down one of the most deadly flowers to humans that comprises medicinal properties as well. The bell shaped flowers can be found in hues like purple and green. This flower has taken a mythological place in folklore. ",
    "These pastel pink flowers may look alluring but can cause dangerous side effects, also known as the zombie effect. If you eat them, you might experience the incapability of retaining new memories that leave you helpless. "
  ];

  // Image Name List Here
  var images = [
    "assets/new/im8.jpg",
    "assets/new/im9.jpg",
    "assets/new/im10.jpg",
    "assets/new/im14.jpg",
    "assets/new/im11.jpg",
    "assets/new/im12.jpg",
    "assets/new/im13.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    // MediaQuery to get Device Width
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      // Main List View With Builder
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // This Will Call When User Click On ListView Item
              showDialogFunc(
                  context, images[index], titleList[index], descList[index]);
            },
            // Card Which Holds Layout Of ListView Item
            child: Card(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(images[index]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          titleList[index],
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width,
                          child: Text(
                            descList[index],
                            maxLines: 3,
                            style:
                                TextStyle(fontSize: 15, color: Colors.black45),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// This is a block of Model Dialog
showDialogFunc(context, img, title, desc) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(5),
            height: 550,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    img,
                    width: 250,
                    height: 250,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      desc,
                      maxLines: 12,
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
