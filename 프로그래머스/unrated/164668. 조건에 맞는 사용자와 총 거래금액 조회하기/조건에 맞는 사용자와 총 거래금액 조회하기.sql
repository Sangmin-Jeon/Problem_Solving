-- 코드를 입력하세요
SELECT T2.USER_ID, T2.NICKNAME, SUM(T1.PRICE) AS TOTAL_SALES
FROM USED_GOODS_BOARD T1
JOIN USED_GOODS_USER T2 ON T1.WRITER_ID = T2.USER_ID
WHERE T1.STATUS = 'DONE'
GROUP BY T1.WRITER_ID
HAVING SUM(T1.PRICE) >= 700000
ORDER BY TOTAL_SALES