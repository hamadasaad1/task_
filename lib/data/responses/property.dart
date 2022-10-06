// To parse this JSON data, do
//
//     final propertyrResponse = propertyrResponseFromJson(jsonString);

import 'dart:convert';

PropertyResponse propertyResponseFromJson(String str) => PropertyResponse.fromJson(json.decode(str));

String propertyResponseToJson(PropertyResponse data) => json.encode(data.toJson());

class PropertyResponse {
  PropertyResponse({
    this.id,
    this.owner,
    this.unavailableDates,
    this.overNightUse,
    this.dayUse,
    this.nightUse,
    this.date,
    this.title,
    this.description,
    this.featuredImage,
    this.images,
    this.address,
    this.rating,
    this.commentsCount,
    this.propertyType,
    this.features,
    this.descriptionSection,
    this.mapSection,
    this.informationSection,
    this.relatedSection,
    this.checkInDayUse,
    this.checkOutDayUse,
    this.checkInNightUse,
    this.checkOutNightUse,
    this.checkInOvernightUse,
    this.checkOutOvernightUse,
  });

  int ?id;
  String? owner;
  List<UnavailableDateResponse>? unavailableDates;
  bool ?overNightUse;
  bool ?dayUse;
  bool ?nightUse;
  String ?date;
  String ?title;
  String ?description;
  String ?featuredImage;
  List<dynamic>? images;
  String ?address;
  int ?rating;
  int ?commentsCount;
  String? propertyType;
  List<List<FeatureResponse>>? features;
  DescriptionSectionResponse ?descriptionSection;
  MapSectionResponse ?mapSection;
  InformationSectionResponse ?informationSection;
  RelatedSectionResponse? relatedSection;
  String ?checkInDayUse;
  String? checkOutDayUse;
  String? checkInNightUse;
  String? checkOutNightUse;
  String? checkInOvernightUse;
  String? checkOutOvernightUse;

