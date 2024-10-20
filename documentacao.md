# Documentação de Manutenção do Software: Authenticator App

## 1. Manutenção Corretiva
### Descrição:
A manutenção corretiva é realizada para corrigir defeitos e problemas que afetam a funcionalidade do software. Essas correções são importantes para garantir que o aplicativo funcione conforme esperado.

### Exemplos de Manutenção Corretiva:
- **Correção de Bugs:**
  - Problemas na contagem regressiva dos tokens que resetavam após a adição de novos tokens foram corrigidos. Cada token agora possui sua contagem própria, evitando a interrupção do tempo restante ao adicionar novos tokens.

### Ações Realizadas:
- Revisão do gerenciamento da lista de contagem regressiva para tokens.
- Implementação de lógica para garantir que cada token mantenha sua própria contagem ao adicionar novos.

## 2. Manutenção Adaptativa
### Descrição:
A manutenção adaptativa é feita para adaptar o software a novos ambientes ou para garantir que ele continue funcionando em um ambiente existente, principalmente devido a mudanças externas, como atualizações de sistema operacional ou dependências de bibliotecas.

### Exemplos de Manutenção Adaptativa:
- **Atualização de Dependências:**
  - Atualização do pacote `flutter` e outros pacotes utilizados no projeto para versões mais recentes, garantindo compatibilidade e desempenho.

### Ações Realizadas:
- Verificação de atualizações disponíveis nas dependências do projeto e implementação das novas versões.
- Testes para garantir que a atualização não introduziu novos problemas.

## 3. Manutenção Perfectiva
### Descrição:
A manutenção perfectiva visa melhorar o desempenho ou a funcionalidade do software, sem necessariamente corrigir falhas. Isso inclui melhorias na usabilidade, eficiência e estrutura do código.

### Exemplos de Manutenção Perfectiva:
- **Melhorias na Interface do Usuário:**
  - A interface foi aprimorada para uma estética mais moderna e minimalista, utilizando um tema escuro com detalhes em azul e um design geral mais luxuoso.

### Ações Realizadas:
- Redesenho da interface do aplicativo, incluindo a substituição de cores e formatação.
- Implementação de novos componentes de UI para melhorar a experiência do usuário.

## 4. Manutenção Preditiva
### Descrição:
A manutenção preditiva envolve a análise do desempenho do software e a identificação de áreas que podem falhar no futuro. É uma abordagem proativa para minimizar riscos e garantir a continuidade do serviço.

### Exemplos de Manutenção Preditiva:
- **Análise de Performance:**
  - Realização de testes de carga e performance para identificar potenciais gargalos no aplicativo, especialmente ao lidar com múltiplos tokens simultaneamente.

### Ações Realizadas:
- Implementação de métricas de desempenho para monitorar o uso do aplicativo.
- Planejamento de melhorias na arquitetura do aplicativo, visando otimizar o gerenciamento de tokens e contagens.

---

## Conclusão
Essa documentação reflete as manutenções realizadas no aplicativo Authenticator, divididas em quatro categorias: corretiva, adaptativa, perfectiva e preditiva. Cada categoria tem como objetivo garantir a eficácia, segurança e usabilidade do aplicativo, proporcionando uma experiência de usuário superior.
