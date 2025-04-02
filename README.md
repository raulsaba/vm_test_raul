# vm_test_raul

Versão do Flutter utilizada: 3.29.2

## Arquitetura Utilizada

Uma arquitetura baseada na Clean Archtecture onde separo em camadas de Data, Domain e UI, dessa forma facilita a criação de testes unitários para validação dos componentes utilizados no projeto. Normalmente utilizo essa arquitetura somente em projetos grandes.

Utilizei o GetIt e o Injectable para as injeções de dependências, um dos que acho mais fáceis de utilizar junto com o build_runner e bem performático.

Criei o ExamApi na pasta core para fazer todo o processo da tela até a DataSource da feature como se estivesse acessando um datasource externo.

Utilizei Bloc como Gerenciamento de Estados.
