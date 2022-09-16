import 'package:get/get.dart';
import 'package:shopx/models/product_model.dart';
import 'package:shopx/services/remote_services.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  var isloading = true.obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try {
      isloading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isloading(false);
    }
  }
}
