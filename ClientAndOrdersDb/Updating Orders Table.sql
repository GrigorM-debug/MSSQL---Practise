USE ClientsAndOrdersDb

UPDATE Orders
SET Amount = Amount * 0.90
WHERE Amount > 200.00 AND YEAR(OrderDate) < '2022' 