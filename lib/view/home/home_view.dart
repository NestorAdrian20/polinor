import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common_widget/round_textfield.dart';
import 'package:food_delivery/view/menu/item_details_view.dart';

import '../../common/globs.dart';
import '../../common/service_call.dart';
import '../../common_widget/category_cell.dart';
import '../../common_widget/most_popular_cell.dart';
import '../../common_widget/popular_resutaurant_row.dart';
import '../../common_widget/recent_item_row.dart';
import '../../common_widget/view_all_title_row.dart';
import '../more/my_order_view.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController txtSearch = TextEditingController();

  /*List catArr = [
    {"image": "assets/img/polietileno.png", "name": "Rollo"},
    {"image": "assets/img/polietileno.png", "name": "Bolsa"},
    {"image": "assets/img/polietileno.png", "name": "Película"},
    {"image": "assets/img/polietileno.png", "name": "Flexografía"},
    {"image": "assets/img/polietileno.png", "name": "Laminación"},
    {"image": "assets/img/polietileno.png", "name": "Coextrusión"},
  ];*/

  List popArr = [
    {
      "image": "assets/img/polietileno.png",
      "name": "bolsas Blancas",
      "rate": "4.9",
      "rating": "124",
      "type": "Alta dencidad",
      "food_type": "polietileno"
    },
    {
      "image": "assets/img/polietileno.png",
      "name": "Bobina",
      "rate": "4.9",
      "rating": "124",
      "type": "Carton",
      "food_type": "carton"
    },
    {
      "image": "assets/img/polietileno.png",
      "name": "Rollo",
      "rate": "4.9",
      "rating": "124",
      "type": "Transparente",
      "food_type": "Polietileno"
    },
  ];

  List mostPopArr = [
    {
      "image": "assets/img/polietileno.png",
      "name": "Bolsa",
      "rate": "4.9",
      "rating": "124",
      "type": "Transparente",
      "food_type": "Polietileno"
    },
    {
      "image": "assets/img/polietileno.png",
      "name": "Bobina",
      "rate": "4.9",
      "rating": "124",
      "type": "Carton",
      "food_type": "Carton"
    },
  ];

  List recentArr = [
    {
      "image": "assets/img/polietileno.png",
      "name": "Bolsa",
      "rate": "4.9",
      "rating": "124",
      "type": "Transparente",
      "food_type": "Polietileno"
    },
    {
      "image": "assets/img/polietileno.png",
      "name": "Rollo",
      "rate": "4.9",
      "rating": "124",
      "type": "Color Negro",
      "food_type": "Polietileno"
    },
    {
      "image": "assets/img/polietileno.png",
      "name": "Rollo",
      "rate": "4.9",
      "rating": "124",
      "type": "Color",
      "food_type": "Amarillo"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 46,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Buenos dias ${ServiceCall.userPayload[KKey.name] ?? ""}!",
                      style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyOrderView()));
                      },
                      icon: Image.asset(
                        "assets/img/shopping_cart.png",
                        width: 25,
                        height: 25,
                      ),
                    ),             
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Entregando a",
                      style:
                          TextStyle(color: TColor.secondaryText, fontSize: 11),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Ubicación actual",
                          style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Image.asset(
                          "assets/img/dropdown.png",
                          width: 12,
                          height: 12,
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RoundTextfield(
                  hintText: "Buscar producto",
                  controller: txtSearch,
                  left: Container(
                    alignment: Alignment.center,
                    width: 30,
                    child: Image.asset(
                      "assets/img/search.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 30,
              ),
              /*SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: catArr.length,
                  itemBuilder: ((context, index) {
                    var cObj = catArr[index] as Map? ?? {};
                    return CategoryCell(
                      cObj: cObj,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ItemDetailsView(),
                          ),
                        );
                      },
                    );
                  }),
                ),
              ),*/
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(
                  title: "Mas vendidos",
                  onView: () {},
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: popArr.length,
                itemBuilder: ((context, index) {
                  var pObj = popArr[index] as Map? ?? {};
                  return PopularRestaurantRow(
                    pObj: pObj,
                    onTap: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemDetailsView(),
                    ),
                  );},
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(
                  title: "Mas populares",
                  onView: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemDetailsView(),
                    ),
                  );
                  },
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: mostPopArr.length,
                  itemBuilder: ((context, index) {
                    var mObj = mostPopArr[index] as Map? ?? {};
                    return MostPopularCell(
                      mObj: mObj,
                      onTap: () {
                        Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemDetailsView(),
                    ),
                  );
                      },
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(
                  title: "Recientes",
                  onView: () {},
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: recentArr.length,
                itemBuilder: ((context, index) {
                  var rObj = recentArr[index] as Map? ?? {};
                  return RecentItemRow(
                    rObj: rObj,
                    onTap: () {
                      Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemDetailsView(),
                    ),
                  );
                    },
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
