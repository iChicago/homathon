import 'package:mobile_store_driver/model/cart_model.dart';
import 'package:mobile_store_driver/model/category_model.dart';
import 'package:mobile_store_driver/model/product.dart';

class DataSample {
  static final List<Category> category = [
    Category(index: 0, name: "All"),
    Category(index: 1, name: "Bread"),
    Category(index: 2, name: "Egg"),
    Category(index: 3, name: "Dairy"),
    Category(index: 4, name: "Fruits"),
    Category(index: 5, name: "Vegetables"),
    Category(index: 6, name: "Chocolates"),
    Category(index: 7, name: "Snacks"),
  ];
  static double orderToral = 0;
  static final List<Product> cart = [];
  static final List<CartItemModel> cartItems = [];
  static final List<CartItemModel> refilItems = [
    CartItemModel(product: products[0], quantity: 3),
    CartItemModel(product: products[1], quantity: 2),
    CartItemModel(product: products[6], quantity: 10),
    CartItemModel(product: products[4], quantity: 5),
  ];
  static final List<CartItemModel> refillItemsStore = [
    CartItemModel(product: products[0], quantity: 3),
    CartItemModel(product: products[1], quantity: 2),
    CartItemModel(product: products[6], quantity: 10),
    CartItemModel(product: products[4], quantity: 5),
  ];
  static final List<CartItemModel> storeKeeper = [
    CartItemModel(product: products[0], quantity: 3),
    CartItemModel(product: products[1], quantity: 2),
    CartItemModel(product: products[6], quantity: 10),
    CartItemModel(product: products[4], quantity: 5),
  ];

  static final List<Product> products = [
    Product(
        code: 1,
        name: 'Egg',
        category: 2,
        price: 20,
        stock: 50,
        remaining: 50,
        moreInfo: "Sample infor about our product.",
        image: 'assets/images/egg.jpg'),
    Product(
        code: 2,
        name: 'Bread',
        category: 1,
        price: 5,
        stock: 50,
        remaining: 50,
        moreInfo: "Sample infor about our product.",
        image: 'assets/images/bread.png'),
    Product(
        code: 3,
        name: 'Cucumber',
        category: 5,
        price: 8,
        stock: 40,
        remaining: 40,
        moreInfo: "Sample infor about our product.",
        image: 'assets/images/cucumber.jpg'),
    Product(
        code: 4,
        name: 'Milk',
        category: 3,
        price: 10,
        stock: 80,
        remaining: 80,
        moreInfo: "Sample infor about our product.",
        image: 'assets/images/milk.jpg'),
    Product(
        code: 5,
        name: 'Milk 1',
        category: 3,
        price: 10,
        stock: 80,
        remaining: 80,
        moreInfo: "Sample infor about our product.",
        image: 'assets/images/milk1.png'),
    Product(
        code: 6,
        name: 'Milk 2',
        category: 3,
        price: 10,
        stock: 80,
        remaining: 80,
        moreInfo: "Sample infor about our product.",
        image: 'assets/images/milk2.jpg'),
    Product(
        code: 7,
        name: 'Tomatoes',
        category: 5,
        price: 25,
        stock: 40,
        remaining: 40,
        moreInfo: "Sample infor about our product.",
        image: 'assets/images/tomatoes.jpg'),
    Product(
        code: 8,
        name: 'cheese',
        category: 3,
        price: 10,
        stock: 80,
        remaining: 80,
        moreInfo: "Sample infor about our product.",
        image: 'assets/images/cheese1.jpg'),
    Product(
        code: 9,
        name: 'cheese',
        category: 3,
        price: 10,
        stock: 80,
        remaining: 80,
        moreInfo: "Sample infor about our product.",
        image: 'assets/images/chees.jpg'),
    Product(
        code: 10,
        name: 'cheese',
        category: 3,
        price: 10,
        stock: 80,
        remaining: 80,
        moreInfo: "Sample infor about our product.",
        image: 'assets/images/cheese1.jpg'),
    Product(
        code: 11,
        name: 'Potatos',
        category: 5,
        price: 12,
        stock: 4,
        remaining: 4,
        moreInfo: "Sample infor about our product.",
        image: 'assets/images/potatos.jpg'),
  ];
}

class CategoryName {
  static const all = 0;
  static const bread = 1;
  static const egg = 2;
  static const dairy = 3;
  static const fruits = 4;
  static const vegetables = 5;
  static const chocolates = 6;
  static const snacks = 6;
}
/*
  static final List<Product> product = [
    Product(name: 'Egg', categoryc: 2, price: 20, stock: 50, moreInfo: "Box", image: 'assets/egg.jpg'),
    Product(name: 'Bread', categoryc: 1, price: 5, stock: 50,moreInfo: "pice", image: 'assets/bread.png'),
    Product(name: 'Cucumber', categoryc: 5, price: 8, stock: 40, moreInfo: "Kg", image: 'assets/cucumber.jpg'),
    Product(name: 'Milk', categoryc: 3, price: 10, stock: 80, moreInfo: "pice", image: 'assets/milk.jpg'),
    Product(name: 'Milk 1', categoryc: 3, price: 10, stock: 80, moreInfo: "pice", image: 'assets/milk1.png'),
    Product(name: 'Milk 2', categoryc: 3, price: 10, stock: 80, moreInfo: "pice", image: 'assets/milk2.jpg'),
    Product(name: 'Tomatoes', categoryc: 5, price: 25, stock: 40, moreInfo: "Kg", image: 'assets/tomatoes.jpg'),
    Product(name: 'cheese', categoryc: 3, price: 10, stock: 80, moreInfo: "pice", image: 'assets/cheese1.jpg'),
    Product(name: 'cheese', categoryc: 3, price: 10, stock: 80, moreInfo: "pice", image: 'assets/chees.jpg'),
    Product(name: 'cheese', categoryc: 3, price: 10, stock: 80, moreInfo: "pice", image: 'assets/cheese1.jpg'),
    Product(name: 'Potatos', categoryc: 5, price: 12, stock: 4, moreInfo: "Kg", image: 'assets/potatos.jpg'),
  ];

 */
