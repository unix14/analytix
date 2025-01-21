
extension MapExtensions on Map<String, dynamic> {

  String getString({bool isInner = false}) {
    String result = "";
    if(entries.isEmpty) {
      return "{}";
    }
    for(MapEntry<String, dynamic> keyValuePair in entries) {
      if(keyValuePair.value is Map<String, dynamic>) {
        result += "\n  -> '${keyValuePair.key}' : ";
        // print inner map
        var innerMapString = (keyValuePair.value as Map<String, dynamic>).getString(isInner: true);
        result += innerMapString;
      } else {
        result += "\n  ${isInner ? "  " : ""}-> '${keyValuePair.key}': '${keyValuePair.value}'";
      }
    }
    return result;
  }
}