curl --location --request POST 'http://localhost:8080/ros/3446/merchant-offers' \
--header 'Authorization: access_token:f7e9195e-bc92-4eea-9197-5cd355786200' \
--header 'Content-Type: application/json' \
--data-raw '{
    "advertiserId": 1,
    "offerIds": [1172, 1211, 540, 560]
}'