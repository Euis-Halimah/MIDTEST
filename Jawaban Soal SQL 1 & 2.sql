CREATE TABLE employee_table (
    employee TEXT NOT NULL,
    salary INTEGER
);

INSERT INTO employee_table (employee, salary) VALUES
('Alice', 11),
('Benn', 43),
('Charles', 33),
('Dorothy', 55),
('Emma', 22),
('Franklin', 33);

SELECT * FROM employee_table;

SELECT DISTINCT salary
FROM employee_table
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

CREATE TABLE item_bought (
    buyer TEXT NOT NULL,
    item TEXT NOT NULL
);

INSERT INTO item_bought (buyer, item) VALUES
('A', 'Asus'),
('B', 'Lenovo'),
('C', 'Lenovo'),
('D', 'Acer'),
('E', 'Acer'),
('F', 'Acer');

SELECT * FROM item_bought;

--The Most Bought--
SELECT item
FROM item_bought
GROUP BY item
ORDER BY COUNT(*) DESC
LIMIT 1;

--The Least Bought--
SELECT item
FROM item_bought
GROUP BY item
ORDER BY COUNT(*) ASC
LIMIT 1;

--the name of items that is neither bought the most, nor bought the least.--
SELECT item
FROM item_bought
GROUP BY item
HAVING COUNT(*) != (
    SELECT COUNT(*)
    FROM item_bought
    GROUP BY item
    ORDER BY COUNT(*) DESC
    LIMIT 1
) AND COUNT(*) != (
    SELECT COUNT(*)
    FROM item_bought
    GROUP BY item
    ORDER BY COUNT(*) ASC
    LIMIT 1
);