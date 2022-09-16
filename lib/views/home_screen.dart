import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopx/controller/product_controller.dart';
import 'package:get/get.dart';
import 'package:shopx/views/product_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final ProductController productContoller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'ShopX',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                  ),
                ),
                IconButton(
                    icon: const Icon(Icons.view_list_rounded),
                    onPressed: () {}),
                IconButton(icon: const Icon(Icons.grid_view), onPressed: () {}),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (productContoller.isloading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: productContoller.productList.length,
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 16.0,
                    itemBuilder: (context, index) {
                      return ProductTile(productContoller.productList[index]);
                    },
                    staggeredTileBuilder: (index) =>
                        const StaggeredTile.fit(1));
              }
            }),
          )
        ],
      ),
    );
  }
}
