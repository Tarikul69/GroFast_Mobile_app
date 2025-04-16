import 'package:flutter/material.dart';
import 'package:gro_fast/model/model.dart';
import 'package:gro_fast/network/api_service.dart';

class home extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GroFast'), backgroundColor: Colors.green),
      body: FutureBuilder<List<Product>>(
        future: apiService.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          if (snapshot.hasError)
            return Center(child: Text('Error: ${snapshot.error}'));
          if (!snapshot.hasData || snapshot.data!.isEmpty)
            return Center(child: Text('No products found.'));

          final products = snapshot.data!;
          return GridView.builder(
            itemCount: products.length,
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3 / 4,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: ${product.usersname}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Quantity: ${product.email}'),
                      Text('Price: ${product.phone_number}'),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
