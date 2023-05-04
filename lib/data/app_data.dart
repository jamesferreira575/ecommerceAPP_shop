import 'package:ecommerce_app/model/base_model.dart';
import 'package:ecommerce_app/model/categories_model.dart';

List<CategoriesModel> categories = [
  CategoriesModel(
    imageUrl: "assets/images/kids.jpg",
    title: "Crianças",
  ),
  CategoriesModel(
    imageUrl: "assets/images/mens.jpg",
    title: "Homens",
  ),
  CategoriesModel(
    imageUrl: "assets/images/women.jpg",
    title: "Mulheres",
  ),
  CategoriesModel(
    imageUrl: "assets/images/shoes.jpg",
    title: "Sapato",
  ),
  CategoriesModel(
    imageUrl: "assets/images/bags.jpg",
    title: "Bolsas",
  ),
  CategoriesModel(
    imageUrl: "assets/images/glass.jpg",
    title: "Óculos",
  ),
  CategoriesModel(
    imageUrl: "assets/images/hat.jpg",
    title: "Chapéu",
  ),
];

List<BaseModel> mainList = [
  BaseModel(
    imageUrl: "assets/images/mens.jpg",
    name: "Casual Jeans",
    price: 155.99,
    review: 3.6,
    star: 4.8,
    id: 1,
    value: 1,
  ),
  BaseModel(
    imageUrl: "assets/images/blazer.jpg",
    name: "Casaco Azul",
    price: 143.99,
    review: 5.6,
    star: 5.0,
    id: 2,
    value: 1,
  ),
  BaseModel(
    imageUrl: "assets/images/jacjket.jpg",
    name: "jaqueta verde escuro",
    price: 212.99,
    review: 2.6,
    star: 3.7,
    id: 3,
    value: 1,
  ),
  BaseModel(
    imageUrl: "assets/images/shirt.jpg",
    name: "camisa laranja",
    price: 432.99,
    review: 1.4,
    star: 2.4,
    id: 4,
    value: 1,
  ),
  BaseModel(
    imageUrl: "assets/images/sw.jpg",
    name: "Grey Pullover",
    price: 112.99,
    review: 4.2,
    star: 1.8,
    id: 5,
    value: 1,
  ),
  BaseModel(
    imageUrl: "assets/images/women.jpg",
    name: "pulôver sem mangas",
    price: 320.99,
    review: 2.1,
    star: 3.1,
    id: 6,
    value: 1,
  ),
  BaseModel(
    imageUrl: "assets/images/womens.jpg",
    name: "Casaco preto",
    price: 113.99,
    review: 3.1,
    star: 4.8,
    id: 7,
    value: 1,
  ),
  BaseModel(
    imageUrl: "assets/images/t-shirt.jpg",
    name: "Camisa branca",
    price: 178.99,
    review: 2.6,
    star: 4.8,
    id: 8,
    value: 1,
  ),
];


List<BaseModel> itemsOnCart = [];
List<BaseModel> itemsOnSearch = [];