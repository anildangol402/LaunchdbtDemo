 
{{ config(alias='Customer') }}
with Source as (
    select * from {{source('CustomerSalesRaw','Customer')}}
    
)

SELECT 

CUSTOMERID as SourceCustomerId,
FIRSTNAME,
LASTNAME,
EMAIL,
PHONE,
ADDRESS
FROM Source