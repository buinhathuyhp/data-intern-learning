# Week 1 — SQL Mistakes & Lessons Learned

## Nhóm 1: Lỗi logic WHERE / NOT IN
- `AND` trong NOT IN: một dòng không thể vừa là 2 giá trị cùng lúc → dùng `NOT IN ('A', 'B')`
- BETWEEN vs > < : "lớn hơn hẳn" → dùng `>`, không dùng BETWEEN

## Nhóm 2: Subquery
- Khi so sánh nội bộ nhóm (alias x, y) → luôn thêm `y.name != x.name`
- Subquery phức tạp trong SELECT → dễ bị "Too many rows"

## Nhóm 3: Hàm tổng hợp
- `COUNT(điều_kiện)` không lọc được → phải dùng WHERE
- `WHERE population = MAX(...)` → lỗi, phải dùng Subquery
- Dùng SUM/COUNT mà không có GROUP BY → lỗi

## Nhóm 4: JOIN
- Cần tên duy nhất → thêm DISTINCT
- INNER JOIN xóa dòng không khớp → dùng LEFT JOIN nếu muốn giữ

## Nhóm 5: Cú pháp
- `TOP 1` là SQL Server → MySQL/PostgreSQL dùng `LIMIT 1`
- Alias: `population/area AS density`, không phải `density AS population/area`
