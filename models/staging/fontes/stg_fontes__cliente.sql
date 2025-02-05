with
fonte_cliente as (
    select 
     cast(cod_cliente AS INT) AS pk_cliente
        , concat(primeiro_nome, ' ', ultimo_nome) AS nome_cliente
        , email AS email_cliente
        , tipo_cliente AS tipo_de_cliente
        , cast(data_inclusao AS DATE) AS data_inclusao_cliente
        , cpfcnpj AS cpfcnpj_cliente
        , cast(data_nascimento AS DATE) AS data_nascimento_cliente
        , endereco AS endereco_cliente
        , cep AS cep_cliente
       
    from {{ source("fontes", "clientes") }}
)

select *
from fonte_cliente