-- ============================================
-- WEEK 1 SQL NOTES
-- Học bằng: PostgreSQL + pgAdmin
-- ============================================

-- ── 1. SELECT CƠ BẢN ────────────────────────
SELECT name, age
FROM employees;

-- Lấy tất cả cột
SELECT * FROM employees;

-- ── 2. WHERE — LỌC DỮ LIỆU ─────────────────
SELECT * FROM employees
WHERE age > 25;

-- Nhiều điều kiện
SELECT * FROM employees
WHERE age > 25 AND department = 'IT';

-- ── 3. ORDER BY — SẮP XẾP ──────────────────
SELECT * FROM employees
ORDER BY salary DESC;   -- DESC: cao → thấp
                        -- ASC:  thấp → cao (mặc định)

-- ── 4. LIMIT — GIỚI HẠN SỐ DÒNG ────────────
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 10;   -- lấy top 10 lương cao nhất

-- ── 5. GROUP BY + AGGREGATE ─────────────────
SELECT department,
       COUNT(*)        AS so_nhan_vien,
       AVG(salary)     AS luong_tb,
       MAX(salary)     AS luong_cao_nhat
FROM employees
GROUP BY department;

-- ── 6. HAVING — LỌC SAU GROUP BY ───────────
-- (Khác WHERE: WHERE lọc trước khi group, HAVING lọc sau)
SELECT department, COUNT(*) AS so_nv
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;

-- ── 7. JOIN ─────────────────────────────────
-- INNER JOIN: chỉ lấy dòng khớp cả 2 bảng
SELECT e.name, d.department_name
FROM employees e
INNER JOIN departments d ON e.dept_id = d.id;

-- LEFT JOIN: lấy tất cả bên trái, bên phải NULL nếu không khớp
SELECT e.name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.id;

-- ── 8. SUBQUERY ─────────────────────────────
-- Tìm nhân viên có lương cao hơn lương trung bình
SELECT name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
