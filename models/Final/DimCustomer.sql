{{ config(transient=false) }}
select md5(SourceCustomerId) as CustomerId,* from {{ref('StgCustomer')}}