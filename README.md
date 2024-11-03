# Jarvis API (FastAPI)

### Repositório do Código
[Link para o código-fonte do projeto (Jarvis API FastAPI)](https://github.com/vabdala2003/jarvis_api_python)

---

## CI/CD Pipeline

Este projeto utiliza uma pipeline de CI/CD automatizada, acionada a partir de qualquer alteração no código hospedado no repositório REPOS. O processo consiste nas seguintes etapas:

1. **Integração Contínua (CI)**: Compila a API e executa testes para garantir a estabilidade da aplicação.
2. **Entrega Contínua (CD)**: Realiza o upload do artefato gerado diretamente para o Azure App Service, onde a API é implantada.

### Como Engatilhar a Pipeline

Para engatilhar a pipeline, faça uma alteração simples no código, como adicionar um comentário no arquivo `main.py` (exemplo: `# novo comentário`) e realize o commit. O processo de CI/CD será iniciado automaticamente. 

#### Acompanhamento da Pipeline

Você pode monitorar os logs de execução na aba **Pipelines** e **Releases** do Azure DevOps para verificar o progresso e resultados do processo.

---

## Testando a API

Após a conclusão da pipeline, a API estará disponível para testes. Utilize ferramentas como **Postman** ou **Insomnia** para realizar requisições e validar as funcionalidades da API.

Para verificar a persistência dos dados em nuvem, você pode executar o seguinte comando SQL:

```bash
sqlcmd -S jarvisSprint4Server.database.windows.net -d jarvisSprint4Banco -U azureadmin -P rootpwSprint4
```
Para checar o nome de todas as tabelas:

```bash
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE =
'BASE TABLE';
GO
```

# Endpoints e Exemplos de Requisições

## Requisições POST

### Clientes
- **URL**: `https://jarvisfastapi-ejamb5h7e6chc9ar.eastus2-01.azurewebsites.net/jarvis/clientes`
- **Exemplo JSON**:
  ```json
  {
    "nm_cliente": "João da Silva",
    "nr_cpf": 12345678901,
    "nr_rg": 123456789,
    "dt_nascimento": "1990-05-15",
    "cd_senha": "senhaSegura123"
  }
  ```

### Telefones
- **URL**: `https://jarvisfastapi-ejamb5h7e6chc9ar.eastus2-01.azurewebsites.net/jarvis/telefones`
- **Exemplo JSON**:
  ```json
  {
    "id_cliente": 1,
    "nr_telefone": 999888777,
    "nr_ddd": 11,
    "ds_telefone": "Residencial"
  }
  ```
  
### Produtos
- **URL**: `https://jarvisfastapi-ejamb5h7e6chc9ar.eastus2-01.azurewebsites.net/jarvis/produtos`
- **Exemplo JSON**:
  ```json
  {
    "nm_produto": "Celular X",
    "ds_categoria": "Eletrônicos",
    "nr_preco": 1999.99,
    "st_produto": "D",
    "ds_produto": "Smartphone com 128GB e 6GB RAM",
    "nr_tamanho": "6.5 polegadas"
  }
  ```

## Requisições PUT

### Clientes
- **URL**: `https://jarvisfastapi-ejamb5h7e6chc9ar.eastus2-01.azurewebsites.net/jarvis/clientes/1`
- **Exemplo JSON**:
  ```json
  {
    "nm_cliente": "Carlos Mendes",
    "nr_cpf": 11223344556,
    "nr_rg": 223344556,
    "dt_nascimento": "1995-07-08",
    "cd_senha": "superSeguro789"
  }
  ```

### Telefones
- **URL**: `https://jarvisfastapi-ejamb5h7e6chc9ar.eastus2-01.azurewebsites.net/jarvis/telefones/1`
- **Exemplo JSON**:
  ```json
  {
    "id_cliente": 2,
    "nr_telefone": 998877665,
    "nr_ddd": 21,
    "ds_telefone": "Comercial"
  }
  ```
  
### Produtos
- **URL**: `https://jarvisfastapi-ejamb5h7e6chc9ar.eastus2-01.azurewebsites.net/jarvis/produtos/1`
- **Exemplo JSON**:
  ```json
  {
    "nm_produto": "Notebook Y",
    "ds_categoria": "Eletrônicos",
    "nr_preco": 3500.00,
    "st_produto": "I",
    "ds_produto": "Notebook com 512GB SSD e 16GB RAM",
    "nr_tamanho": "14 polegadas"
  }
  ```

### Requisições GET
- **Clientes**: https://jarvisfastapi-ejamb5h7e6chc9ar.eastus2-01.azurewebsites.net/jarvis/clientes
- **Telefones**: https://jarvisfastapi-ejamb5h7e6chc9ar.eastus2-01.azurewebsites.net/jarvis/telefones
- **Produtos**: https://jarvisfastapi-ejamb5h7e6chc9ar.eastus2-01.azurewebsites.net/jarvis/produtos

### Requisições DELETE
- **Clientes**: https://jarvisfastapi-ejamb5h7e6chc9ar.eastus2-01.azurewebsites.net/jarvis/clientes/1
- **Telefones**: https://jarvisfastapi-ejamb5h7e6chc9ar.eastus2-01.azurewebsites.net/jarvis/telefones/1
- **Produtos**: https://jarvisfastapi-ejamb5h7e6chc9ar.eastus2-01.azurewebsites.net/jarvis/produtos/1
