enum BorderTypes {
  none,
  underlineInput,
  outline,
}

extension BorderTypesExtension on BorderTypes {
  String get value {
    switch (this) {
      case BorderTypes.none:
        return 'none';
      case BorderTypes.underlineInput:
        return 'underlineInput';
      case BorderTypes.outline:
        return 'outline';
    }
  }
}
