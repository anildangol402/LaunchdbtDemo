{{ config(materialized='incremental',transient=false,unique_key='SourceOrderId') }}
with SourceOrder as (
    select * from {{ref('StgCustomerOrder')}}
)

select md5(SourceOrderId) as OrderId,SourceOrderId,OrderDate from SourceOrder

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where OrderDate > (select DateAdd(d,-5,max(OrderDate)) from {{ this }})

{% endif %}



