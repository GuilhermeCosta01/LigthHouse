with
    fonte_agencia as (select * from {{ source("fontes", "agencia") }}),
    renomeando as (
        select
         cast(cod_agencia as int) as pk_agencia
           , cast(nome as string) as nome_agencia
           , cast(endereco as string) as endereco_agencia
           , cast(cidade as string) as cidade_agencia
           , cast(uf as string) as estado_agencia
           , cast(data_abertura as date) as data_abertura_agencia
           , cast(tipo_agencia as string) as tipo_da_agencia
        from fonte_agencia
    )

select *
from renomeando
