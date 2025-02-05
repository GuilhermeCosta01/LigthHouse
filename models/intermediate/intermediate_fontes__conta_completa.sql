with
    agencia as(
        select*
        from {{ ref('stg_fontes__agencia') }}
    )
    , cliente as(
        select*
        from {{ ref('stg_fontes__cliente') }}
    )
    , colaborador as(
        select*
        from {{ ref('stg_fontes__colaboradores') }}

    )
    , conta as (
        select*
        from {{ ref('stg_fontes__conta') }}
    )
    , conta_completa as (
        select
            conta.pk_conta
            , conta.fk_cliente
            , conta.fk_agencia 
            , conta.fk_colaborador
            , conta.tipo_de_conta
            , conta.data_abertura_conta
            , conta.saldo_total_conta
            , conta.saldo_disponivel_conta
            , conta.data_ultimo_lancamento_conta
            , agencia.nome_agencia
            , agencia.estado_agencia
            , cliente.nome_cliente
            , colaborador.nome_colaborador
        from conta
        left join agencia on agencia.pk_agencia = conta.fk_agencia
        left join cliente on cliente.pk_cliente = conta.fk_cliente
        left join colaborador on colaborador.pk_colaborador = conta.fk_colaborador
    )
select*
from conta_completa
