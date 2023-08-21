SELECT 
--from raw orders
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
ordersellingprice - ordercostprice as orderprofit,
ordersellingprice,
ordercostprice,
--from raw customer
c.customerid,
c.customername,
c.segment,
c.country,
--from raw product
p.productid,
p.category,
p.productname,
p.subcategory
FROM {{ ref('raw_orders') }} as o 
LEFT JOIN {{ ref('raw_customer') }} as c
ON o.customerid = c.customerid
LEFT JOIN {{ ref('raw_product') }} as p
ON o.productid = p.productid