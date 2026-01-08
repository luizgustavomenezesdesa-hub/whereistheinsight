# 🚗 Banco de Dados de Oficina Mecânica

Este repositório reúne todo o projeto desenvolvido para o desafio de modelagem e implementação de um banco de dados usando o modelo relacional.

A proposta consiste em representar digitalmente o funcionamento de uma oficina mecânica, contendo:

- Clientes
- Veículos
- Ordens de Serviço (OS)
- Serviços realizados
- Peças utilizadas

O projeto segue todas as etapas clássicas:

1. **Modelagem lógica**
2. **Criação do banco e tabelas**
3. **Inserção de dados fictícios**
4. **Consultas SQL exploratórias**
5. **Perguntas que as queries respondem**

---

## 🧩 Modelagem Lógica

Inclui tabelas para clientes, veículos, ordens de serviço, serviços, peças e tabelas de relacionamento para as operações que envolvem muitos para muitos.

---

## 🛠️ Scripts SQL disponíveis

### `schema.sql`
Contém toda a estrutura do banco (DDL):
- Criação das tabelas
- Chaves primárias
- Chaves estrangeiras
- Relacionamentos N:N

### `inserts.sql`
Conjunto de dados fictícios para testes.

### `queries.sql`
Consultas utilizando:
- SELECT
- WHERE
- ORDER BY
- JOIN
- HAVING
- Cálculo de atributos derivados

Cada query responde a uma pergunta contextualizada do negócio.

---

## 📚 Objetivo pedagógico

Este repositório ajuda a praticar:
- Modelagem de base de dados
- Escrita de scripts DDL e DML
- Análise de dados com SQL
- Compreensão de relacionamentos
- Consulta de dados de forma mais analítica

Livre para estudo e reutilização.
