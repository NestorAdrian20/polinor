import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common_widget/round_button.dart';

import '../../common_widget/popular_resutaurant_row.dart';
import '../more/my_order_view.dart';

class OfferView extends StatefulWidget {
  const OfferView({super.key});

  @override
  State<OfferView> createState() => _OfferViewState();
}

class _OfferViewState extends State<OfferView> {
  TextEditingController txtSearch = TextEditingController();

  List offerArr = [
    {
      "image": "assets/img/polietileno.png",
      "name": "Bolsas",
      "rate": "4.9",
      "rating": "124",
      "type": "Negras",
      "food_type": "Polietileno"
    },
    {
      "image": "assets/img/polietileno.png",
      "name": "Rollo",
      "rate": "4.9",
      "rating": "124",
      "type": "Negro",
      "food_type": "Polietileno"
    },
    {
      "image": "assets/img/polietileno.png",
      "name": "Rollo",
      "rate": "4.9",
      "rating": "124",
      "type": "Morado",
      "food_type": "Polietileno"
    },
    {
      "image": "assets/img/polietileno.png",
      "name": "Bolsas",
      "rate": "4.9",
      "rating": "124",
      "type": "Amarillas",
      "food_type": "Polietileno"
    },
    {
      "image": "assets/img/polietileno.png",
      "name": "Bobinas",
      "rate": "4.9",
      "rating": "124",
      "type": "Carton",
      "food_type": "Carton"
    },
    {
      "image": "assets/img/polietileno.png",
      "name": "Bolsa",
      "rate": "4.9",
      "rating": "124",
      "type": "Azul",
      "food_type": "Polietileno"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      "Últimas ofertas",
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column( 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "¡Encuentra descuentos, ofertas\nproductos especiales y más!",
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: 140,
                  height: 30,
                  child: RoundButton(title: "Consultar ofertas", fontSize: 12 , onPressed: () {}),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: offerArr.length,
                itemBuilder: ((context, index) {
                  var pObj = offerArr[index] as Map? ?? {};
                  return PopularRestaurantRow(
                    pObj: pObj,
                    onTap: () {},
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
