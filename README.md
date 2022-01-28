# Game Lovers

Game Lovers é uma aplicação voltada para amantes de jogos em que lista jogos das 5 principais plataformas, são elas: Xbox One, Nintendo Switch, PC (Windows), Web Browser e PS4. Vale destacar que a IGDB API trazia "n" plataformas de jogos, porém foram escolhidas apenas 5, das mais conhecidas.

<p align="center">
<img align="right" src="https://j.gifs.com/J8Wqpv.gif" height="300">
<img align="right" src="https://j.gifs.com/EqW9om.gif" height="300">
</p>
O app conta com cache local, então todas as telas navegadas ficam armazenadas localmente, permitindo que o usuário navegue offline.

Outro diferencial é que a aplicação possui responsividade,sendo possível executá-la em desktop.

## Uso

- Clonar o repositório;

- É necessário ter o Flutter instalado em sua máquina. Para obter mais instruções sobre como instalar o flutter, clique [aqui](https://flutter.io/docs/get-started/install);

- Realizar so download das dependências através do comando: `flutter pub get`;

Mobile:

- Run no arquivo `main`.

MACOS:

- Executar o comando `flutter config --enable-macos-desktop`
- Run no arquivo `main`.

Para mais instruções de como executar o projeto em outros sistemas operacionais, clique [aqui](https://docs.flutter.dev/desktop).

   <p align="center">
   <img align="right" src="https://j.gifs.com/r2VR3W.gif" height="300"> 
   <img align="right" src="https://j.gifs.com/163ryG.gif" height="300">
   </p> 
      
      
## Visão geral

Contém duas interfaces simples:

 

- 1. Em que o usuário filtra a lista de jogos (formato `GridView`) pela plataforma desejada através de uma `tab`.
- 2. Ao clicar em um jogo recebe uma tela com os detalhes do jogo em questão.
- 3. A aplicação conta ainda com uma versão dark mode ao clicar na logo do app na região superior direita.

  

## Tecnologias Utilizadas

A arquitetura do projeto é baseada na arquitetura limpa, para conhecer mais sobre esta estrutura, clique [aqui](https://resocoder.com/2019/08/27/flutter-tdd-clean-architecture-course-1-explanation-project-structure/).

   

- [flutter_bloc](https://pub.dev/packages/flutter_bloc): gerenciador de estado flutter.

- [provider](https://pub.dev/packages/provider): como injetor de dependência.

- [drift](https://pub.dev/packages/drift): persistência de dados [(documentação)](https://drift.simonbinder.eu/docs/).

- [dio](https://pub.dev/packages/dio): requisições HTTP.
