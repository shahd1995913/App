// import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:async/async.dart';
// import 'dart:io';
// import 'package:http/http.dart' as http;

// class home extends StatelessWidget {
//   const home({Key? key}) : super(key: key);
//   static const title = 'Home';
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: title,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(title),
//           backgroundColor: Colors.orange,
//         ),
//         body: const Homepa(),
//       ),
//     );
//   }
// }

// class Homepa extends StatefulWidget {
//   const Homepa({Key? key}) : super(key: key);

//   @override
//   Homepaform createState() {
//     return Homepaform();
//   }
// }

// class Homepaform extends State<Homepa> {
//   @override
//   void initState() {
//     super.initState();
//     // add anything you need here
//   }

//   @override
//   Widget build(BuildContext context) {
//     // this method is rerun every time setState is called
//     return Form(
//         child: ListView(
//       children: [],
//     ));
//   }
// }

import 'package:flutter/material.dart';

// Main Function Start

// Main Function Ends

// First Stateless Widget with MaterialApp Start
class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

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
    "African Marigold",
    "African Violet",
    "Alpenrose",
    "Amaryllis",
    "American Lotus",
    "American Wisteria",
    "Angels Fishing Rod"
  ];

  // Description List Here
  var descList = [
    "Sometimes known as the Big Marigold, this bushy annual is prized for its large double flowers. Each blossom measures two to four inches across and comes in orange, yellow, and white shades. They are long-blooming from early summer until the first frost",
    "African Violets are one of the most popular plants for indoor gardens. \n \n  Most species naturally live in the mountains, usually under the cover of other plants. Because of this, they require moderate temperatures and light, which can easily be found and controlled inside of homes. However, some indoor gardeners shy away from growing them because their care can be intimidating.",
    "This upright evergreen shrub produces glossy, dark-green leaves and clusters of tubular rose pink to crimson flowers. \n \n  It blooms in the early summer and grows in a compact and upright habit. The Alpenrose can grow up to five feet high, looking great in the rear of borders and at the side of water gardens. It prefers full sun to partial shade and is hardy in zones four to nine. ",
    "This is a popular bulb given as a gift around the Christmas holidays, thanks to their large, brightly colored blooms supported by large stems.\n \n  There are five types of Amaryllis; large flowering, double flowering, small flowering, cybister, and trumpet. The most popular is the large flowering, single flower Amaryllis, which grows up to 10 inches tall.",
    "This might not be as popular as the Sacred Lotus that is more often seen in cultivation. But these flowers provide a blanket of elegance thanks to their pure white petals and a yellow center. \n \n They grow up to 12 inches across and are a sight to behold. It is a marginal aquatic perennial that also produces large umbrella-like leaves.  ",
    "American Wisteria is a vigorous climber with twining stems, blooming from late spring through to summer.\n \n It forms drooping six-inch-long clusters of pea-like lilac-colored flowers, which give off a delightful aroma. \n \n American Wisteria is less damaging to structures than Chinese or Japanese species. It grows up to 30 feet tall .",
    "Sometimes known as Fairy Wand, this pretty evergreen perennial looks great anywhere in the garden. Particularly where you can appreciate its arching stems, such as along edges, walls, or over ponds. \n \n  The grass-like stems produce bell-shaped white, pale pink, or magenta flowers that bloom for several weeks at the start of summer. ",
  ];

  // Image Name List Here
  var images = [
    "assets/new/im1.jpg",
    "assets/new/im2.jpg",
    "assets/new/im3.jpg",
    "assets/new/im4.jpg",
    "assets/new/im5.jpg",
    "assets/new/im6.jpg",
    "assets/new/im7.jpg"
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
