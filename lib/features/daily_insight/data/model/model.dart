class DailyInsight {
  PestAndDiseaseAlerts? pestAndDiseaseAlerts;
  Weather? weather;
  CropInformation? cropInformation;
  Analytics? analytics;
  Schedule? schedule;

  DailyInsight(
      {this.pestAndDiseaseAlerts,
      this.weather,
      this.cropInformation,
      this.analytics,
      this.schedule});

  DailyInsight.fromJson(Map<String, dynamic> json) {
    pestAndDiseaseAlerts = json['PestAndDiseaseAlerts'] != null
        ? PestAndDiseaseAlerts.fromJson(json['PestAndDiseaseAlerts'])
        : null;
    weather =
        json['Weather'] != null ? Weather.fromJson(json['Weather']) : null;
    cropInformation = json['CropInformation'] != null
        ? CropInformation.fromJson(json['CropInformation'])
        : null;
    analytics = json['Analytics'] != null
        ? Analytics.fromJson(json['Analytics'])
        : null;
    schedule =
        json['Schedule'] != null ? Schedule.fromJson(json['Schedule']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.pestAndDiseaseAlerts != null) {
      data['PestAndDiseaseAlerts'] = this.pestAndDiseaseAlerts!.toJson();
    }
    if (this.weather != null) {
      data['Weather'] = this.weather!.toJson();
    }
    if (this.cropInformation != null) {
      data['CropInformation'] = this.cropInformation!.toJson();
    }
    if (this.analytics != null) {
      data['Analytics'] = this.analytics!.toJson();
    }
    if (this.schedule != null) {
      data['Schedule'] = this.schedule!.toJson();
    }
    return data;
  }
}

class PestAndDiseaseAlerts {
  List<String>? alerts;

  PestAndDiseaseAlerts({this.alerts});

  PestAndDiseaseAlerts.fromJson(Map<String, dynamic> json) {
    alerts = json['Alerts'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Alerts'] = this.alerts;
    return data;
  }
}

class Weather {
  CurrentWeather? currentWeather;
  Forecast? forecast;

  Weather({this.currentWeather, this.forecast});

  Weather.fromJson(Map<String, dynamic> json) {
    currentWeather = json['CurrentWeather'] != null
        ? CurrentWeather.fromJson(json['CurrentWeather'])
        : null;
    forecast =
        json['Forecast'] != null ? Forecast.fromJson(json['Forecast']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.currentWeather != null) {
      data['CurrentWeather'] = this.currentWeather!.toJson();
    }
    if (this.forecast != null) {
      data['Forecast'] = this.forecast!.toJson();
    }
    return data;
  }
}

class CurrentWeather {
  int? temperature;
  String? conditions;
  String? icon;

  CurrentWeather({this.temperature, this.conditions, this.icon});

  CurrentWeather.fromJson(Map<String, dynamic> json) {
    temperature = json['Temperature'];
    conditions = json['Conditions'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Temperature'] = this.temperature;
    data['Conditions'] = this.conditions;
    data['icon'] = this.icon;
    return data;
  }
}

class Forecast {
  int? humidity;
  double? wind;

  Forecast({this.humidity, this.wind});

  Forecast.fromJson(Map<String, dynamic> json) {
    humidity = json['Humidity'];
    wind = json['Wind'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Humidity'] = this.humidity;
    data['Wind'] = this.wind;
    return data;
  }
}

class CropInformation {
  String? cropDemand;
  String? cropPrice;
  String? estimatedTransportationCost;

  CropInformation(
      {this.cropDemand, this.cropPrice, this.estimatedTransportationCost});

  CropInformation.fromJson(Map<String, dynamic> json) {
    cropDemand = json['CropDemand'];
    cropPrice = json['CropPrice'];
    estimatedTransportationCost = json['EstimatedTransportationCost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['CropDemand'] = this.cropDemand;
    data['CropPrice'] = this.cropPrice;
    data['EstimatedTransportationCost'] = this.estimatedTransportationCost;
    return data;
  }
}

class Analytics {
  List<String>? currentCrops;
  String? estimatedCropOutput;
  CropGrowthProgress? cropGrowthProgress;
  CropGrowthProgress? estimatedYield;
  CropGrowthProgress? cropRevenue;
  String? waterSourceLevel;

  Analytics(
      {this.currentCrops,
      this.estimatedCropOutput,
      this.cropGrowthProgress,
      this.estimatedYield,
      this.cropRevenue,
      this.waterSourceLevel});

  Analytics.fromJson(Map<String, dynamic> json) {
    currentCrops = json['CurrentCrops'].cast<String>();
    estimatedCropOutput = json['EstimatedCropOutput'];
    cropGrowthProgress = json['CropGrowthProgress'] != null
        ? CropGrowthProgress.fromJson(json['CropGrowthProgress'])
        : null;
    estimatedYield = json['EstimatedYield'] != null
        ? CropGrowthProgress.fromJson(json['EstimatedYield'])
        : null;
    cropRevenue = json['CropRevenue'] != null
        ? CropGrowthProgress.fromJson(json['CropRevenue'])
        : null;
    waterSourceLevel = json['WaterSourceLevel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['CurrentCrops'] = this.currentCrops;
    data['EstimatedCropOutput'] = this.estimatedCropOutput;
    if (this.cropGrowthProgress != null) {
      data['CropGrowthProgress'] = this.cropGrowthProgress!.toJson();
    }
    if (this.estimatedYield != null) {
      data['EstimatedYield'] = this.estimatedYield!.toJson();
    }
    if (this.cropRevenue != null) {
      data['CropRevenue'] = this.cropRevenue!.toJson();
    }
    data['WaterSourceLevel'] = this.waterSourceLevel;
    return data;
  }
}

class CropGrowthProgress {
  String? corn;
  String? soybeans;
  String? wheat;

  CropGrowthProgress({this.corn, this.soybeans, this.wheat});

  CropGrowthProgress.fromJson(Map<String, dynamic> json) {
    corn = json['Corn'];
    soybeans = json['Soybeans'];
    wheat = json['Wheat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Corn'] = this.corn;
    data['Soybeans'] = this.soybeans;
    data['Wheat'] = this.wheat;
    return data;
  }
}

class Schedule {
  String? plantingSchedule;
  String? harvestingSchedule;
  String? irrigationSchedule;
  String? fertilizationSchedule;
  String? cropRotationSchedule;

  Schedule(
      {this.plantingSchedule,
      this.harvestingSchedule,
      this.irrigationSchedule,
      this.fertilizationSchedule,
      this.cropRotationSchedule});

  Schedule.fromJson(Map<String, dynamic> json) {
    plantingSchedule = json['PlantingSchedule'];
    harvestingSchedule = json['HarvestingSchedule'];
    irrigationSchedule = json['IrrigationSchedule'];
    fertilizationSchedule = json['FertilizationSchedule'];
    cropRotationSchedule = json['CropRotationSchedule'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['PlantingSchedule'] = this.plantingSchedule;
    data['HarvestingSchedule'] = this.harvestingSchedule;
    data['IrrigationSchedule'] = this.irrigationSchedule;
    data['FertilizationSchedule'] = this.fertilizationSchedule;
    data['CropRotationSchedule'] = this.cropRotationSchedule;
    return data;
  }
}
