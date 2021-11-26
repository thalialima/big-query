SELECT gender, numtrips[OFFSET(0)] AS frist_element FROM UNNEST ([
    STRUCT('MALE' AS gender, [930662, 3955871] AS numtrips),
    STRUCT('FEMALE' AS gender, [3267375, 1260893] AS numtrips)
]);
