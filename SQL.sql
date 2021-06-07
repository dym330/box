練習問題　基礎問題１
1 o
SELECT 口座番号, 名義, 種別, 残高, 更新日
  FROM 口座

2 o
SELECT 口座番号
  FROM 口座

3 o
SELECT 口座番号,残高
  FROM 口座

4 o
SELECT *
  FROM 口座

5 o
UPDATE 口座
   SET 名義 = "XXXXX"

6 o
UPDATE 口座
   SET 残高 = 99999999, 更新日 = '2018-03-01'

7 x
INSERT INTO 口座
            (口座番号, 名義, 種別, 残高, 更新日)
      VALUES '0642191', 'アオキ　ハルカ', '1', 3640551, '2018-03-13'
INSERT INTO 口座
            (口座番号, 名義, 種別, 残高, 更新日)
      VALUES '1039410', 'キノシタ　リュウジ', '1', 259017, '2017-11-30'
INSERT INTO 口座
            (口座番号, 名義, 種別, 残高)
      VALUES '1239855', 'タカシナ　ミツル', '2', 6509773

8 o
DELETE FROM 口座

9 o
SELECT *
FROM 口座
WHERE 口座番号 = '0037651'

10 o
SELECT *
FROM 口座
WHERE 残高 > 0

11 o
SELECT *
FROM 口座
WHERE 口座番号 < '1000000'

12 x
SELECT *
FROM 口座
WHERE 更新日 <'2018-01-01'

13 o
SELECT *
FROM 口座
WHERE 残高 >= 1000000

14 x
SELECT *
FROM 口座
WHERE 種別 <> '1'

15 o
SELECT *
FROM 口座
WHERE 更新日 IS NULL

16 o
SELECT *
FROM 口座
WHERE 名義 LIKE '%ハシ%'

17 x
SELECT *
FROM 口座
WHERE 更新日 BETWEEN '2018-01-01' AND '2018-01-31'

18 o
SELECT *
FROM 口座
WHERE 種別 IN ('2', '3')

19 o
SELECT *
FROM 口座
WHERE 名義 IN ('サカタ　リョウヘイ', 'マツモト　ミワコ', 'ハマダ　サトシ')

20 o
SELECT *
FROM 口座
WHERE 更新日 >= '2017-12-30' AND 更新日 <= '2018-01-04'

21 x
SELECT *
FROM 口座
WHERE 残高 < 10000 AND 更新日 IS NOT NULL

22 o
SELECT *
FROM 口座
WHERE 口座番号 >= '2000000' AND 口座番号 < '3000000' OR 名義 LIKE 'エ__　%コ'

23 o
口座テーブル、取引番号、取引事由ID

24 o
SELECT *
FROM 口座
ORDER BY 口座番号

25 o
SELECT DISTINCT 名義
FROM 口座
ORDER BY 名義

26 x
SELECT 口座番号, 名義, 種別, 残高, 更新日
FROM 口座
ORDER BY 4 DESC, 1

27 x
SELECT 更新日
FROM 口座
WHERE 更新日 IS NOT NULL
ORDER BY 更新日
OFFSET 0 ROWS
FETCH NEXT 10 ROWS ONLY

28 o
SELECT 更新日, 残高
FROM 口座
WHERE 残高 NOT IN 0 AND 更新日 IS NOT NULL
ORDER BY 残高, 更新日 DESC
OFFSET 10 ROWS
FETCH NEXT 10 ROWS

29 x
SELECT 口座番号 FROM 口座
UNION
SELECT 口座番号 FROM 廃止口座
ORDER BY 1

30 o
SELECT DISTINCT 名義 FROM 口座
EXCEPT
SELECT 名義 FROM 廃止口座
ORDER BY 1 DESC

31 o
SELECT 名義 FROM 口座
INTERSECT
SELECT 名義 FROM 廃止口座
ORDER BY 1

32 x
SELECT 口座番号, 残高 FROM 口座 WHERE 残高 = 0
UNION
SELECT 口座番号, 解約時残高 FROM 廃止口座 WHERE 解約時残高 > 0
ORDER BY 1

33 o
SELECT 口座番号, 名義, 'o' AS 口座区分 FROM 口座
UNION
SEKECT 口座番号, 名義, 'x' AS 口座区分 FROM 廃止口座
ORDER BY 2

34 x
SELECT 口座番号, 残高 / 1000 AS 千円単位の残高
FROM 口座
WHERE 残高 >= 1000000

35 o
INSERT INTO 口座
(口座番号, 名義, 種別, 残高, 更新日)
VALUES '0652281', 'タカギ　ノブオ', '1', 100000 + 3000, '2018-04-01'

36 x
UPDATE 口座
SET 残高 = (残高 - 3000) * 1.003
WHERE 口座番号 IN ('0652281')

37 o
SELECT 口座番号, 更新日, 更新日 + 180 AS 通帳期限日
FROM 口座
WHERE 更新日 <= '2016-12-31'

38 x
SELECT 口座番号, 'カ）' || 名義 AS 名義
FROM 口座
WHERE 種別 = "3"

39 x
SELECT DISTINCT 種別 AS 種別コード, CASE 種別 WHEN '1' THEN 普通 WHEN '2' THEN '当座' WHEN '3' THEN '別段' END AS 種別名
FROM 口座

40 x
SELECT 口座番号, 名義, CASE WHEN 残高 < 100000 THEN 'c' 
                          WHEN 残高 >= 1000000 AND 残高 < 1000000  THEN 'b' 
                          ELSE 'a' END AS 残高ランク
FROM 口座

41 x
SELECT LENGTH(口座番号), LENGTH(REPLACE(名義, '　', '')), LENGTH(CAST(残高 AS VARCHAR))
FROM 口座

42 o
SELECT *
FROM 口座
WHERE SUBSTRING(名義, 1, 5) LIKE '%カワ%'

43 x
SELECT *
FROM 口座
WHERE LENGTH(CAST(残高 AS VARCHAR)) >= 4 AND 
      SUBSTRING(CAST(名義 AS VARCHAR), LENGTH(CAST(残高 AS VARCHAR)) - 2, 3) = '000'

44 o
SELECT 口座番号, 残高, TRUNC(残高 * 0.0002, 0) AS 利息
FROM 口座
ORDER BY 残高 DESC

45 o
SELECT 口座番号, 残高, CASE WHEN 残高 < 500000 THEN TRUNK(残高 * 0.0001, 0)
                          WHEN 残高 >= 500000 AND 残高 < 2000000 THEN TRUNK(残高 * 0.0002, 0)
                          WHEN 残高 >= 2000000 THEN TRUNK(残高 * 0.0003, 0) END AS 残高別利息
FROM 口座
ORDER BY 残高別利息 DESC, 口座番号

46 x
INSERT INTO 口座
(口座番号, 名義, 種別, 残高, 更新日)
VALUES ('0351262', 'イトカワ　ダイ', '2', 635110, CURRENT_DATE)

47 x
SELECT 口座番号, 名義, 種別, 残高, SUBSTRING(CAST(更新日 AS VARCHAR), 1, 4) || '年' ||
                                SUBSTRING(CAST(更新日 AS VARCHAR), 6, 2) || '月' ||
                                SUBSTRING(CAST(更新日 AS VARCHAR), 9, 2) || '日' AS 更新日
FROM 口座
WHERE 更新日 >= '2018-01-01'

48 x
SELECT COALESCE(CAST(更新日 AS VARCHAR), '設定なし') AS 更新日
FROM 口座

