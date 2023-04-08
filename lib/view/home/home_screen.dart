import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_a_ride/components/common_snackbar.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/space.dart';
import 'package:rent_a_ride/view/home/widgets/offercard.dart';
import 'package:rent_a_ride/view/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List images = [
    "assets/images/car1.png",
    "assets/images/car2.png",
    "assets/images/car3.png",
  ];

  final List offer = [
    "10%",
    "40%",
    "5%",
  ];
  final List carNAme = [
    "Audi",
    "BROCHURES GUIDES MAZDA",
    "BUGATTI CHIRON ",
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [Text("Hello"), Text("Ijas Ahammed")],
          ),
          actions: [
            IconButton(
              onPressed: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                prefs.remove("isLoggedIn");
                Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return const SplashScreen();
                                },
                              ), (route) => false);
                              CommonSnackBAr().snackBar(context: context, data: " Log Out", color: specialGreen);
              },
              icon:const Icon(Icons.logout),
            ),
            // IconButton(
            //     onPressed: () {
            //       showDialog(
            //         context: context,
            //         builder: (context) {
            //           return AlertDialog(
            //             title: const Text("Do you want to Log Out?"),
            //             actions: [
            //               TextButton(
            //                 onPressed: () {
            //                   Navigator.pop(context);
            //                 },
            //                 child: const Text(
            //                   "No",
            //                   style: TextStyle(color: kBlack),
            //                 ),
            //               ),
            //               TextButton(
            //                 onPressed: () {
            //                   Provider.of<UserProfileProvider>(context,
            //                          listen: false)
            //                       .logOutUser(context);
            //                   Navigator.pushAndRemoveUntil(context,
            //                       MaterialPageRoute(
            //                     builder: (context) {
            //                       return const SplashScreen(isLoggedIn: false);
            //                     },
            //                   ), (route) => false);
            //                   MsgSnackBAr().snackBar(context: context, data: " Log Out", color: specialGreen);
            //                 },
            //                 child: const Text(
            //                   "Yes",
            //                   style: TextStyle(color: kBlack),
            //                 ),
            //               ),
            //             ],
            //           );
            //         },
            //       );

            //     },
            //     icon: const Icon(Icons.logout))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SpaceWH(
                    width: 20,
                  ),
                  Text(
                    "BEST OFFERS",
                    style: GoogleFonts.truculenta(
                      color: kBlack,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2,
                      fontSize: size.width * 0.05,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.30,
                child: Swiper(
                  pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                        color: kBlack, activeColor: Colors.red),
                  ),
                  autoplay: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return OfferCard(
                      carName: carNAme[index],
                      size: size,
                      images: images[index],
                      offer: offer[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
