with
    dim_conta as(
        select*
        from {{ ref('intermediate_fontes__conta_completa') }}
    )
select*
from dim_conta