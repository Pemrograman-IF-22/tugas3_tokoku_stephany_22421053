import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tokoku/models/produk_model.dart' show Product;


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> products = [];

  @override
  void initState() {
    super.initState();

    fetchProduct();
  }

  Future<void> fetchProduct() async {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products')
    );

    debugPrint('Response: ${response.body}');

    if (response.statusCode == 200) {

    } else {
      throw Exception(('gagal mengambil data produk'));

    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('tokoku'),
      ),
      body: GridView.builder(
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    child: Image.network(
                       'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
                       fit:BoxFit.cover,
                    )
                  ),
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: 8,
                    vertical: 4
                    ),
                    child: Text(
                      Product.kategori,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.amberAccent
                      ),
                    ),
                  ),
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: 8,
                    vertical: 4
                    ),
                    child: Text(
                      'produk ${index + 1}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        overflow:TextOverflow.ellipsis
                      ),
                    ),
                  ),
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: 8,
                    vertical: 4
                    ),
                    child: Text('{product.price}}',
                      style: TextStyle(
                        color: Colors.amberAccent
                      ),
                    ),
                  ),

                ],
              ),
            );

            
          },
        )
      );
  }
}