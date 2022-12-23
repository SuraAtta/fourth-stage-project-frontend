import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:fourth_stage/src/views/ui/home_page/home.dart';
import 'package:get/get.dart';
import '../../ui/cart_page/cart.dart';
import '../../ui/favorite_page/favorite.dart';
import '../../ui/home_page/nav_slider.dart';
import '../../ui/profile_page/profile.dart';
import '../../ui/search_page/search.dart';
import '../style/colors.dart';

class MainNav extends StatefulWidget {
  MainNav({Key? key, required this.selectedIndex}) : super(key: key);
  final int selectedIndex;
  @override
  State<MainNav> createState() => _MainNavState(selectedIndex);
}

final BorderRadius _borderRadius = const BorderRadius.only(
  topLeft: Radius.circular(30),
  topRight: Radius.circular(30),
);
ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    bottomRight: Radius.circular(0),
    bottomLeft: Radius.circular(0),
    topRight: Radius.circular(30),
    topLeft: Radius.circular(30),
  ),
);
SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.pinned;
EdgeInsets padding = const EdgeInsets.all(0);
int _selectedItemPosition = 0;
SnakeShape snakeShape = SnakeShape.indicator;
bool showSelectedLabels = false;
bool showUnselectedLabels = false;
Color selectedColor = Colors.white;
Color unselectedColor = Colorsapp.lGray;
Color? containerColor = Colorsapp.themeColor;
Color containerColors = Colorsapp.themeColor;
final TextEditingController searchController =
TextEditingController(text: "");
final RxBool isEmpty1 = true.obs;
final RxString text = searchController.text.obs;

class _MainNavState extends State<MainNav> {
  int selectedIndex;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    FavoritePage(),
    SearchPage( searchController: searchController,
  onPressed: () {
  Get.to(HomePage());
  },
  onChanged: (String text1) {
    text.value = text1;
    if (text.value == "") {
      isEmpty1.value = true;
    } else {
      isEmpty1.value = false;
    }
  }),
    CartPage(),
    ProfilePage(),
  ];

  _MainNavState(this.selectedIndex);

  @override
  Widget build(BuildContext context) {
  final TextEditingController searchController =
  TextEditingController(text: "");
  final RxBool isEmpty1 = true.obs;
  final RxString text = searchController.text.obs;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colorsapp.bgColor,
        elevation: 0,
        actions: [
          Builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colorsapp.dGray,
                  size: 30,
                ),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
          ),
        ],
      ),
      endDrawer: Navbar(),
      body: SafeArea(child: _widgetOptions[selectedIndex]),
      bottomNavigationBar: SnakeNavigationBar.color(
        height: 60,
        behaviour: SnakeBarBehaviour.floating,
        snakeShape: SnakeShape.indicator,
        snakeViewColor: Colorsapp.themeColor,
        shape: bottomBarShape,
        elevation: 50,
        padding: padding,
        shadowColor: Colors.green,
        backgroundColor: Colorsapp.themeColor,
        unselectedItemColor: unselectedColor,
        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
          print(index);
          switch (index) {
            case 0:
              print("_selectedIndex=> ${selectedIndex}");
              break;
            case 1:
              print("_selectedIndex=> ${selectedIndex}");
              break;
            case 2:
              print("_selectedIndex=> ${selectedIndex}");
              break;
            case 3:
              print("_selectedIndex=> ${selectedIndex}");
              break;
            case 4:
              print("_selectedIndex=> ${selectedIndex}");
              break;
          }
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              size: 26,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 26,
              ),
              label: 'favorite'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 36,
              ),
              label: 'search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'prodects'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 26,
              ),
              label: 'profile'),
        ],
        selectedLabelStyle: const TextStyle(fontSize: 18),
        unselectedLabelStyle: const TextStyle(fontSize: 14),
      ),
    );
  }
}
