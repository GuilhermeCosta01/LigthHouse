with
    dim_data_prop_credito as(
        select*
        from {{ ref('intermediate_fontes__prop_credito') }}
    )
select*
from dim_data_prop_credito