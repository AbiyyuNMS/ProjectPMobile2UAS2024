// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
// import 'package:prjct223_d1_24/common/widgets/custom_buttons.dart';
import 'package:prjct223_d1_24/common/widgets/customtext_field.dart';
import 'package:prjct223_d1_24/constants/universal_var.dart';
import 'package:prjct223_d1_24/features/adress/screens/services/payment_config.dart';
import 'package:prjct223_d1_24/provider/user_provider.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = '/address';
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController noRumahController = TextEditingController();
  final TextEditingController provinsiController = TextEditingController();
  final TextEditingController kotaController = TextEditingController();
  final TextEditingController noposController = TextEditingController();
  final _addressFormKey = GlobalKey<FormState>();

  List<PaymentItem> paymentItems = [];

  @override
  void dispose() {
    super.dispose();
    noRumahController.dispose();
    provinsiController.dispose();
    kotaController.dispose();
    noposController.dispose();
  }

  void onGooglePayResult(res) {}

  @override
  Widget build(BuildContext context) {
    // var address = context.watch<UserProvider>().user.address;
    var address = "Pagutan";
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(62),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: UniversalVariable.appBarGradient,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (address.isNotEmpty)
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          address,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Or',
                      style: TextStyle(fontSize: 17),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              Form(
                  key: _addressFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: noRumahController,
                        labelText: "Alamat, no. Rumah",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: provinsiController,
                        labelText: "Provinsi",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: kotaController,
                        labelText: "Kota/Desa",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: noposController,
                        labelText: "No. Pos",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
              // Icon(Icons.access_alarms),
              GooglePayButton(
                paymentConfiguration:
                    PaymentConfiguration.fromJsonString(defaultGooglePay),
                paymentItems: paymentItems,
                onPaymentResult: onGooglePayResult,
                height: 100,
                type: GooglePayButtonType.buy,
                width: double.infinity,
                // theme: GooglePayButtonTheme.dark,
                margin: const EdgeInsets.only(top: 15),
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
