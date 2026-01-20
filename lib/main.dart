import 'package:credpal_assessment/formatter.dart';
import 'package:credpal_assessment/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Credpal',
      theme: ThemeData(
        fontFamily: 'Avenir',
        scaffoldBackgroundColor: Color(0xffF1F3FE),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xffF1F3FE),
          elevation: 0,
          centerTitle: true,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            foregroundColor: Color(0xff274FED),
            textStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff274FED),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Color(0xFF274FED),
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
            fixedSize: Size(134, 36),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final merchants = <Merchant>[
    Merchant(
      title: 'Justrite',
      image: 'assets/images/vendor_images/justrite.png',
    ),
    Merchant(
      title: 'Orile Restaurant',
      image: 'assets/images/vendor_images/orile.png',
    ),
    Merchant(title: 'Slot ', image: 'assets/images/vendor_images/slot.png'),
    Merchant(
      title: 'Pointek',
      image: 'assets/images/vendor_images/pointek.png',
    ),
    Merchant(
      title: 'ogabassey ',
      image: 'assets/images/vendor_images/ogabassey.png',
    ),
    Merchant(
      title: 'Casper Stores',
      image: 'assets/images/vendor_images/casper.png',
    ),
    Merchant(
      title: 'Dreamworks ',
      image: 'assets/images/vendor_images/dreamworks.png',
    ),
    Merchant(
      title: 'Hubmart ',
      image: 'assets/images/vendor_images/hubmart.png',
    ),
    Merchant(
      title: 'Just Used',
      image: 'assets/images/vendor_images/justused.png',
    ),
    Merchant(
      title: 'Just fones',
      image: 'assets/images/vendor_images/justfones.png',
    ),
  ];

  final products = <Product>[
    Product(
      title: 'Nokia G20',
      image: 'assets/images/product_images/nokia.png',
      price: 88000,
      discount: 10,
    ),
    Product(
      title: 'iPhone XS Max 4GB RAM 64GB ROM',
      image: 'assets/images/product_images/iphone.png',
      price: 300000,
      discount: 20,
    ),
    Product(
      title: 'Masterchef Pressure Cooker',
      image: 'assets/images/product_images/pressure-cooker.png',
      price: 150000,
      discount: 30,
    ),
    Product(
      title: 'Anker Soundcore Space One',
      image: 'assets/images/product_images/anker.png',
      price: 150000,
      discount: 12,
    ),
    Product(
      title: 'iPhone 12 Pro',
      image: 'assets/images/product_images/iphone-12-pro.png',
      price: 650000,
      discount: 15,
    ),
    Product(
      title: 'PS4 Controller',
      image: 'assets/images/product_images/ps4-controller.png',
      price: 30000,
      discount: 5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xffD0DAFF),
            expandedHeight: 140,
            flexibleSpace: FlexibleSpaceBar(
              background: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 30.0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Spacer(),
                          Text(
                            'Pay later\neverywhere',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                              // height: 1,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                      SizedBox(width: 8),
                      Column(
                        children: [
                          Spacer(flex: 10),
                          SvgPicture.asset('assets/icons/info.svg'),
                          Spacer(flex: 2),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Shopping limit: ₦0',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff20294A),
                              height: 1,
                            ),
                          ),
                          SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Activate Credit',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 80,
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Flexible(
                    flex: 12,
                    child: TextField(
                      decoration: InputDecoration(
                        // border: InputBorder.none,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        fillColor: Color(0xffF1F3FE),
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        hintText: 'Search for products or stores',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            'assets/icons/search-normal.svg',
                            width: 18,
                            height: 18,
                          ),
                        ),
                        hintStyle: TextStyle(
                          // height: 0.8,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff9494B8),
                        ),
                      ),
                    ),
                  ),
                  // Spacer(),
                  Flexible(
                    flex: 2,
                    child: Container(
                      width: 45,
                      height: 45,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xffF4F5FE),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset('assets/icons/scan.svg'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 400,
              padding: EdgeInsets.symmetric(vertical: 14),
              color: Color(0xffF1F3FE),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => SizedBox(width: 16),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return ProductCard(product: products[index]);
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      separatorBuilder: (context, index) => SizedBox(width: 16),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return ProductCard(product: products[index + 3]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        'Featured Merchants',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Color(0xff33334D),
                        ),
                      ),
                      TextButton(onPressed: () {}, child: Text('View All')),
                    ],
                  ),
                  SizedBox(height: 36),
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) =>
                        MerchantCard(merchant: merchants[index]),
                    itemCount: merchants.length,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  double get discountedPrice =>
      (product.price - (product.price * (product.discount / 100)));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 200,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Color(0xff000000).withValues(alpha: 0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              product.image,
              fit: BoxFit.fill,
              width: 112,
              height: 96,
            ),
          ),
          Text(
            product.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: Color(0xff1A1A1A),
            ),
          ),
          Text.rich(
            TextSpan(
              text: discountedPrice.currencyFormat,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Color(0xff274FED),
              ),
              children: [
                TextSpan(text: ' '),
                TextSpan(
                  text: product.price.currencyFormat,
                  style: TextStyle(
                    fontSize: 12,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Color(0xffB3B3CC),
                    fontWeight: FontWeight.w500,
                    color: Color(0xffB3B3CC),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MerchantCard extends StatelessWidget {
  const MerchantCard({super.key, required this.merchant});
  final Merchant merchant;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(merchant.image, width: 60, height: 60),
        SizedBox(height: 4),
        Text(
          merchant.title,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Color(0xff1A1A1A),
          ),
        ),
      ],
    );
  }
}
