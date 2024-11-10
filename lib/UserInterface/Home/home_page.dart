import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seller_app/UserInterface/Home/Milk/Milk.dart';
import 'package:seller_app/UserInterface/Home/Vegtables/Address.dart';
import 'package:seller_app/UserInterface/Home/Vegtables/Vegtables.dart';
import 'package:seller_app/utility/Colors.dart';
import 'package:seller_app/utility/CommonColor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imgList = [
    'assets/images/istockphoto_1089759056612_x_6121.jpeg',
    'assets/images/istockphoto_1089759056612_x_6121.jpeg',
    'assets/images/istockphoto_1089759056612_x_6121.jpeg',
    'assets/images/istockphoto_1089759056612_x_6121.jpeg',
    //'assets/images/istockphoto_1089759056612_x_6121.jpeg',
  ];

  int _current = 0;
  bool ischecked = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(backgroundColor: Colors.white),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors
              .white, // Change this color to the desired drawer icon color
        ),
        centerTitle: true,
        title: Text(
          "HOME",
          style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: HexColor(Colorscommon.whitecolor)),
        ),
        backgroundColor: HexColor(Colorscommon.greenlite),
        toolbarHeight: 70,
        actions: [
          Icon(Icons.more_vert, color: Colors.white),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carousel slider wrapped in a Container with height to control positioning
            Container(
              height: 180.0, // Adjust the height as needed
              //margin: EdgeInsets.only(top: 5.0), // Add margin to control spacing from the top
              child: CarouselSlider(
                items: imgList
                    .map((item) => Container(
                          margin: EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            child: Image.asset(item,
                                fit: BoxFit.cover, width: 1000.0),
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
              ),
            ),
            // Dot indicator below the carousel slider
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4),
                    ),
                  ),
                );
              }).toList(),
            ),
            /*Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'OUR CATERGORIES',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: HexColor(Colorscommon.black)),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: HexColor(Colorscommon.whitecolor),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(3, 3, 3, 12.5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'assets/images/gettyimages_153946385_ca_1_ccfaad_9_be_44325_afc_434_b_305_adc_0_d_1.png',
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    width: 154,
                                    height: 80,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 7),
                                child: Text(
                                  'Vegetables',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: HexColor(Colorscommon.greenlite),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(11.6, 0, 10.6, 7.5),
                                child: Text(
                                  'Click the view all button to see all vegtables items',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 8,
                                    height: 1.5,
                                    color: HexColor(Colorscommon.black),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(3.5, 0, 0, 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF68BB59),
                                    borderRadius: BorderRadius.circular(1),
                                  ),
                                  child: Container(
                                    // Set the width and height of the container to control the TextButton size
                                    width: 80, // Adjust the width to your desired size
                                    height: 30, // Adjust the height to your desired size
                                    padding: EdgeInsets.fromLTRB(9.6, 1.5, 12.1, 1.5),
                                    child: TextButton(
                                      onPressed: () {
                                        print('vegetable');
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Vegtables()));
                                      },
                                      child: Text(
                                        'View All',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 8,
                                          height: 1.5,
                                          color: HexColor(Colorscommon.whitecolor),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: HexColor(Colorscommon.whitecolor),
                      ),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(2.5, 3, 2.5, 12.5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/images/image.jpeg',
                                    ),
                                  ),
                                ),
                                child: Container(
                                  width: 155,
                                  height: 80,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 3.1, 7),
                              child: Text(
                                'Milk',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: HexColor(Colorscommon.greenlite),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10.1, 0, 13.1, 7.5),
                              child: Text(
                                'Click the view all button to see all Milk items',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 8,
                                  height: 1.5,
                                  color: HexColor(Colorscommon.black),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(3.5, 0, 0, 0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF68BB59),
                                  borderRadius: BorderRadius.circular(1),
                                ),
                                child: Container(
                                  width: 80, // Adjust the width to your desired size
                                  height: 30, // Adjust the height to your desired size
                                  padding: const EdgeInsets.fromLTRB(9.6, 1.5, 12.1, 1.5),
                                  child: TextButton(
                                    onPressed: () {
                                      print('Milk');
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Milk()));
                                    },
                                    child: Text(
                                      'View All',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 8,
                                        height: 1.5,
                                        color: HexColor(Colorscommon.whitecolor),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(22.5, 0, 22.5, 8),
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  color: HexColor(Colorscommon.greenlite),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 9, 0.1, 10),
                  child: Center(
                    child: Text(
                      'VEGETABLES',
                      style: GoogleFonts.getFont(
                        'Roboto',
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: HexColor(Colorscommon.whitecolor),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(23, 0, 22, 11),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(11, 6, 11, 7),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 6.7),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'assets/images/tomato_png_image_1.png',
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    width: 40,
                                    height: 38.3,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(2, 0, 2.3, 0),
                                child: Text(
                                  'Tomatoes',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 8,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(11, 6, 11, 7),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 8.4),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'assets/images/onion_png_992131.png',
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    width: 40,
                                    height: 36.6,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(7, 0, 7.9, 0),
                                child: Text(
                                  'Onions',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 8,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 7),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(1, 0, 1, 6),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'assets/images/lady_finger_okra_png_hd_image_1.png',
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                              ),
                              Text(
                                'Ladysfinger',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 8,
                                  color: Color(0xFF000000),
                                ),
                                maxLines: 1, // Ensures the text only takes up one line
                                overflow: TextOverflow.ellipsis, // If the text is too long, it will show "..."
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(11, 5, 10.6, 7),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0.4, 6),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'assets/images/cauliflower_transparent_image_thumb_1.png',
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                              ),
                              Text(
                                'Cauliflower',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 8,
                                  color: Color(0xFF000000),
                                ),
                                maxLines: 1, // Ensures the text only takes up one line
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(11, 5, 11, 7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 7.7),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/images/brinjal_bunch_free_download_png_hq_1.png',
                                    ),
                                  ),
                                ),
                                child: Container(
                                  width: 40,
                                  height: 38.3,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(9, 0, 8.3, 0),
                              child: Text(
                                'Brinjal',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 8,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(2, 0, 0, 17),
              child: SizedBox(
                width: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 3, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: HexColor(Colorscommon.greenlite),
                          borderRadius: BorderRadius.circular(7.5),
                        ),
                        child: Container(
                          width: 15,
                          height: 15,
                          padding: EdgeInsets.fromLTRB(4, 4, 5, 5),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/images/leftarrow-removebg-preview.png',
                                ),
                              ),
                            ),
                            child: Container(
                              width: 6,
                              height: 6,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      decoration: BoxDecoration(
                        color: HexColor(Colorscommon.greenlite),
                        borderRadius: BorderRadius.circular(7.5),
                      ),
                      child: Container(
                        width: 15,
                        height: 15,
                        padding: EdgeInsets.fromLTRB(5, 4, 4, 5),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/right-arrow-icon-removebg-preview.png',
                              ),
                            ),
                          ),
                          child: Container(
                            width: 6,
                            height: 6,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(22.5, 0, 22.5, 8),
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF68BB59),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(0.3, 9, 0, 10),
                  child: Center(
                    child: Text(
                      'ICE CREAM & MILK',
                      style: GoogleFonts.getFont(
                        'Roboto',
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(23, 0, 22, 11),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(11, 7, 11, 7),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 6.3),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'assets/images/purepng_1.png',
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    width: 40,
                                    height: 37.7,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0.8, 0),
                                child: Text(
                                  'Milk',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 8,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(16, 7, 16, 7),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 4.6),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'assets/images/milk_png_free_download_711.png',
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    width: 30,
                                    height: 39.4,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0.8, 0),
                                child: Text(
                                  'Milk',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 8,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(11, 7, 11, 7),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 6.3),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'assets/images/purepng_1.png',
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    width: 40,
                                    height: 37.7,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0.8, 0),
                                child: Text(
                                  'Milk',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 8,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(16, 7, 16, 7),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 4.6),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'assets/images/milk_png_free_download_711.png',
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    width: 30,
                                    height: 39.4,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0.8, 0),
                                child: Text(
                                  'Milk',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 8,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(11, 7, 11, 7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 6.3),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/images/purepng_1.png',
                                    ),
                                  ),
                                ),
                                child: Container(
                                  width: 40,
                                  height: 37.7,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0.8, 0),
                              child: Text(
                                'Milk',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 8,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(2, 0, 0, 17),
              child: SizedBox(
                width: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 3, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: HexColor(Colorscommon.greenlite),
                          borderRadius: BorderRadius.circular(7.5),
                        ),
                        child: Container(
                          width: 15,
                          height: 15,
                          padding: EdgeInsets.fromLTRB(4, 4, 5, 5),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/images/leftarrow-removebg-preview.png',
                                ),
                              ),
                            ),
                            child: Container(
                              width: 6,
                              height: 6,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      decoration: BoxDecoration(
                        color: HexColor(Colorscommon.greenlite),
                        borderRadius: BorderRadius.circular(7.5),
                      ),
                      child: Container(
                        width: 15,
                        height: 15,
                        padding: EdgeInsets.fromLTRB(5, 4, 4, 5),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/right-arrow-icon-removebg-preview.png',
                              ),
                            ),
                          ),
                          child: Container(
                            width: 6,
                            height: 6,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),*/
            Container(
              margin: EdgeInsets.fromLTRB(24, 24, 22, 11),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF68BB59),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 6, 2, 5),
                          child: Text(
                            'ALL',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              'Roboto',
                              fontWeight: FontWeight.w700,
                              fontSize: 8,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFD9D9D9),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(8, 6, 8.5, 5),
                          child: Text(
                            'VEGETABLES',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              fontWeight: FontWeight.w700,
                              fontSize: 8,
                              color: Color(0xFF000000),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFD9D9D9),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(17, 6, 18.2, 5),
                          child: Text(
                            'FRUITS',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              fontWeight: FontWeight.w700,
                              fontSize: 8,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFD9D9D9),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 6, 10.7, 5),
                          child: Text(
                            'ICE CREAM',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              fontWeight: FontWeight.w700,
                              fontSize: 8,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 6, 20, 5),
                        child: Text(
                          'MILK',
                          style: GoogleFonts.getFont(
                            'Roboto',
                            fontWeight: FontWeight.w700,
                            fontSize: 8,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(24, 10, 22, 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(8), // Optional: Add rounded corners
                  boxShadow: [ // Optional: Add a slight shadow for better UI
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(9, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Image.asset(
                          'assets/images/loupe_1.png',
                          width: 18,
                          height: 18,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            hintStyle: TextStyle(
                              fontSize: 14, // Update the font size as needed
                              color: Colors.black.withOpacity(0.5), // Hint color
                            ),
                            border: InputBorder.none, // Remove the underline
                          ),
                          style: TextStyle(
                            fontSize: 14, // Text size inside the search box
                            color: Colors.black, // Change text color
                          ),
                          onChanged: (value) {
                            // Handle search functionality here
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(24, 0, 23, 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 6, 0),
                    child: SizedBox(
                      width: 248,
                      child: Text(
                        '15 items',
                        style: GoogleFonts.getFont(
                          'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 3.5, 0),
                        child: Text(
                          'Sort',
                          style: GoogleFonts.getFont(
                            'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 2, 11, 2),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/sort_2.png',
                              ),
                            ),
                          ),
                          child: Container(
                            width: 8,
                            height: 8,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 2.6, 0),
                        child: Text(
                          'Filter',
                          style: GoogleFonts.getFont(
                            'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/filter_1.png',
                              ),
                            ),
                          ),
                          child: Container(
                            width: 8,
                            height: 8,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(24, 0, 23, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(22, 0, 0, 8),
                              width: 50,
                              height: 47.9,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/images/tomato_png_image_1.png'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.topRight, // Aligns checkbox to the top right
                                child: Transform.scale(
                                  scale: 0.6, // Custom scale for the size of the checkbox (60% of the original size)
                                  child: Checkbox(
                                    value: ischecked, // Boolean value to check if it's checked or unchecked
                                    onChanged: (bool? value) {
                                      setState(() {
                                        ischecked = value!;
                                      });
                                    },
                                    checkColor: Colors.white, // Color of the checkmark
                                    activeColor: Color(0xFF68BB59), // Background color when checked
                                    side: BorderSide(
                                      color: Color(0xFF68BB59), // Border color
                                      width: 1.0, // Border width
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2), // Border radius
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 68.5,
                          decoration: BoxDecoration(
                            color: Color(0xFF68BB59),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Tomatoes',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 8,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(22, 0, 0, 8),
                              width: 50,
                              height: 45.8,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/images/onion_png_992131.png'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.topRight, // Aligns checkbox to the top right
                                child: Transform.scale(
                                  scale: 0.6, // Custom scale for the size of the checkbox (60% of the original size)
                                  child: Checkbox(
                                    value: ischecked, // Boolean value to check if it's checked or unchecked
                                    onChanged: (bool? value) {
                                      setState(() {
                                        ischecked = value!;
                                      });
                                    },
                                    checkColor: Colors.white, // Color of the checkmark
                                    activeColor: Color(0xFF68BB59), // Background color when checked
                                    side: BorderSide(
                                      color: Color(0xFF68BB59), // Border color
                                      width: 1.0, // Border width
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2), // Border radius
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),


                        Container(
                          width: 68.5,
                          decoration: BoxDecoration(
                            color: Color(0xFF68BB59),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Onions',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 8,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(22, 0, 0, 8),
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/images/lady_finger_okra_png_hd_image_1.png'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.topRight, // Aligns checkbox to the top right
                                child: Transform.scale(
                                  scale: 0.6, // Custom scale for the size of the checkbox (60% of the original size)
                                  child: Checkbox(
                                    value: ischecked, // Boolean value to check if it's checked or unchecked
                                    onChanged: (bool? value) {
                                      setState(() {
                                        ischecked = value!;
                                      });
                                    },
                                    checkColor: Colors.white, // Color of the checkmark
                                    activeColor: Color(0xFF68BB59), // Background color when checked
                                    side: BorderSide(
                                      color: Color(0xFF68BB59), // Border color
                                      width: 1.0, // Border width
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2), // Border radius
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],

                        ),
                        Container(
                          width: 68.5,
                          decoration: BoxDecoration(
                            color: Color(0xFF68BB59),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Ladysfinger',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 8,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(24, 0, 23, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(22, 0, 0, 8),
                              width: 50,
                              height: 47.9,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/images/cauliflower_transparent_image_thumb_1.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.topRight, // Aligns checkbox to the top right
                                child: Transform.scale(
                                  scale: 0.6, // Custom scale for the size of the checkbox (60% of the original size)
                                  child: Checkbox(
                                    value: ischecked, // Boolean value to check if it's checked or unchecked
                                    onChanged: (bool? value) {
                                      setState(() {
                                        ischecked = value!;
                                      });
                                    },
                                    checkColor: Colors.white, // Color of the checkmark
                                    activeColor: Color(0xFF68BB59), // Background color when checked
                                    side: BorderSide(
                                      color: Color(0xFF68BB59), // Border color
                                      width: 1.0, // Border width
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2), // Border radius
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 68.5,
                          decoration: BoxDecoration(
                            color: Color(0xFF68BB59),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Cauliflower',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 8,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(22, 0, 0, 8),
                              width: 50,
                              height: 45.8,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/images/brinjal_bunch_free_download_png_hq_1.png',
                                  ),
                                ),
                              ),
                              child: Container(
                                width: 50,
                                height: 47.9,
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.topRight, // Aligns checkbox to the top right
                                child: Transform.scale(
                                  scale: 0.6, // Custom scale for the size of the checkbox (60% of the original size)
                                  child: Checkbox(
                                    value: ischecked, // Boolean value to check if it's checked or unchecked
                                    onChanged: (bool? value) {
                                      setState(() {
                                        ischecked = value!;
                                      });
                                    },
                                    checkColor: Colors.white, // Color of the checkmark
                                    activeColor: Color(0xFF68BB59), // Background color when checked
                                    side: BorderSide(
                                      color: Color(0xFF68BB59), // Border color
                                      width: 1.0, // Border width
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2), // Border radius
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 68.5,
                          decoration: BoxDecoration(
                            color: Color(0xFF68BB59),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Brinjal',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 8,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(22, 0, 0, 8),
                              width: 50,
                              height: 45.8,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/images/pngimg_3.png',
                                  ),
                                ),
                              ),
                              child: Container(
                                width: 50,
                                height: 47.9,
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.topRight, // Aligns checkbox to the top right
                                child: Transform.scale(
                                  scale: 0.6, // Custom scale for the size of the checkbox (60% of the original size)
                                  child: Checkbox(
                                    value: ischecked, // Boolean value to check if it's checked or unchecked
                                    onChanged: (bool? value) {
                                      setState(() {
                                        ischecked = value!;
                                      });
                                    },
                                    checkColor: Colors.white, // Color of the checkmark
                                    activeColor: Color(0xFF68BB59), // Background color when checked
                                    side: BorderSide(
                                      color: Color(0xFF68BB59), // Border color
                                      width: 1.0, // Border width
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2), // Border radius
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 68.5,
                          decoration: BoxDecoration(
                            color: Color(0xFF68BB59),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Cucumber',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 8,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(24, 0, 23, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(22, 0, 0, 8),
                              width: 50,
                              height: 47.9,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/images/cauliflower_transparent_image_thumb_1.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.topRight, // Aligns checkbox to the top right
                                child: Transform.scale(
                                  scale: 0.6, // Custom scale for the size of the checkbox (60% of the original size)
                                  child: Checkbox(
                                    value: ischecked, // Boolean value to check if it's checked or unchecked
                                    onChanged: (bool? value) {
                                      setState(() {
                                        ischecked = value!;
                                      });
                                    },
                                    checkColor: Colors.white, // Color of the checkmark
                                    activeColor: Color(0xFF68BB59), // Background color when checked
                                    side: BorderSide(
                                      color: Color(0xFF68BB59), // Border color
                                      width: 1.0, // Border width
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2), // Border radius
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 68.5,
                          decoration: BoxDecoration(
                            color: Color(0xFF68BB59),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Cauliflower',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 8,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(22, 0, 0, 8),
                              width: 50,
                              height: 45.8,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/images/brinjal_bunch_free_download_png_hq_1.png',
                                  ),
                                ),
                              ),
                              child: Container(
                                width: 50,
                                height: 47.9,
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.topRight, // Aligns checkbox to the top right
                                child: Transform.scale(
                                  scale: 0.6, // Custom scale for the size of the checkbox (60% of the original size)
                                  child: Checkbox(
                                    value: ischecked, // Boolean value to check if it's checked or unchecked
                                    onChanged: (bool? value) {
                                      setState(() {
                                        ischecked = value!;
                                      });
                                    },
                                    checkColor: Colors.white, // Color of the checkmark
                                    activeColor: Color(0xFF68BB59), // Background color when checked
                                    side: BorderSide(
                                      color: Color(0xFF68BB59), // Border color
                                      width: 1.0, // Border width
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2), // Border radius
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 68.5,
                          decoration: BoxDecoration(
                            color: Color(0xFF68BB59),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Brinjal',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 8,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(22, 0, 0, 8),
                              width: 50,
                              height: 45.8,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/images/pngimg_3.png',
                                  ),
                                ),
                              ),
                              child: Container(
                                width: 50,
                                height: 47.9,
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.topRight, // Aligns checkbox to the top right
                                child: Transform.scale(
                                  scale: 0.6, // Custom scale for the size of the checkbox (60% of the original size)
                                  child: Checkbox(
                                    value: ischecked, // Boolean value to check if it's checked or unchecked
                                    onChanged: (bool? value) {
                                      setState(() {
                                        ischecked = value!;
                                      });
                                    },
                                    checkColor: Colors.white, // Color of the checkmark
                                    activeColor: Color(0xFF68BB59), // Background color when checked
                                    side: BorderSide(
                                      color: Color(0xFF68BB59), // Border color
                                      width: 1.0, // Border width
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2), // Border radius
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 68.5,
                          decoration: BoxDecoration(
                            color: Color(0xFF68BB59),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Cucumber',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 8,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 40.0,
              margin: EdgeInsets.fromLTRB(22.5, 22.5, 22.5, 15),
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF68BB59),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0.1, 0),
                    child: /*Text(
                    'SUBMIT',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Roboto',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),*/
                    TextButton(onPressed: () {
                      print('Address');
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Address()));
                    }, child: Text(
                      'SUBMIT',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(
                        'Roboto',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),

                    )
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
