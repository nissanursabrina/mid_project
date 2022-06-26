//Nissa Nursabrina-2031710029-MI2E
//model atau obj yang digunakan
import 'package:flutter/cupertino.dart';

var data = [
  {
    "name": "Grilled Chicken Salad",
    "description":
        "Grilled Chicken Salad per porsinya memiliki energi 1259 kj, lemak 8.65g, protein 26.04g, serta karbohidrat 33.38g.",
    "price": 170.0,
    "fav": false,
    "rating": 4.6,
    "image":
        "https://d2gtpjxvvd720b.cloudfront.net/system/recipe/image/3668/retina_hungry-girl-healthy-grilled-chicken-caprese-salad-recipe-20180724-1534-20227-9609.jpg",
  },
  {
    "name": "Egg Salad",
    "description":
        "Egg Salad per porsinya memiliki energi 2954 kj, lemak 67.18g, protein 20.42g, serta karbohidrat 4.28g.",
    "price": 140.5,
    "fav": false,
    "rating": 4.5,
    "image":
        "https://www.foodies.pk/wp-content/uploads/2020/08/Egg-Salad-1536x1024.jpeg"
  },
  {
    "name": "Mix Fruit Salad",
    "description":
        "Mix Fruit Salad per porsinya memiliki energi 225 kj, lemak 0.81g, protein 0.63g, serta karnohidrat 12.5g.",
    "price": 150.5,
    "fav": false,
    "rating": 4.7,
    "image":
        "https://th.bing.com/th/id/R.94874ffd46ca162253b6897d738be11d?rik=uzBGft%2f7uOJRAA&riu=http%3a%2f%2fcultureconsultants.ca%2fwp-content%2fuploads%2f2018%2f08%2ffruit-freshed-mixed-salad.jpg&ehk=PxlqHr54QWOVab1bvTmjMEDo2oeOxu6eDPG7Jz3ohPg%3d&risl=&pid=ImgRaw&r=0"
  },
  {
    "name": "Teh Tarik",
    "description":
        "Teh tarik adalah minuman manis berupa campuran teh dan susu yang lazim ditemukan di daerah Asia Tenggara, khususnya Indonesia, Malaysia, dan Singapura.",
    "price": 21.8,
    "fav": false,
    "rating": 4.4,
    "image":
        "https://th.bing.com/th/id/R.79397b9ee7f3e98ae0f060ef2e85541e?rik=ewBkcnvWRSJZVA&riu=http%3a%2f%2fgrosirmesin.com%2fwp-content%2fuploads%2f2019%2f08%2fn0tuaih9ywav_7J7wuI2Wgoke0qEkOOcqym_teh-tarik_landscapeThumbnail_id.png&ehk=U%2fZDqgU9zuZNFzxDbKH2qESYqmneesqfxXwOs1E1vyg%3d&risl=&pid=ImgRaw&r=0"
  },
  {
    "name": "Nasi Uduk",
    "description":
        "Nasi uduk adalah hidangan yang dibuat dari nasi putih yang diaron dan dikukus dengan santan, serta dibumbui dengan pala, kayu manis, jahe, daun serai dan merica.",
    "price": 27.5,
    "fav": false,
    "rating": 4.3,
    "image":
        "https://tfamanasek.com/wp-content/uploads/2019/06/Kuliner-Nasi-Uduk.jpg"
  },
  {
    "name": "Kopi Tubruk",
    "description":
        "Kopi tubruk adalah minuman kopi khas Indonesia yang dibuat dengan menuangkan air panas ke dalam gelas atau teko yang sudah diisi bubuk kopi. Bisa dengan ditambahkan gula, bisa juga tanpa gula.",
    "price": 23.3,
    "fav": false,
    "rating": 4.0,
    "image":
        "https://th.bing.com/th/id/OIP.3uUS7GkAHuCDmXsMx8FqLAHaE8?pid=ImgDet&rs=1"
  },
  {
    "name": "Dimsum Panggang Patin",
    "description":
        "Dimsum Panggang Patin adalah kulit dimsum yang diberi isian patin lalu dipanggang dengan api kecil.",
    "price": 36.2,
    "fav": false,
    "rating": 4.9,
    "image":
        "https://base.detik.com/static/a/51f1e74ff726cc06db003d54/original/Tayang%2029062013%20-%20Dinsum%20Patin%20Panggang.jpg?w=700&q=90"
  },
  {
    "name": "Rainbow Smoothie",
    "description":
        "Rainbow Smoothie adalah minuman berbahan baku buah-buahan, sayuran, sirup gula/gula pasir, susu tawar cair dan es batu didesain warna-warni sangat menggoda dan menarik minat anak-anak.",
    "price": 24.5,
    "fav": false,
    "rating": 4.7,
    "image":
        "https://www.woman.at/_storage/asset/8631736/storage/preview/file/128280489/63567725.jpg"
  }
];

class ShopItemModel {
  String name;
  String description;
  double price;
  bool fav;
  double rating;
  String image;
  int id;
  int shopId;

  ShopItemModel(
      {this.shopId,
      this.id,
      this.fav,
      this.rating,
      this.price,
      this.image,
      this.name,
      this.description});

  factory ShopItemModel.fromJson(Map<String, dynamic> json) {
    return ShopItemModel(
      id: json['id'],
      fav: json['fav'] == 1,
      rating: json['rating'],
      price: json['price'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      shopId: json['shop_id'] ?? 0,
    );
  }
}