  factory PropertyResponse.fromJson(Map<String, dynamic> json) => PropertyResponse(
    id: json["id"],
    owner: json["owner"],
    unavailableDates: List<UnavailableDateResponse>.from(json["unavailable_dates"].map((x) => UnavailableDateResponse.fromJson(x))),
    overNightUse: json["over_night_use"],
    dayUse: json["day_use"],
    nightUse: json["night_use"],
    date: json["date"],
    title: json["title"],
    description: json["description"],
    featuredImage: json["featured_image"],
    images: List<dynamic>.from(json["images"].map((x) => x)),
    address: json["address"],
    rating: json["rating"],
    commentsCount: json["comments_count"],
    propertyType: json["property_type"],
    features: List<List<FeatureResponse>>.from(json["features"].map((x) => List<FeatureResponse>.from(x.map((x) => FeatureResponse.fromJson(x))))),
    descriptionSection: DescriptionSectionResponse.fromJson(json["description_section"]),
    mapSection: MapSectionResponse.fromJson(json["map_section"]),
    informationSection: InformationSectionResponse.fromJson(json["information_section"]),
    relatedSection: RelatedSectionResponse.fromJson(json["related_section"]),
    checkInDayUse: json["check_in_day_use"],
    checkOutDayUse: json["check_out_day_use"],
    checkInNightUse: json["check_in_night_use"],
    checkOutNightUse: json["check_out_night_use"],
    checkInOvernightUse: json["check_in_overnight_use"],
    checkOutOvernightUse: json["check_out_overnight_use"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "owner": owner,

    "over_night_use": overNightUse,
    "day_use": dayUse,
    "night_use": nightUse,
    "date": date,
    "title": title,
    "description": description,
    "featured_image": featuredImage,
    "images": List<dynamic>.from(images!.map((x) => x)),
    "address": address,
    "rating": rating,
    "comments_count": commentsCount,
    "property_type": propertyType,
    "features": List<dynamic>.from(features!.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
    "description_section": descriptionSection?.toJson(),
    "map_section": mapSection?.toJson(),
    "information_section": informationSection?.toJson(),
    "related_section": relatedSection?.toJson(),
    "check_in_day_use": checkInDayUse,
    "check_out_day_use": checkOutDayUse,
    "check_in_night_use": checkInNightUse,
    "check_out_night_use": checkOutNightUse,
    "check_in_overnight_use": checkInOvernightUse,
    "check_out_overnight_use": checkOutOvernightUse,
  };
}

class DescriptionSectionResponse {
  DescriptionSectionResponse({
    this.title,
    this.subtitle,
    this.description,
  });

  String? title;
  String? subtitle;
  String? description;

  factory DescriptionSectionResponse.fromJson(Map<String, dynamic> json) => DescriptionSectionResponse(
    title: json["title"],
    subtitle: json["subtitle"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subtitle": subtitle,
    "description": description,
  };
}

class FeatureResponse {
  FeatureResponse({
    this.id,
    this.description,
    this.isActive,
    this.image,
  });

  int ?id;
  String? description;
  bool? isActive;
  String? image;

  factory FeatureResponse.fromJson(Map<String, dynamic> json) => FeatureResponse(
    id: json["id"],
    description: json["description"],
    isActive: json["is_active"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "is_active": isActive,
    "image": image,
  };
}

class InformationSectionResponse {
  InformationSectionResponse({
    this.title,
    this.subtitle,
    this.subSections,
  });

  String ?title;
  String ?subtitle;
  List<SubSectionResponse>? subSections;

  factory InformationSectionResponse.fromJson(Map<String, dynamic> json) => InformationSectionResponse(
    title: json["title"],
    subtitle: json["subtitle"],
    subSections: List<SubSectionResponse>.from(json["sub_sections"].map((x) => SubSectionResponse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subtitle": subtitle,
    "sub_sections": List<dynamic>.from(subSections!.map((x) => x.toJson())),
  };
}

class SubSectionResponse {
  SubSectionResponse({
    this.subSectionTitle,
    this.subSectionRows,
  });

  String? subSectionTitle;
  List<SubSectionRowResponse>? subSectionRows;

  factory SubSectionResponse.fromJson(Map<String, dynamic> json) => SubSectionResponse(
    subSectionTitle: json["sub_section_title"],
    subSectionRows: List<SubSectionRowResponse>.from(json["sub_section_rows"].map((x) => SubSectionRowResponse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "sub_section_title": subSectionTitle,
    "sub_section_rows": List<dynamic>.from(subSectionRows!.map((x) => x.toJson())),
  };
}

class SubSectionRowResponse {
  SubSectionRowResponse({
    this.title,
    this.value,
  });

  String? title;
  String? value;

  factory SubSectionRowResponse.fromJson(Map<String, dynamic> json) => SubSectionRowResponse(
    title: json["title"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "value": value,
  };
}

class MapSectionResponse {
  MapSectionResponse({
    this.title,
    this.subtitle,
    this.address,
    this.longitude,
    this.latitude,
    this.url,
  });

  String? title;
  String? subtitle;
  String? address;
  double? longitude;
  double? latitude;
  String? url;

  factory MapSectionResponse.fromJson(Map<String, dynamic> json) => MapSectionResponse(
    title: json["title"],
    subtitle: json["subtitle"],
    address: json["address"],
    longitude: json["longitude"].toDouble(),
    latitude: json["latitude"].toDouble(),
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subtitle": subtitle,
    "address": address,
    "longitude": longitude,
    "latitude": latitude,
    "url": url,
  };
}

class RelatedSectionResponse {
  RelatedSectionResponse({
    this.title,
    this.subtitle,
    this.relatedProperties,
  });

  String? title;
  String? subtitle;
  List<RelatedPropertyResponse>? relatedProperties;

  factory RelatedSectionResponse.fromJson(Map<String, dynamic> json) => RelatedSectionResponse(
    title: json["title"],
    subtitle: json["subtitle"],
    relatedProperties: List<RelatedPropertyResponse>.from(json["related_properties"].map((x) => RelatedPropertyResponse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subtitle": subtitle,
    "related_properties": List<dynamic>.from(relatedProperties!.map((x) => x.toJson())),
  };
}

class RelatedPropertyResponse {
  RelatedPropertyResponse({
    this.id,
    this.title,
    this.type,
    this.price,
    this.rating,
    this.reviews,
    this.featuredImage,
    this.isSaved,
  });

  int? id;
  String? title;
  String? type;
  String? price;
  int? rating;
  int? reviews;
  String? featuredImage;
  int? isSaved;

  factory RelatedPropertyResponse.fromJson(Map<String, dynamic> json) => RelatedPropertyResponse(
    id: json["id"],
    title: json["title"],
    type: json["type"],
    price: json["price"],
    rating: json["rating"],
    reviews: json["reviews"],
    featuredImage: json["featured_image"],
    isSaved: json["is_saved"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "type": type,
    "price": price,
    "rating": rating,
    "reviews": reviews,
    "featured_image": featuredImage,
    "is_saved": isSaved,
  };
}

class UnavailableDateResponse {
  UnavailableDateResponse({
    this.from,
    this.to,
  });

  DateTime? from;
  DateTime? to;

  factory UnavailableDateResponse.fromJson(Map<String, dynamic> json) => UnavailableDateResponse(
    from: DateTime.parse(json["from"]),
    to: DateTime.parse(json["to"]),
  );


}
