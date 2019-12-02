/* Guia rápido de compreensão 
 1. Abas
 UI: Rege a interface do jogo de um modo geral.
 cogumelos: Contém a classe cogumelos, seus métodos, e também chama o "clear" da tela.
 system: Draw, Setup, Settings, KeyPressed e KeyReleased.
 elementos_cenario: Comporta os botões, as caixas, as comportas das caixas, os canos e também o elevador.
 inimigos_e_perigos: Comporta as funções de Lakitu, Thwomp, Fireballs e Bullet Bill.
 keys: Verifica as teclas que estão sendo pressionadas para o movimento do personagem.
 mario: Inclui o personagem principal com suas mecânicas e interações
 setup: Inclui as configurações da tela e preenchimento dos vetores e variáveis de imagens.
 
 2. Telas 
 0 - Menu principal
 1 - Jogo
 2 - Instruçoes
 3 - Fim de jogo
 
 3. Comentários adicionais
 Informações mais específicas sobre as abas e suas funções e variáveis podem ser encontrada dentro das mesmas.
 
 */
//PImages standalone
PImage cenario, cano, thwomp, estrela;

/*Variável score, que guarda quantos pontos o jogador fez, 
 e Level, que determina a dificuldade do jogo.*/
int scoreFase = 0;
int score = 0;
int level = 5;
int vidas = 5;


int tela = 0;  
boolean gameover = false;

//Vetor para o nome dos sprites.
String [] nomeimg = new String [99];
//Vetor de Sprites do Mario
PImage [] mariospr = new PImage [27];
//Vetor de Sprites do Lakitu
PImage [] lakituspr = new PImage [15];
//Vetor de Sprites do botão
PImage [] botaospr = new PImage [2];
//Vetor de Sprites das comportas
PImage [] comportaspr = new PImage [3];
//Vetor de Sprites da bola de fogo
PImage [] spellspr = new PImage [8];
//Vetor de Sprites de thwomps
PImage [] thwompspr = new PImage [3];
//Vetor de Sprites da pontuação
PImage [] scorespr = new PImage [10];
//Vetor de Sprites dos botões do menu
PImage [] botaomenuspr = new PImage[12];
//Vetor de sprites dos elementos da interface
PImage [] interfacespr = new PImage[16];
//Vetor de sprites dos botões do teclado
PImage [] tecladospr = new PImage[10];
//Vetor de sprites dos botões dos desafios
PImage [] desafiospr = new PImage[6];
