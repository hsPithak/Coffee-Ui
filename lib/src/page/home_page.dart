import 'package:coffeeui/src/utility/coffee_tile.dart';
import 'package:coffeeui/src/utility/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _controller = TextEditingController();


  // list of coffee types
  final List coffeeType = [
    // [coffee type, isSelected]
    ['Cappuccino', true,],
    ['Latte', false,],
    ['Milk', false,],
  ];

  // user tapped on coffee type
  void coffeeTypeSelected(int index) {
    setState(() {

      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right:20.0),
            child: Icon(Icons.person),
          )
        ],),

      drawer: const Drawer(),

      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedItemColor: Colors.blueAccent.shade400,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Notification"
          ),
        ],
      ),
      body: Column(
        children: [

          // find best coffee for you
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text("Find best coffee for you",
              style: GoogleFonts.bebasNeue(
                fontSize: 70
              ),
            ),
          ),
          const SizedBox(height: 25,),

          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                isDense: true,
                filled: false,
                hintStyle: GoogleFonts.poppins(),
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.blueAccent.shade400,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: (){
                    _controller.clear();
                  },
                ),
                hintText: "Find your coffee types",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                  borderRadius: BorderRadius.circular(20),)
              ),
              onTapOutside: (event){
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
          ),
          const SizedBox(height: 25.0,),
          // horizontal listview of coffee tiles
          Container(
            height: 50,
            alignment: Alignment.centerLeft,
            color: Colors.transparent,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context, index) {
                return CoffeeType(
                    coffeeType: coffeeType[index][0],
                    isSelected: coffeeType[index][1],
                    onTap: (){
                      coffeeTypeSelected(index);
                    });
                },)
          ),

          // horizontal listview of coffee tiles
          Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: const [
                  CoffeeTile(
                    coffeeImagePath: "assets/images/black_coffee.jpg",
                    coffeeName: "Black Coffee",
                    coffeeIngredient: "Black Coffee Bean",
                    coffeePrice: "1.00",
                  ),
                  CoffeeTile(
                    coffeeImagePath: "assets/images/latte.jpg",
                    coffeeName: "Coffee Latte",
                    coffeeIngredient: "Coffee and Milk",
                    coffeePrice: "2.50",
                  ),
                  CoffeeTile(
                    coffeeImagePath: "assets/images/milk.jpg",
                    coffeeName: "Milk",
                    coffeeIngredient: "Just Milk",
                    coffeePrice: "1.00",
                  ),
                ],
              ))

        ],
      ),
    );
  }
}
