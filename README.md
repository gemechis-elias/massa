# What is Massa
Massaa is Amharic word with meaning 'Farm'. Our "AI for Agriculture" app offers a solution by providing personalized insights. Through advanced data analytics, we empower farmers to make well-informed decisions about crop selection, timing, resource management, and more. This bridges the information gap, enhances yields, increases profitability, and promotes sustainable farming practices in the region.

## Screenshot Demo

<div style="display: flex; flex-direction: row;">
  <img src="screenshot/image_1.jpg" alt="Mobile App Screenshot" width="180" />
  <img src="screenshot/image_2.jpg" alt="Mobile App Screenshot" width="180" />
  <img src="screenshot/image_3.jpg" alt="Mobile App Screenshot" width="180" />
  <img src="screenshot/image_4.jpg" alt="Mobile App Screenshot" width="180" />
</div>

 
## Features Added Yet:
- Daily Insight 
- Chat With AI
- Recommendation

## Chating With AI
```json
   {"message":" hi "}
    res: {
    "status": true,
    "message": {
        "text": "Hello! How can I assist you today?"
    }
    }
    error: {
    "status": false,
    "message": "The message field is required."
    }

```

## Request Recommendation & Insight to AI
```json
{
  "SoilData": {
    "SoilType": "loam",
    "pHLevel": 1.5,
    "ErosionSusceptibility": 15
  },
  "location": {
    "longtude": 25,
    "latitude": 10,
    "city":"optional"
  },
  "HistoricalCropYields": [
    {
      "CropType": "Wheat",
      "YieldData": [
        {
          "Year": 2020,
          "Yield": 1200
        },
        {
          "Year": 2019,
          "Yield": 1100
        }
      ]
    },
    {
      "CropType": "Corn",
      "YieldData": [
        {
          "Year": 2020,
          "Yield": 800
        },
        {
          "Year": 2019,
          "Yield": 750
        }
      ]
    }
  ],
  "PestAndDiseaseData": {
    "CommonPests": ["Aphids", "Whiteflies"],
    "CommonDiseases": ["Powdery Mildew", "Rust"]
  }
}
```

## Respose From AI
```json 
{
    "status": true,
    "0": {
        "CropRecommendations": {
            "PossibleCropTypes": [
                {
                    "CropType": "Lettuce",
                    "Yield": "1200 kg/acre"
                },
                {
                    "CropType": "Beans",
                    "Yield": "800 kg/acre"
                },
                {
                    "CropType": "Cabbage",
                    "Yield": "1000 kg/acre"
                }
            ],
            "CropRotationPlan": [
                "Year 1: Lettuce",
                "Year 2: Beans",
                "Year 3: Cabbage"
            ],
            "PlantingAndHarvestingTime": {
                "Lettuce": {
                    "PlantingTime": "Spring or fall, when temperatures range between 45-75°F",
                    "HarvestingTime": "Harvest leaves as needed, typically around 60-70 days after planting"
                },
                "Beans": {
                    "PlantingTime": "Cool weather: Spring for early cabbage, late spring to early summer for mid-season cabbage; Warm weather: Late summer to early fall for late cabbage",
                    "HarvestingTime": "After heads form and reach desired size, typically around 80-180 days after planting depending on variety"
                }
            },
            "FertilizerNeeds": [
                {
                    "CropType": "Lettuce",
                    "Fertilizers": [
                        {
                            "Type": "Nitrogen",
                            "Amount": "100 kg/acre"
                        }
                    ]
                },
                {
                    "CropType": "Beans",
                    "Fertilizers": [
                        {
                            "Type": "Phosphorus",
                            "Amount": "80 kg/acre"
                        },
                        {
                            "Type": "Nitrogen",
                            "Amount": "120 kg/acre"
                        }
                    ]
                },
                {
                    "CropType": "Cabbage",
                    "Fertilizers": [
                        {
                            "Type": "Potassium",
                            "Amount": "60 kg/acre"
                        },
                        {
                            "Type": "Nitrogen",
                            "Amount": "80 kg/acre"
                        }
                    ]
                }
            ],
            "PesticideHerbicideFungicideNeeds": {
                "Pesticides": [
                    "Pesticide A",
                    "Pesticide B"
                ],
                "Herbicides": [
                    "Herbicide X",
                    "Herbicide Y"
                ],
                "Fungicides": [
                    "Fungicide P",
                    "Fungicide Q"
                ]
            },
            "AdditionalWaterNeeds": {
                "Lettuce": "Regular irrigation during dry periods.",
                "Beans": "Moderate water requirement throughout the growing season.",
                "Cabbage": "Tolerant to drought but benefits from regular watering."
            },
            "PossibleDiseasesAndRisks": {
                "CommonDiseases": [
                    "Powdery Mildew",
                    "Rust"
                ],
                "Risks": [
                    "Potential drought in mid-summer",
                    "Susceptibility to aphid infestation"
                ]
            }
        },
        "ToolsNeeded": [
            "Tractors",
            "Plows",
            "Seeders",
            "Irrigation Equipment",
            "Spraying Equipment for Pesticides and Fertilizers"
        ]
    }
}
```