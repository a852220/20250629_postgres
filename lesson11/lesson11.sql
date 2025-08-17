SELECT t."stationCode" AS 車站代碼, 
       t."name" AS 站名, 
       d."日期", 
       d."進站人數", 
       d."出站人數" 
       FROM "台鐵車站資訊" t JOIN "每日各站進出站人數" d ON d."車站代碼" = t."stationCode" 
       WHERE t."name" = '基隆' AND d."日期" = DATE '2023-01-01';

WITH want AS (
  VALUES ('基隆', 1), ('臺北', 2), ('桃園', 3)
) AS v(name, ord)
SELECT
  v.ord,
  t."stationCode",
  t."name",
  d."日期",
  d."進站人數",
  d."出站人數"
FROM want v
LEFT JOIN "台鐵車站資訊" t ON t."name" = v.name
LEFT JOIN "每日各站進出站人數" d ON d."車站代碼" = t."stationCode" AND d."日期" = DATE '2023-01-01'
ORDER BY v.ord;


SELECT
  t."stationCode" AS 車站代碼,
  t."name" AS 站名,
  d."日期",
  d."進站人數",
  d."出站人數"
FROM "台鐵車站資訊" t
JOIN "每日各站進出站人數" d ON d."車站代碼" = t."stationCode"
WHERE t."name" IN ('基隆', '臺北', '桃園')
  AND d."日期" = DATE '2023-01-01'
ORDER BY t."name";

-- SQL（使用參數 $1 = text[]、$2 = date）
SELECT
  t."stationCode",
  t."name",
  d."日期",
  d."進站人數",
  d."出站人數"
FROM "台鐵車站資訊" t
JOIN "每日各站進出站人數" d ON d."車站代碼" = t."stationCode"
WHERE t."name" = ANY($1::text[])
  AND d."日期" = $2::date
ORDER BY t."name";

-- psql 範例（直接執行）
SELECT * FROM (
  SELECT t."stationCode", t."name", d."日期", d."進站人數", d."出站人數"
  FROM "台鐵車站資訊" t
  JOIN "每日各站進出站人數" d ON d."車站代碼" = t."stationCode"
  WHERE t."name" = ANY(ARRAY['基隆','臺北']::text[])
    AND d."日期" = DATE '2023-01-01'
) s ORDER BY s."name";


WITH want AS (
  VALUES ('基隆', 1), ('臺北', 2), ('桃園', 3)
) AS v(name, ord)
SELECT
  v.ord,
  t."stationCode",
  t."name",
  d."日期",
  d."進站人數",
  d."出站人數"
FROM want v
LEFT JOIN "台鐵車站資訊" t ON t."name" = v.name
LEFT JOIN "每日各站進出站人數" d ON d."車站代碼" = t."stationCode" AND d."日期" = DATE '2023-01-01'
ORDER BY v.ord;


SELECT t."stationCode" AS 車站代碼, 
       t."name" AS 站名, 
       d."日期", 
       d."進站人數", 
       d."出站人數" FROM "台鐵車站資訊" t JOIN "每日各站進出站人數" 
       d ON d."車站代碼" = t."stationCode" WHERE t."name" IN ('基隆','臺北','桃園')
         AND d."日期" = DATE '2023-01-01' ORDER BY t."name";

SELECT t."stationCode", 
       t."name", 
       d."日期", 
       d."進站人數", 
       d."出站人數" FROM "台鐵車站資訊" t JOIN "每日各站進出站人數" 
          d ON d."車站代碼" = t."stationCode" WHERE 
          t."name" = ANY($1::text[]) AND d."日期" = $2::date ORDER BY t."name";