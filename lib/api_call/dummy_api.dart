import 'package:dio/dio.dart';
import 'package:grocy/model/product_details.dart';

class DummyApi {
  static String endPoint = 'https://dummyjson.com/products';
  Future<List<ProductDetails>> getDummyProducts() async {
    Dio dio = Dio();
    Response response = await dio.get(endPoint);
    if (response.statusCode == 200) {
      Map body = response.data;

      List products = body['products'];
      return List.generate(
        products.length,
        (index) => ProductDetails(
          category: products[index]["category"],
          descriptions: products[index]["description"],
          id: products[index]["id"],
          images: products[index]["images"],
          price: products[index]["price"],
          title: products[index]["title"],
          stock: products[index]["stock"],
          thumbnail: products[index]["thumbnail"],
        ),
      );
    } else {
      return Future.error(response.statusCode.toString());
    }
  }
}
