{{ config(transient=false) }}
select distinct md5(SHIPPINGADDRESS) as AddressId,SHIPPINGADDRESS  as Address from {{ref('StgCustomerOrder')}}