with
    conta_completa as(
        select*
        from {{ ref('intermediate_fontes__conta_completa') }}
    )
    , transacoes_fonte as(
        select*
        from {{ ref('stg_fontes__transacoes') }}
    )
    , enriquecer_transacoes as (
        select
             transacoes_fonte.pk_cod_transacao
            , transacoes_fonte.fk_num_conta
            , transacoes_fonte.data_transacao
            , transacoes_fonte.trimestre
            , transacoes_fonte.nome_transacao
            , conta_completa.nome_cliente
            , conta_completa.nome_colaborador
            , transacoes_fonte.valor_transacao
            , transacoes_fonte.valor_transacao_sem_sinal
            , transacoes_fonte.nome_mes
            , transacoes_fonte.mes_com_r   
            , conta_completa.nome_agencia
            , conta_completa.estado_agencia
        from transacoes_fonte
        left join conta_completa on transacoes_fonte.fk_num_conta = conta_completa.pk_conta
    )
select*
from enriquecer_transacoes