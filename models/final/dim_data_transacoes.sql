with
    dim_data_transacoes as(
        select*
        from {{ ref('intermediate_fontes__transacoes_reformuladas') }}
    )
select*
from dim_data_transacoes