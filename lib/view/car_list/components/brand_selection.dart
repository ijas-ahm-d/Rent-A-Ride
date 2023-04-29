import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/textstyle.dart';
import 'package:rent_a_ride/view_model/cars/cars_view_model.dart';

class BrandSelection extends StatelessWidget {
  var brandList = [
    {
      "name": "All",
      "icon": "",
    },
    {
      "name": "AUDI",
      "icon": "assets/images/AUDI.png",
    },
    {
      "name": "BENZ",
      "icon": "assets/images/Benz.png",
    },
    {
      "name": "MINI",
      "icon": "assets/images/Mini.png",
    },
    {
      "name": "BMW",
      "icon": "assets/images/Bmw.png",
    },
  ];

  BrandSelection({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    final providerCars = context.watch<CarsViewModel>();
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Text(
              "Brands",
              style: titleCardName,
            ),
          ),
          SizedBox(
            height: 100,
            width: double.infinity,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: brandList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return GestureDetector(
                    onTap: () {
                      providerCars.setBrandIndex(index);
                    },
                    child: BrandItem(
                      imgAssset: brandList[index]["icon"]!,
                      index: 0,
                      isSelected: (providerCars.currentBrandIndex == index)
                          ? true
                          : false,
                    ),
                  );
                } else {
                  return GestureDetector(
                    onTap: () {
                      providerCars.setBrandIndex(index);
                    },
                    child: BrandItem(
                      imgAssset: brandList[index]["icon"]!,
                      index: index,
                      isSelected: (providerCars.currentBrandIndex == index)
                          ? true
                          : false,
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class BrandItem extends StatelessWidget {
  final String imgAssset;
  final int index;
  final bool isSelected;
  const BrandItem({
    super.key,
    required this.imgAssset,
    required this.index,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: (index == 0)
          ? const EdgeInsets.fromLTRB(20, 12, 10, 12)
          : const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      padding: (index == 0)
          ? const EdgeInsets.symmetric(horizontal: 25, vertical: 20)
          : const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 7,
            spreadRadius: 0.5,
          )
        ],
        borderRadius: BorderRadius.circular(20),
        color: (isSelected)
            ? blueButton
            : (index == 0)
                ? Colors.black
                : Colors.white,
      ),
      child: (index == 0)
          ? const Center(
              child: Icon(
                Icons.grid_view_outlined,
                color: Colors.white,
                size: 30,
              ),
            )
          : Column(
              children: [
                Image.asset(
                  imgAssset,
                  width: 40,
                  height: 40,
                ),
              ],
            ),
    );
  }
}
