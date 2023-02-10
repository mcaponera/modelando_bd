# Projeto Conceitual de Banco de Dados – E-COMMERCE
Esquema para avaliação do desafio de projeto. 
### Objetivo:

Refinar os seguintes pontos:

    1) Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações:
	*usando o email como pk podemos restringir que seja usado mais de uma vez.*
    
    2) Pagamento – Pode ter cadastrado mais de uma forma de pagamento:
    *criando uma nova entidade (pagamento) que se relaciona com cliente para persistir os dados do cartão.*
    
    3) Entrega – Possui status e código de rastreio:
    *nova entidade.*
