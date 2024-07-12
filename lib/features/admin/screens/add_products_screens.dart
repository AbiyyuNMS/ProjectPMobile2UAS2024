import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prjct223_d1_24/common/widgets/custom_buttons.dart';
import 'package:prjct223_d1_24/common/widgets/customtext_field.dart';
import 'package:prjct223_d1_24/constants/universal_var.dart';
import 'package:prjct223_d1_24/constants/utils.dart';
import 'package:prjct223_d1_24/features/admin/services/admin_service.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityNameController = TextEditingController();
  final AdminServices adminServices = AdminServices();
  String brands = 'Adidas';
  List<File> images = [];
  final _addProductFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityNameController.dispose();
  }

  List<String> productBrands = [
    'Adidas',
    'Converse',
    'Nike',
    'NewBalance',
    'Puma'
  ];

  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      adminServices.sellProduct(
          context: context,
          name: productNameController.text,
          description: descriptionController.text,
          price: double.parse(priceController.text),
          quantity: double.parse(quantityNameController.text),
          category: brands,
          images: images);
    }
  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: UniversalVariable.appBarGradient,
              ),
            ),
            title: const Text(
              "Add Products",
              style: TextStyle(color: Colors.white),
            )),
      ),
      body: SingleChildScrollView(
          child: Form(
        key: _addProductFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              images.isNotEmpty
                  ? CarouselSlider(
                      items: images.map((i) {
                        return Builder(
                          builder: (BuildContext context) => Image.file(
                            i,
                            fit: BoxFit.cover,
                            height: 200,
                          ),
                        );
                      }).toList(),
                      options:
                          CarouselOptions(viewportFraction: 1, height: 200),
                    )
                  : GestureDetector(
                      onTap: selectImages,
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(10),
                        dashPattern: const [10, 4],
                        strokeCap: StrokeCap.round,
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.folder_open,
                                size: 40,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Select Product Images",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey.shade400),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                  controller: productNameController, labelText: "Product Name"),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: descriptionController,
                labelText: "Descripton",
                maxLines: 7,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(controller: priceController, labelText: "Price"),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                  controller: quantityNameController, labelText: "Quantity"),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: DropdownButton(
                    value: brands,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: productBrands.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        brands = newVal!;
                      });
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                color: Colors.blue,
                text: "Upload",
                onTap: sellProduct,
              )
            ],
          ),
        ),
      )),
    );
  }
}
