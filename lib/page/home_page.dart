import 'package:flutter/material.dart';
import 'package:my_store_app/model/ListProduk.dart';
import 'package:my_store_app/model/ProdukModel.dart';
import 'package:my_store_app/widgets/card.dart';
import 'package:my_store_app/widgets/snackbar_new.dart';
import 'package:my_store_app/widgets/themes.dart';

import 'detail_produk_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Tentukan daftar kategori
  final List<String> categories = [
    "women's clothing",
    "jewelery",
    "electronics",
    "men's clothing",
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length, // Jumlah tab sesuai dengan jumlah kategori
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/ic_profile.png',
                    width: 50,
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello,',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    ),
                  ),
                  Text(
                    'Irwan Sanjaya',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            GestureDetector(
              onDoubleTap: () {
                snackbar(context, "Fitur ini belum tersedia!", redColor);
              },
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 5,
                    top: 0,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text(
                          '20',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: blueColor,
            indicatorColor: blueSoftColor,
            isScrollable: true,
            tabs: categories.map(
              (category) {
                return Tab(
                  text: category,
                );
              },
            ).toList(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  blueColor,
                  blueColor1,
                ],
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: TabBarView(
              children: categories.map((category) {
                // Filter the products based on the current category
                final List<ProdukModal> filteredProducts = listProduk.where(
                  (product) {
                    return product.category == category;
                  },
                ).toList();
                return ListView.builder(
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final ProdukModal produk = filteredProducts[index];
                    return CardItem(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailProduk(produkDetail: produk),
                          ),
                        );
                      },
                      title: produk.title!.toString(),
                      price: produk.price.toString(),
                      category: produk.category.toString(),
                      imageUrl: produk.image.toString(),
                      rate: produk.rating!.rate.toString(),
                      count: produk.rating!.count.toString(),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
