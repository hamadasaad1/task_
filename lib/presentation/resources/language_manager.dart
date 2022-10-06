


enum LanguageType { ENGLISH, ARABIC }

const String ENGLISH = 'en';
const String ARABIC = 'en';

extension LanguageTypeExtension on LanguageType {
  String getLanguageType() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.ARABIC:
        return ARABIC;
    }
  }
}


