with
calculos_prop_credito as (
    select 
     cast(cod_proposta as int) as pk_cod_proposta
    , cast(cod_cliente as int) as fk_cliente_cred
    , cast(cod_colaborador as int) as fk_colaborador_cred
    , cast(data_entrada_proposta as DATE) as data_entrada_proposta 
    , extract(quarter from cast(data_entrada_proposta as DATE)) as trimestre
    , cast(taxa_juros_mensal as decimal) as taxa_juros_mensal
    , round(cast(valor_proposta as numeric), 2) as valor_proposta
    , round(cast(valor_financiamento as numeric), 2) as valor_financiamento
    , round(cast(valor_entrada as numeric), 2) as valor_entrada
    , round(cast(valor_prestacao as numeric), 2) as valor_prestacao
    , cast(quantidade_parcelas as int) as quantidade_parcelas
    , cast(carencia as int) as carencia
    , cast(status_proposta as string) as status_proposta
    from {{ source("fontes", "propostas_credito") }}
    ),

fonte_prop_credito as (
    select 
         pk_cod_proposta
        , fk_cliente_cred
        , fk_colaborador_cred
        , data_entrada_proposta
        , trimestre
        , taxa_juros_mensal
        , valor_proposta
        , valor_financiamento
        , valor_entrada
        , valor_prestacao
        , quantidade_parcelas
        , round(quantidade_parcelas * valor_prestacao, 2) as valor_total_parcelas
        , round((quantidade_parcelas * valor_prestacao) + valor_entrada, 2) as valor_total_com_entrada
        , carencia
        , status_proposta
                
    from calculos_prop_credito
)

select *
from fonte_prop_credito
