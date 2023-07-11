{{ config(materialized='incremental',transient=false,unique_key='SourceOrderId') }}
with DimOrder as (
    select * from {{ref('DimOrder')}}
),
DimAddress as 
(
 select * from {{ref('DimAddress')}}   
),
DimCustomer AS
(
    select * from {{ref('DimCustomer')}}
)

select 
A.AddressId,
C.CustomerId,
O.OrderId,
CO.TOTALAMOUNT
From {{ ref('StgCustomerOrder')}} CO
join DimAddress A
on CO.ShippingAddress=A.Address
join DimCustomer C
on CO.SourceCustomerId=C.SourceCustomerId
join DimOrder O
on Co.SourceOrderId=O.SourceOrderId
{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where OrderDate > (select DateAdd(d,-5,max(OrderDate)) from {{ this }})

{% endif %}


