☕ Coffee Sales Analytics: Engenharia de Dados e BI

Este projeto apresenta uma solução completa de análise de dados para uma cafeteria, cobrindo desde a criação da infraestrutura no banco de dados PostgreSQL até o desenvolvimento de um dashboard interativo no Power BI. O foco principal foi a transformação de dados brutos em inteligência de negócio através de processos de ETL e modelagem dimensional.

📊 Dashboard Preview
<img width="1302" height="730" alt="dash_image" src="https://github.com/user-attachments/assets/9936ee6a-6f16-46e0-89c3-f53bbf242180" />


🛠️ Tecnologias e Ferramentas

Banco de Dados: PostgreSQL (SQL para DDL, DML e Views).

Visualização e BI: Power BI Desktop.

Linguagem de Medidas: DAX (Data Analysis Expressions).

Modelagem: Star Schema com Tabela Fato e dCalendário.


🏗️ Estrutura e Desenvolvimento

1. Camada de Dados (PostgreSQL)
A base do projeto foi construída utilizando scripts SQL para garantir a integridade e a performance:

Tratamento de Tipos: Conversão dinâmica da coluna money para NUMERIC para evitar erros de precisão decimal.

Lógica de Negócio Injetada: Implementação de um mapeamento complexo via CASE WHEN para classificar o Tamanho do Copo (Extra Grande, Grande, Médio, Pequeno) baseado na combinação de preço e nome do produto.

View de Exportação: Criação da vw_coffe_vendas como fonte única de verdade (SSOT) para o Power BI, já com tratamento de datas, horas e a nova categoria de tamanho.

2. Modelagem no Power BI
Para garantir que o dashboard fosse dinâmico e preciso, a modelagem seguiu as melhores práticas de BI:

Tabela dCalendário: Criada para suportar inteligência de tempo, contendo colunas de Ano, Mês e Semana (formatadas por nome e número para ordenação correta).

Tabela de Medidas: Centralização de cálculos em uma tabela exclusiva, separando a lógica de negócio da tabela fato.

Soma Vendas: Medida para faturamento total.

Qtd_Cafes: Medida para volumetria de pedidos.

3. Insights Visualizados
O dashboard foi projetado para responder a perguntas críticas de negócio:

Análise Temporal: Vendas por Semana e Vendas por Mês (utilizando a dCalendário).

Mix de Produtos: Gráficos de Cafés Mais Vendidos e Vendas por Tamanho do Copo (derivado da lógica SQL).

Performance Financeira: Cartões de Valor Total de Vendas e Total de Pedidos.

Distribuição: Porcentagem de vendas por período do dia.


📂 Organização do Repositório

coffe_sales.csv: Dataset original utilizado.
script.sql: Script completo com DDL, tratamentos de UPDATE e criação da View.
dash.pbix: Arquivo do Power BI com o modelo de dados e visuais.


🚀 Como Executar

Execute o script.sql no seu PostgreSQL para configurar o ambiente.
Importe os dados do CSV para a tabela criada.
Abra o dash.pbix e aponte a fonte de dados para o seu banco local.
