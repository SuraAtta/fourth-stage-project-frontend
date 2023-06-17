import 'dart:convert';
class Fav_modles {
  Produect? product;
  bool? isFav;

  Fav_modles({this.product,  this.isFav});

  Fav_modles.fromJson(Map<String, dynamic> json) {
    product =
    json['product'] != null ? new Produect.fromJson(json['product']) : null;
    isFav = json['isFav'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['isFav'] = this.isFav;
    return data;
  }
}
List<Produect> ProduectFromJson(String str) => List<Produect>.from(
    json.decode(str).map((x) => Produect.fromJson(x)));

String ProduectToJson(List<Produect> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Produect {
  int? id;
  String? name;
  String? banner;
  String? description;
  Category? category;
  List<Colors>? colors;
  int? price;
  int? stock;
  bool? isAvailable;
  bool? showHide;
  bool? isFav;
  bool? addToCart=false;
  List<ProductImage>? productImage;
  int? quantity=1;

  Produect(
      {this.id,
        this.name,
        this.banner,
        this.description,
        this.category,
        this.colors,
        this.price,
        this.stock,
        this.isAvailable,
        this.showHide,
        this.isFav,
        this.addToCart,
        this.productImage,
      this.quantity});

  Produect.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    banner = json['banner'];
    description = json['description'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['colors'] != null) {
      colors = <Colors>[];
      json['colors'].forEach((v) {
        colors!.add(new Colors.fromJson(v));
      });
    }
    price = json['price'];
    stock = json['stock'];
    isAvailable = json['is_available'];
    showHide = json['show_hide'];
    isFav = json['is_fav'];
    if (json['product_image'] != null) {
      productImage = <ProductImage>[];
      json['product_image'].forEach((v) {
        productImage!.add(new ProductImage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['banner'] = this.banner;
    data['description'] = this.description;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.colors != null) {
      data['colors'] = this.colors!.map((v) => v.toJson()).toList();
    }
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['is_available'] = this.isAvailable;
    data['show_hide'] = this.showHide;
    data['is_fav'] = this.isFav;
    if (this.productImage != null) {
      data['product_image'] = this.productImage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  String? name;
  String? image;
  Category({this.name,this.image});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class Colors {
  String? colorCode;

  Colors({this.colorCode});

  Colors.fromJson(Map<String, dynamic> json) {
    colorCode = json['color_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color_code'] = this.colorCode;
    return data;
  }
}
class ColorLogo {
  String? colorCode;
  String? image;

  ColorLogo({this.colorCode,this.image});

  ColorLogo.fromJson(Map<String, dynamic> json) {
    colorCode = json['color_code'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color_code'] = this.colorCode;
    return data;
  }
}

class ProductImage {
  String? image;

  ProductImage({this.image});

  ProductImage.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    return data;
  }
}
