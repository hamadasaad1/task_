import 'package:task/app/extensions.dart';
import 'package:task/data/responses/property.dart';

import '../../app/constants.dart';
import '../../domain/model/property_model.dart';

extension DescriptionSectionResponseMapper on DescriptionSectionResponse? {
  DescriptionSection toDomain() {
    return DescriptionSection(
        title: this?.title.orEmpty() ?? Constants.empty,
        subtitle: this?.subtitle.orEmpty() ?? Constants.empty,
        description: this?.description.orEmpty() ?? Constants.empty);
  }
}

extension FeatureResponseResponseMapper on FeatureResponse? {
  Feature toDomain() {
    return Feature(
        id: this?.id.orZero() ?? Constants.zero,
        isActive: this?.isActive.orBool() ?? Constants.isEmpty,
        description: this?.description.orEmpty() ?? Constants.empty,
        image: this?.image.orEmpty() ?? Constants.empty);
  }
}

extension InformationSectionResponseMapper on InformationSectionResponse? {
  InformationSection toDomain() {
    return InformationSection(
        subSections:
            (this?.subSections?.map((subSections) => subSections.toDomain()) ??
                    const Iterable.empty())
                .cast<SubSection>()
                .toList(),
        subtitle: this?.subtitle.orEmpty() ?? Constants.empty,
        title: this?.title.orEmpty() ?? Constants.empty);
  }
}

extension SubSectionResponseMapper on SubSectionResponse? {
  SubSection toDomain() {
    return SubSection(
      subSectionTitle: this?.subSectionTitle.orEmpty() ?? Constants.empty,
      subSectionRows:
          (this?.subSectionRows?.map((subSections) => subSections.toDomain()) ??
                  const Iterable.empty())
              .cast<SubSectionRow>()
              .toList(),
    );
  }
}

extension SubSectionRowResponseMapper on SubSectionRowResponse? {
  SubSectionRow toDomain() {
    return SubSectionRow(
      title: this?.title.orEmpty() ?? Constants.empty,
      value: this?.value.orEmpty() ?? Constants.empty,
    );
  }
}

extension UnavailableDateResponseMapper on UnavailableDateResponse? {
  UnavailableDate toDomain() {
    return UnavailableDate(
      from: this?.from?.toString().orEmpty() ?? Constants.empty,
      to: this?.to?.toString().orEmpty() ?? Constants.empty,
    );
  }
}

extension MapSectionResponseMapper on MapSectionResponse? {
  MapSection toDomain() {
    return MapSection(
      title: this?.title.orEmpty() ?? Constants.empty,
      address: this?.address.orEmpty() ?? Constants.empty,
      url: this?.url.orEmpty() ?? Constants.empty,
      subtitle: this?.subtitle.orEmpty() ?? Constants.empty,
      latitude: this?.latitude.orZero() ?? Constants.zeroDec,
      longitude: this?.longitude.orZero() ?? Constants.zeroDec,
    );
  }
}

extension RelatedSectionResponseMapper on RelatedSectionResponse? {
  RelatedSection toDomain() {
    return RelatedSection(
      title: this?.title.orEmpty() ?? Constants.empty,
      relatedProperties: (this
                  ?.relatedProperties
                  ?.map((relatedProperties) => relatedProperties.toDomain()) ??
              const Iterable.empty())
          .cast<RelatedProperty>()
          .toList(),
      subtitle: this?.subtitle.orEmpty() ?? Constants.empty,
    );
  }
}

extension RelatedPropertyResponseMapper on RelatedPropertyResponse? {
  RelatedProperty toDomain() {
    return RelatedProperty(
      id: this?.id.orZero() ?? Constants.zero,
      isSaved: this?.isSaved.orZero() ?? Constants.zero,
      rating: this?.rating.orZero() ?? Constants.zero,
      reviews: this?.reviews.orZero() ?? Constants.zero,
      title: this?.title.orEmpty() ?? Constants.empty,
      price: this?.price.orEmpty() ?? Constants.empty,
      type: this?.type.orEmpty() ?? Constants.empty,
      featuredImage: this?.featuredImage.orEmpty() ?? Constants.empty,
    );
  }
}

extension PropertyResponseMapper on PropertyResponse? {
  PropertyData toDomain() {
    List<List<Feature>> features = [];
    List<List<FeatureResponse>>? featureResponseFromApi = this?.features;
    
    
    if(featureResponseFromApi !=null){
  for (int i = 0; i < featureResponseFromApi.length; i++) {
      List<FeatureResponse>? featureResponseList = this?.features?[i];

if (featureResponseList != null) {
List<Feature> featureToDomain =
          (featureResponseList
                .map((relatedProperties) => relatedProperties.toDomain()))
              .cast<Feature>()
              .toList();
        features.add(featureToDomain);
}
      
      }
    }




  

    return PropertyData(
      id: this?.id.orZero() ?? Constants.zero,
      owner: this?.owner.orEmpty() ?? Constants.empty,
      unavailableDates: (this
                  ?.unavailableDates
                  ?.map((relatedProperties) => relatedProperties.toDomain()) ??
              const Iterable.empty())
          .cast<UnavailableDate>()
          .toList(),
      overNightUse: this?.overNightUse.orBool() ?? Constants.isEmpty,
      dayUse: this?.dayUse.orBool() ?? Constants.isEmpty,
      nightUse: this?.nightUse.orBool() ?? Constants.isEmpty,
      date: this?.date.orEmpty() ?? Constants.empty,
      title: this?.title.orEmpty() ?? Constants.empty,
      description: this?.description.orEmpty() ?? Constants.empty,
      featuredImage: this?.featuredImage.orEmpty() ?? Constants.empty,
      images: [],
      address: this?.address.orEmpty() ?? Constants.empty,
      rating: this?.rating.orZero() ?? Constants.zero,
      commentsCount: this?.commentsCount.orZero() ?? Constants.zero,
      propertyType: this?.propertyType.orEmpty() ?? Constants.empty,
      features: features,
      descriptionSection: this!.descriptionSection.toDomain(),
      mapSection: this!.mapSection.toDomain(),
      informationSection: this!.informationSection.toDomain(),
      relatedSection: this!.relatedSection.toDomain(),
      checkInDayUse: this?.checkInDayUse.orEmpty() ?? Constants.empty,
      checkOutDayUse: this?.checkOutDayUse.orEmpty() ?? Constants.empty,
      checkInNightUse: this?.checkInNightUse.orEmpty() ?? Constants.empty,
      checkOutNightUse: this?.checkOutNightUse.orEmpty() ?? Constants.empty,
      checkInOvernightUse:
          this?.checkInOvernightUse.orEmpty() ?? Constants.empty,
      checkOutOvernightUse:
          this?.checkOutOvernightUse.orEmpty() ?? Constants.empty,
    );
  }
}
