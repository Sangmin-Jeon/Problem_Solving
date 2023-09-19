-- 코드를 입력하세요
SELECT T1.NAME, T1.DATETIME
FROM ANIMAL_INS T1
LEFT JOIN ANIMAL_OUTS T2 ON T1.ANIMAL_ID = T2.ANIMAL_ID
WHERE T2.ANIMAL_ID IS NULL
Order by T1.DATETIME
LIMIT 3