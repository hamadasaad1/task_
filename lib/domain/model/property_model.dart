


class DescriptionSection {
  DescriptionSection({
    required this.title,
    required this.subtitle,
    required this.description,
  });

  String title;
  String subtitle;
  String description;
}

class Feature {
  Feature({
    required this.id,
    required this.description,
    required this.isActive,
    required this.image,
  });

  int id;
  String description;
  bool isActive;
  String image;
}

class InformationSection {
  InformationSection({
    required this.title,
    required this.subtitle,
    required this.subSections,
  });

  String title;
  String subtitle;
  List<SubSection> subSections;
}

class SubSection {
  SubSection({
    required this.subSectionTitle,
    required this.subSectionRows,
  });

  String? subSectionTitle;
  List<SubSectionRow> subSectionRows;
}

class SubSectionRow {
  SubSectionRow({
    required this.title,
    required this.value,
  });

  String title;
  String value;
}

class MapSection {
  MapSection({
    required this.title,
    required this.subtitle,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.url,
  });

  String title;
  String subtitle;
  String address;
  double longitude;
  double latitude;
  String url;
}

class RelatedSection {
  RelatedSection({
    required this.title,
    required this.subtitle,
    required this.relatedProperties,
  });

  String title;
  String subtitle;
  List<RelatedProperty> relatedProperties;
}

class RelatedProperty {
  RelatedProperty({
    required this.id,
    required this.title,
    required this.type,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.featuredImage,
    required this.isSaved,
  });

  int id;
  String title;
  String type;
  String price;
  int rating;
  int reviews;
  String featuredImage;
  int isSaved;
}

class UnavailableDate {
  UnavailableDate({
    required this.from,
    required this.to,
  });

  String from;
  String to;
}

class PropertyData {
  PropertyData({
    required this.id,
    required this.owner,
    required this.unavailableDates,
    required this.overNightUse,
    required this.dayUse,
    required this.nightUse,
    required this.date,
    required this.title,
    required this.description,
    required this.featuredImage,
    required this.images,
    required this.address,
    required this.rating,
    required this.commentsCount,
    required this.propertyType,
    required this.features,
    required this.descriptionSection,
    required this.mapSection,
    required this.informationSection,
    required this.relatedSection,
    required this.checkInDayUse,
    required this.checkOutDayUse,
    required this.checkInNightUse,
    required this.checkOutNightUse,
    required this.checkInOvernightUse,
    required this.checkOutOvernightUse,
  });

  int id;
  String owner;
  List<UnavailableDate> unavailableDates;
  bool overNightUse;
  bool dayUse;
  bool nightUse;
  String date;
  String title;
  String description;
  String featuredImage;
  List<dynamic> images;
  String address;
  int rating;
  int commentsCount;
  String propertyType;
  List<List<Feature>> features;
  DescriptionSection descriptionSection;
  MapSection mapSection;
  InformationSection informationSection;
  RelatedSection relatedSection;
  String checkInDayUse;
  String checkOutDayUse;
  String checkInNightUse;
  String checkOutNightUse;
  String checkInOvernightUse;
  String checkOutOvernightUse;
}
