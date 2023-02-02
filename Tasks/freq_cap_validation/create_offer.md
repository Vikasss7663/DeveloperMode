curl --location --request POST 'http://localhost:8080/offer-campaign' \
--header 'Authorization: access_token:f7e9195e-bc92-4eea-9197-5cd355786200' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name": "aba_offer_campaign_testing_dec_27",
    "roId": 3961,
    "advertiserId": 1,
    "adContentType": "MERCHANT OFFER",
    "leadGenData": null,
    "dailyBudgetCaps": [],
    "budgetAllocationStrategy": "DYNAMIC",
    "budgetAmount": "80",
    "objective": "open-offer",
    "billable": true,
    "revenueHostAttribution": {
        "hostCompany": "PEPL",
        "hostCategory": "Ads"
    },
    "goalType": "CPD",
    "pacingStrategy": {
        "name": "EVEN",
        "accelerationFactor": 1
    },
    "frequencyCap": [
        {
            "type": "DISTRIBUTE",
            "period": "LIFETIME",
            "limit": 1,
            "disableType": false,
            "disablePeriod": false,
            "disableRemove": false
        }
    ],
    "endTimestamp": "2023-01-15T15:59:00.000Z",
    "startTimestamp": "2023-01-01T13:00:00.000Z",
    "offerAdSets": [
        {
            "name": "test_camp_2911_7_cpe",
            "budgetAmount": 80,
            "audience": {
                "includedSegmentGroups": {
                    "operator": "AND",
                    "groups": [
                        {
                            "operator": "OR",
                            "segmentIds": [
                                403,
                                1736,
                                437
                            ],
                            "name": "new_segment"
                        }
                    ]
                },
                "filterSegment": null,
                "includedTargetingAttr": {
                    "city": [],
                    "state": [],
                    "platforms": [],
                    "deviceBrands": [],
                    "deviceAgeRanges": [],
                    "devicePriceRanges": [],
                    "appVersions": []
                }
            },
            "offerPlacements": {
                "offerEvents": [
                    {
                        "appEventId": 8,
                        "appName": "Paytm",
                        "eventName": "Order"
                    },
                    {
                        "appEventId": 10,
                        "appName": "Paytm",
                        "eventName": "PG"
                    },
                    {
                        "appEventId": 7,
                        "appName": "Paytm",
                        "eventName": "UPI"
                    },
                    {
                        "appEventId": 9,
                        "appName": "Paytm",
                        "eventName": "Wallet"
                    },
                    {
                        "appEventId": 4,
                        "appName": "Paytm Mall",
                        "eventName": "Add to Cart"
                    },
                    {
                        "appEventId": 3,
                        "appName": "Paytm Mall",
                        "eventName": "Order Booking"
                    }
                ],
                "offerAdSlots": [
                    {
                        "offerId": "1658",
                        "cost": 5
                    }
                ]
            }
        }
    ],
    "daypartingSchedule": [],
    "selectionStrategyOverride": null,
    "experiment": null
}'