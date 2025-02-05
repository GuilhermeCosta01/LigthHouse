with
fonte_colaboradores as (
    select 
     cast(cod_colaborador as int) as pk_colaborador
        , concat(primeiro_nome, ' ', ultimo_nome) AS nome_colaborador
        , cast(email as string) as email_colaborador
        , cast(cpf as string) as cpf_colaborador
        , cast(data_nascimento as DATE) as data_nasc_colaborador
        , cast(endereco as string) as endereco_colaborador
        , cast(cep as string) as cep_colaborador      
    from {{ source("fontes", "colaboradores") }}
)

select *
from fonte_colaboradores