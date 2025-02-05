with
    conta_completa as(
        select*
        from {{ ref('intermediate_fontes__conta_completa') }}
    )
    , prop_credito_fonte as(
        select*
        from {{ ref('stg_fontes__prop_credito') }}
    )
    , enriquecer_prop_credito as (
        select 
             prop_credito_fonte.pk_cod_proposta
            , prop_credito_fonte.fk_cliente_cred           
            , prop_credito_fonte.fk_colaborador_cred
            , prop_credito_fonte.data_entrada_proposta
            , prop_credito_fonte.trimestre
            , prop_credito_fonte.taxa_juros_mensal
            , prop_credito_fonte.valor_proposta
            , prop_credito_fonte.valor_financiamento
            , prop_credito_fonte.valor_entrada
            , prop_credito_fonte.valor_prestacao
            , prop_credito_fonte.quantidade_parcelas
            , prop_credito_fonte.valor_total_parcelas
            , prop_credito_fonte.valor_total_com_entrada
            , prop_credito_fonte.carencia
            , prop_credito_fonte.status_proposta
            , conta_completa.nome_cliente
            , conta_completa.nome_colaborador
        from prop_credito_fonte
        left join conta_completa on prop_credito_fonte.fk_cliente_cred  = conta_completa.fk_cliente
    )
select*
from enriquecer_prop_credito