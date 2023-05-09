// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';

// class StripeCheckout extends StatelessWidget {
//   final Function() onToken;
//   final String stripeKey;
//   final String label;
//   final String name;
//   final String componentClass;
//   final String description;
//   final String image;
//   final String panelLabel;
//   final int amount;
//   final String currency;
//   final String locale;
//   final String email;
//   final bool shippingAddress;
//   final bool billingAddress;
//   final bool zipCode;
//   final bool alipay;
//   final bool bitcoin;
//   final bool allowRememberMe;
//   final bool reconfigureOnUpdate;
//   final String triggerEvent;

//   const StripeCheckout({
//    required Key key,
//     required this.onToken,
//     required this.stripeKey,
//     this.label="",
//     this.name="",
//     this.componentClass="",
//     this.description="",
//     this.image="",
//     this.panelLabel="",
//     this.amount =100,
//     this.currency="",
//     this.locale="",
//     this.email="",
//     this.shippingAddress=true,
//     this.billingAddress=true,
//     this.zipCode=true,
//     this.alipay=true,
//     this.bitcoin=true,
//     this.allowRememberMe=true,
//     this.reconfigureOnUpdate=true,
//     this.triggerEvent="",
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () async {
//         try {
//           Stripe.publishableKey = stripeKey;

//           final paymentMethod = await Stripe.instance.createPaymentMethod(
//             params: 
//             PaymentMethodParams.card(
            
//               paymentMethodData: PaymentMethodData(billingDetails:BillingDetails(
//                 name: name,
//                 email: email,
//                 address:const Address(
//                   city: null, // address_city
//                   country: null, // address_country
//                   line1: null, // address_line1
//                   line2: null, // address_line2
//                   state: null, // address_state
//                   postalCode: null, // address_zip
//                 ),
//               ), ),
               
//             ),
//           );

//           final token = await Stripe.instance.createToken(
//             TokenParams.card(
//               billingDetails: BillingDetails(
//                 name: name,
//                 email: email,
//                 address: Address(
//                   city: null, // address_city
//                   country: null, // address_country
//                   line1: null, // address_line1
//                   line2: null, // address_line2
//                   state: null, // address_state
//                   postalCode: null, // address_zip
//                 ),
//               ),
//             ),
//           );

//           onToken(token);
//         } catch (e) {
//           print('Error creating token: $e');
//         }
//       },
//       child: Text(label),
//     );
//   }
// }