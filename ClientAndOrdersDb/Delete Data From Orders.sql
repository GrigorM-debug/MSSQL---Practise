USE ClientsAndOrdersDb

DELETE FROM Orders
WHERE YEAR(OrderDate) < '2020' AND Amount < 50.00