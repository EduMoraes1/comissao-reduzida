# comissao_reduzida

### Contexto: 
O enjoei criou uma nova feature na plataforma, que permite que o usuário possa optar por um modelo de comissão reduzida, que tem alguns benefícios a menos do modelo de comissão original, porém o usuário consegue vender os produtos com exposição limitada e ter mais lucro. 

### CRM:
Será enviado uma jornada através do Journey Builder (Salesforce Marketing Cloud), uma sequência de três emails após a adesão do comissionamento reduzido (d7/d14/d21), mostrando as vantagens do modelo de comissionamento completo e incentivando o usuário a mudar o modelo de comissão dos produtos atuais. 

A query é feita no BigQuery e enviada para o Automation Studio da Salesforce através da geração de um arquivo FTP, enviando diariamente e populando a Data Extension que ativa a jornada. 

### Segmentação: 
* Pessoas que realizaram upload de pelo menos um produto na plataforma utilizando o benefício de comissionamento reduzido nos ultimos 30 dias
* Enviando todos os product_ids para popular a vitrine de produtos no HTML de email, e forçando esses ID's dentro de um array
 
