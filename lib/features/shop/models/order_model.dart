// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/foundation.dart';

import 'package:ecommerce/features/personalization/models/address_model.dart';
import 'package:ecommerce/features/shop/models/cart_item_model.dart';
import 'package:ecommerce/utils/constants/enum.dart';

class OrderModel {
  final String id;
  final String userId;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final AddressModel? address;
  final DateTime? deliveryDate;
  final List<CartItemModel> items;
  OrderModel({
    required this.id,
    this.userId = '',
    required this.status,
    required this.totalAmount,
    required this.orderDate,
    this.paymentMethod = 'Paypal',
    this.address,
    this.deliveryDate,
    required this.items,
  });

  String get formattedOrderDate => CHelperFuntions.getFormattedDate(orderDate);

  String get formattedDeliveryDate =>
      deliveryDate != null ? CHelperFuntions.getFormattedDate(orderDate) : '';

  String get orderStatusText => status == OrderStatus.delivered
      ? 'Delivered'
      : status == OrderStatus.shipped
          ? 'Shipment on the way'
          : 'Processing';

  OrderModel copyWith({
    String? id,
    String? userId,
    OrderStatus? status,
    double? totalAmount,
    DateTime? orderDate,
    String? paymentMethod,
    AddressModel? address,
    DateTime? deliveryDate,
    List<CartItemModel>? items,
  }) {
    return OrderModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      status: status ?? this.status,
      totalAmount: totalAmount ?? this.totalAmount,
      orderDate: orderDate ?? this.orderDate,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      address: address ?? this.address,
      deliveryDate: deliveryDate ?? this.deliveryDate,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'status': status.toString(),
      'totalAmount': totalAmount,
      'orderDate': orderDate.millisecondsSinceEpoch,
      'paymentMethod': paymentMethod,
      'address': address?.toJson(),
      'deliveryDate': deliveryDate?.millisecondsSinceEpoch,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return OrderModel(
      id: snapshot['id'] as String,
      userId: snapshot['userId'] as String,
      status: OrderStatus.values
          .firstWhere((element) => element.toString() == data['satus']),
      totalAmount: snapshot['totalAmount'] as double,
      orderDate:
          DateTime.fromMillisecondsSinceEpoch(snapshot['orderDate'] as int),
      paymentMethod: snapshot['paymentMethod'] as String,
      address: snapshot['address'] != null
          ? AddressModel.fromMap(snapshot['address'] as Map<String, dynamic>)
          : null,
      deliveryDate: snapshot['deliveryDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(snapshot['deliveryDate'] as int)
          : null,
      items: List<CartItemModel>.from(
        (snapshot['items'] as List<int>).map<CartItemModel>(
          (x) => CartItemModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromSnapshot(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderModel(id: $id, userId: $userId, status: $status, totalAmount: $totalAmount, orderDate: $orderDate, paymentMethod: $paymentMethod, address: $address, deliveryDate: $deliveryDate, items: $items)';
  }

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.status == status &&
        other.totalAmount == totalAmount &&
        other.orderDate == orderDate &&
        other.paymentMethod == paymentMethod &&
        other.address == address &&
        other.deliveryDate == deliveryDate &&
        listEquals(other.items, items);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        status.hashCode ^
        totalAmount.hashCode ^
        orderDate.hashCode ^
        paymentMethod.hashCode ^
        address.hashCode ^
        deliveryDate.hashCode ^
        items.hashCode;
  }
}
