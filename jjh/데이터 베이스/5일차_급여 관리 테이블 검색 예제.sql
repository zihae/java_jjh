/* 홍길동 사원의 급여를 확인하는 쿼리문: 기본급 + 호봉년차 * 추가금 */
SELECT (sa_base_salary + sa_add_salary * em_year) AS '홍길동 급여' FROM employee JOIN salary ON em_sa_level= sa_level
WHERE em_num= 2019001;

/* 각 부서별 평균 급여를 출력하는 쿼리를 작성하세요. 단, 직원이 등록된 부서만 */
SELECT em_de_department, AVG(sa_base_salary + sa_add_salary * em_year) AS '평균 급여' FROM employee JOIN salary 
ON em_sa_level = sa_level GROUP BY em_de_department;