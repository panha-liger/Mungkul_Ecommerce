import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<String> repeatedCategory(List<String> categoryList) {
  Set<String> newCustomFunction = Set<String>.from(categoryList);
  return newCustomFunction.toList();
}

List<String>? bestSellingProductIds(List<OrderRecord> listOfOrders) {
  Map<String, int> productSalesCount = {};
  int topCount = 4;

  // Process each order in the provided list
  for (var order in listOfOrders) {
    var checkoutProducts = List.from(order.checkoutProducts);

    for (var checkoutProduct in checkoutProducts) {
      String? productId = checkoutProduct
          .product.id; // Adjust field names as per your Firestore schema
      int quantity = checkoutProduct.quantity ?? 0;

      if (productId != null) {
        productSalesCount[productId] =
            (productSalesCount[productId] ?? 0) + quantity;
      }
    }
    print("productSalesCount: $productSalesCount");
  }

  // Creating a sorted list based on the total quantity sold, descending
  var sortedProducts = productSalesCount.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));

  // Extracting the top 'topCount' selling product IDs
  List<String> topSellingProductIds = [];
  for (var i = 0; i < math.min(topCount, sortedProducts.length); i++) {
    topSellingProductIds.add(sortedProducts[i].key);
  }
  print("topSellingProductIds: $topSellingProductIds");
  return topSellingProductIds;
}

List<BestSellingProductsStruct> bestSellingProducts(
    List<OrderRecord> listOfOrder) {
  Map<String, int> productSalesCount = {};
  int topCount = 4;

  // Process each order in the provided list
  for (var order in listOfOrder) {
    var checkoutProducts = List.from(order.checkoutProducts);

    for (var checkoutProduct in checkoutProducts) {
      String? productId = checkoutProduct
          .product.id; // Adjust field names as per your Firestore schema
      int quantity = checkoutProduct.quantity ?? 0;

      if (productId != null) {
        productSalesCount[productId] =
            (productSalesCount[productId] ?? 0) + quantity;
      }
    }
  }

  // Creating a sorted list based on the total quantity sold, descending
  var sortedProducts = productSalesCount.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));

  // Create a list to store the best selling products
  List<BestSellingProductsStruct> bestSellingProducts = [];
  for (var i = 0; i < math.min(topCount, sortedProducts.length); i++) {
    bestSellingProducts.add(
      BestSellingProductsStruct(
        productId: sortedProducts[i].key,
        productAmount: sortedProducts[i].value,
      ),
    );
    print(
        "bestSellingProducts: ${bestSellingProducts[i].productId} with ${bestSellingProducts[i].productAmount}");
  }

  return bestSellingProducts;
}
