with
fonte_transacoes as (
    select 
        cast(cod_transacao as int) as pk_cod_transacao 
        , cast(num_conta as int) as fk_num_conta
        , cast(data_transacao as date) as data_transacao
        , extract(quarter from cast(data_transacao as date)) as trimestre
        , cast(nome_transacao as string) as nome_transacao
        , cast(valor_transacao as numeric) as valor_transacao
        , abs(cast(valor_transacao as numeric)) as valor_transacao_sem_sinal
        , format_date('%B', cast(data_transacao as date)) as nome_mes
        , case
            when lower(format_date('%B', cast(data_transacao as date))) like '%r%' then true
            else false
        end as mes_com_r

    from {{ source("fontes", "transacoes") }}
    )

select *
from fonte_transacoes