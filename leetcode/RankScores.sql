select score, DENSE_RANK() OVER(ORDER BY SCORE DESC) AS Rank FROM SCORES;