class AnalysisModel {
  SoilData soilData;
  Location location;
  List<HistoricalCropYields>? historicalCropYields;
  PestAndDiseaseData? pestAndDiseaseData;

  AnalysisModel({
    required this.soilData,
    required this.location,
    this.historicalCropYields,
    this.pestAndDiseaseData,
  });

  // Factory constructor for AnalysisModel with default values
  factory AnalysisModel.withDefaults({
    String soilType = "defaultSoilType",
    double pHLevel = 0.0,
    double erosionSusceptibility = 0,
    double longitude = 0,
    double latitude = 0,
    String city = "defaultCity",
  }) {
    return AnalysisModel(
      soilData: SoilData(
        soilType: soilType,
        pHLevel: pHLevel,
        erosionSusceptibility: erosionSusceptibility,
      ),
      location: Location(
        longtude: longitude,
        latitude: latitude,
        city: city,
      ),
    );
  }
}

class SoilData {
  String soilType;
  double pHLevel;
  double erosionSusceptibility;

  SoilData({
    required this.soilType,
    required this.pHLevel,
    required this.erosionSusceptibility,
  });

  // Factory constructor for SoilData with default values
  factory SoilData.withDefaults() {
    return SoilData(
      soilType: "defaultSoilType",
      pHLevel: 0.0,
      erosionSusceptibility: 0,
    );
  }
}

class Location {
  double longtude;
  double latitude;
  String city;

  Location({
    required this.longtude,
    required this.latitude,
    required this.city,
  });

  // Factory constructor for Location with default values
  factory Location.withDefaults() {
    return Location(
      longtude: 0,
      latitude: 0,
      city: "defaultCity",
    );
  }
}

class YieldData {
  int year;
  int yield;

  YieldData({
    required this.year,
    required this.yield,
  });

  // Factory constructor for YieldData with default values
  factory YieldData.withDefaults() {
    return YieldData(
      year: 0,
      yield: 0,
    );
  }
}

class HistoricalCropYields {
  String cropType;
  List<YieldData>? yieldData;

  HistoricalCropYields({
    required this.cropType,
    this.yieldData,
  });

  // Factory constructor for HistoricalCropYields with default values
  factory HistoricalCropYields.withDefaults(String defaultCropType) {
    return HistoricalCropYields(
      cropType: defaultCropType,
    );
  }
}

class PestAndDiseaseData {
  List<String>? commonPests;
  List<String>? commonDiseases;

  PestAndDiseaseData({
    this.commonPests,
    this.commonDiseases,
  });

  // Factory constructor for PestAndDiseaseData with default values
  factory PestAndDiseaseData.withDefaults() {
    return PestAndDiseaseData(
      commonPests: <String>[],
      commonDiseases: <String>[],
    );
  }
}
