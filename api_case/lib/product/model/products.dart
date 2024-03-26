import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@JsonSerializable()
class Products with EquatableMixin {
  Products({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'price')
  double? price;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'category')
  String? category;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'rating')
  Rating? rating;

  Map<String, dynamic> toJson() => _$ProductsToJson(this);

  @override
  List<Object?> get props =>
      [id, title, price, description, category, image, rating];

  Products copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    Rating? rating,
  }) {
    return Products(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      rating: rating ?? this.rating,
    );
  }
}

@JsonSerializable()
class Rating with EquatableMixin {
  Rating({
    this.rate,
    this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
  @JsonKey(name: 'rate')
  double? rate;
  @JsonKey(name: 'count')
  int? count;

  Map<String, dynamic> toJson() => _$RatingToJson(this);

  @override
  List<Object?> get props => [rate, count];

  Rating copyWith({
    double? rate,
    int? count,
  }) {
    return Rating(
      rate: rate ?? this.rate,
      count: count ?? this.count,
    );
  }
}
