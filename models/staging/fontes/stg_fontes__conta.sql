with
fonte_contas as (
    select 
        cast(num_conta as int) as pk_conta
        , cast(cod_cliente as int) as fk_cliente
        , cast(cod_agencia as int) as fk_agencia 
        , cast(cod_colaborador as int) as fk_colaborador
        , cast(tipo_conta as string) as tipo_de_conta
        , cast(data_abertura as DATE) as data_abertura_conta
        , cast(saldo_total as numeric) as saldo_total_conta
        , cast(saldo_disponivel as numeric) as saldo_disponivel_conta
        , cast(data_ultimo_lancamento as DATE) as data_ultimo_lancamento_conta
       
    from {{ source("fontes", "contas") }}
)

select *
from fonte_contas