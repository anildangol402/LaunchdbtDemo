 
{{ config(alias='CusotmerOrder') }}
with Source as (
    select * from {{source('CustomerSalesRaw','CustomerOrder')}}
    
)

SELECT 

ORDERID as SourceOrderId,
CUSTOMERID as SourceCustomerId,
ORDERDATE,
TOTALAMOUNT,
SHIPPINGADDRESS
FROM Source