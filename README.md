# EXTRAINSERT-DE-BYTES
OTIMIZADOR DE EXTRACAO E REINSERCAO DE BYTES - LOBO NINTENDISTA

Descrição
Este é um script batch (arquivo .bat) desenvolvido por LOBO NINTENDISTA para otimizar o processo de extração e reinserção de bytes/caracteres em arquivos ROM. O script interage com os programas dumpmaker.exe e redumpmaker.exe, além de utilizar uma tabela de referência (tabela.tbl) e um arquivo de jogo para realizar as operações desejadas.

Funcionalidades Principais
O script oferece as seguintes funcionalidades:

Extração de Bytes (Caracteres)

Solicitação do nome do arquivo ROM, arquivo de tabela, offset de início e término dos textos em hexadecimal, e nome de saída do arquivo texto.
Validação da existência dos arquivos necessários.
Execução do dumpmaker.exe com os parâmetros fornecidos.
Exibição de mensagens de conclusão ou erro.
Reinserção de Bytes (Caracteres)

Solicitação do nome do arquivo ROM, arquivo de tabela, offset de início dos textos em hexadecimal e nome do arquivo texto traduzido.
Validação da existência dos arquivos necessários.
Execução do redumpmaker.exe com os parâmetros fornecidos.
Exibição de mensagens de conclusão ou erro.
Ajuda

Exibição de instruções sobre como utilizar as opções disponíveis no script.
Sair

Encerramento do programa.
Utilização
O usuário deve garantir que os programas dumpmaker.exe, redumpmaker.exe, a tabela (tabela.tbl), e o arquivo do jogo estejam presentes na mesma pasta que o script. As opções do menu principal permitem ao usuário escolher entre extrair ou reinserir bytes, obter ajuda ou sair do programa.

Instruções Detalhadas
O script fornece instruções detalhadas sobre como utilizar as opções de extração e reinserção de bytes. Isso inclui informações sobre o que o usuário deve inserir para cada opção e como realizar a validação dos arquivos necessários.

Mensagens de Erro
O script inclui mensagens de erro para situações em que os arquivos necessários não são encontrados ou ocorre um erro ao executar dumpmaker.exe ou redumpmaker.exe. As mensagens ajudam o usuário a diagnosticar e corrigir problemas potenciais.
