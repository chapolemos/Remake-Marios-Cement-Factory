//Estados das animações, transições, etc.
int timerAnimacoesMenu = 30;
int timerLakituMenu = 10;
int estadoMarioMenu = 0;
int estadoLakituMenu = 0;
int estadoThwompMenu = 0;
int estadoFireballMenu = 0;
int estadoBotao0 = 0;
int estadoBotao1 = 0;
int estadoBotao2 = 0;
int estadoBotao3 = 0;
int estadoBotao4 = 0;
int estadoBotao5 = 0;
int estadoBotao6 = 0;
int estadoBotao7 = 0;
int estadoBotao8 = 0;
int estadoBotao9 = 0;
boolean jogoPausa = false;
boolean temFade = false;
int telaPause = 0;
int timerAnimacao1 = 10;
int timerAnimacao2 = 60;
int timerAnimacao3 = 1;
int estadoMarioAndaInst = 0;
int estadoMarioMartelaInst = 0;
int estadoBotoesApertaInst = 0;
int estadoMarioCapaInst = 0;
int estadoLakituInst = 0;
int estadoCoguInst = 0;
int estadoBotaoInst = 0;
int estadoComportaInst = 0;
int paginaInst = 0;
int tempoGameover = 300;
String digito = "";

//Função que checa as vidas do mario, e também mostra na tela.
void VidasMario() {

  if (vidas == 0)
    gameover = true;
  else
    for (int i = 0; i < vidas; i++) {
      image(mariospr[20], 680+i*37, 5);
    }
}

//Função que aumenta a pontuação visível no canto superior-esquerdo
void Scoreboard() {
  for (int i = 0; i< str(score).length(); i++) {
    digito = str((str(score)).charAt(i));
    textSize(32);
    fill(200, 0, 0);
    image(scorespr[int(digito)], 80+(i*24), 5);
    text(level, 440, 36);
  }
}

//Função que mostra e executa os recursos do menu
void Menu() {

  background(200);
  image(interfacespr[0], 0, 0);
  image(interfacespr[2], 271, 230);
  image(interfacespr[1], 172, 30);

  PersonagensMenu();
  MostraMenu();
  BotoesMenu();
}

//Função que faz loops de animação para os personagens na tela de instruções.
void PersonagensMenu() {
  timerAnimacoesMenu--;
  timerLakituMenu--;

  if (timerAnimacoesMenu == 0) {
    if  (estadoMarioMenu <1 )
      estadoMarioMenu++;
    else
      estadoMarioMenu = 0;



    if  (estadoThwompMenu <1 )
      estadoThwompMenu++;
    else
      estadoThwompMenu = 0;


    if  (estadoFireballMenu <3 )
      estadoFireballMenu++;
    else
      estadoFireballMenu = 0;

    timerAnimacoesMenu = 30;
    timerLakituMenu = 10;
  }
  if (timerLakituMenu == 0) {    
    if  (estadoLakituMenu <2 )
      estadoLakituMenu++;
    else
      estadoLakituMenu = 0;
  }
}

//Função que checa o mouseOver dos botões do menu e faz suas interações.
void BotoesMenu() {

  if (tela == 0) {
    if (mouseX >= 317 && mouseX <= 562 && mouseY >= 260 && mouseY <=301)
      estadoBotao0 = 1;
    else
      estadoBotao0 = 0;

    if (mouseX >= 317 && mouseX <= 562 && mouseY >= 340 && mouseY <=381)
      estadoBotao1 = 1;
    else
      estadoBotao1 = 0;

    if (mouseX >= 317 && mouseX <= 562 && mouseY >= 421 && mouseY <=461)
      estadoBotao2 = 1;
    else
      estadoBotao2 = 0;

    if (estadoBotao0 == 1 && mousePressed)
      tela = 1;
    if (estadoBotao1 == 1 && mousePressed)
      tela = 2;
    if (estadoBotao2 == 1 && mousePressed)
      exit();
  }
}

//Display do menu.
void MostraMenu() {
  if (tela == 0) {
    if (estadoMarioMenu == 0)
      image(mariospr[21], 110, 305);
    if (estadoMarioMenu == 1)
      image(mariospr[22], 110, 305);

    if (estadoLakituMenu == 0)
      image(lakituspr[12], 670, 190);
    if (estadoLakituMenu == 1)
      image(lakituspr[13], 670, 190);
    if (estadoLakituMenu == 2)
      image(lakituspr[14], 672, 192);

    if (estadoThwompMenu == 0)
      image(thwompspr[1], 750, 20);
    if (estadoThwompMenu == 1)
      image(thwompspr[2], 750, 20);

    if (estadoFireballMenu == 0)
      image(spellspr[4], 50, 20);
    if (estadoFireballMenu == 1)
      image(spellspr[5], 52, 20);
    if (estadoFireballMenu == 2)
      image(spellspr[6], 52, 22);
    if (estadoFireballMenu == 3)
      image(spellspr[7], 50, 22);


    //Botões do menu
    if (estadoBotao0 == 0)
      image(botaomenuspr[0], 317, 260);
    if (estadoBotao0 == 1)
      image(botaomenuspr[1], 305, 258);

    if (estadoBotao1 == 0)
      image(botaomenuspr[2], 317, 340); 
    if (estadoBotao1 == 1)
      image(botaomenuspr[3], 305, 338);

    if (estadoBotao2 == 0)
      image(botaomenuspr[4], 317, 420);
    if (estadoBotao2 == 1)
      image(botaomenuspr[5], 305, 418);
  }
}

//Tela de pause do jogo
void PausaJogo() {

  if (temFade)
    image(interfacespr[3], 0, 0);
  if (tela == 1 && jogoPausa) {
    temFade = true;

    if (telaPause == 0) {
      //Checagem de estados dos botões, para verificar se estão clicáveis.
      if (mouseX >= 317 && mouseX <= 562 && mouseY >= 220 && mouseY <=261)
        estadoBotao4 = 1;
      else
        estadoBotao4 = 0;

      if (mouseX >= 317 && mouseX <= 562 && mouseY >= 300 && mouseY <=341)
        estadoBotao5 = 1;
      else
        estadoBotao5 = 0;

      if (mouseX >= 317 && mouseX <= 562 && mouseY >= 380 && mouseY <=420)
        estadoBotao6 = 1;
      else
        estadoBotao6 = 0;

      //Clique do mouse nos botões
      if (estadoBotao4 == 1 && mousePressed)
        jogoPausa = false;
      if (estadoBotao5 == 1 && mousePressed)
        telaPause = 1;
      if (estadoBotao6 == 1 && mousePressed) {
        SairDoJogo();
        tela = 0;
        estadoBotao6 = 0;
      } 

      //Fundo e texto de pausado
      image(interfacespr[5], 255, 130);
      image(interfacespr[2], 271, 190);

      //Sprites dos botões e seu aumento quando estão clicáveis.
      if (estadoBotao4 == 0)
        image(botaomenuspr[8], 317, 220);
      if (estadoBotao4 == 1)
        image(botaomenuspr[9], 305, 218);

      if (estadoBotao5 == 0)
        image(botaomenuspr[2], 317, 300);  
      if (estadoBotao5 == 1)
        image(botaomenuspr[3], 305, 298);

      if (estadoBotao6 == 0)
        image(botaomenuspr[6], 317, 380); 
      if (estadoBotao6 == 1)
        image(botaomenuspr[7], 305, 378);
    }
    if (telaPause == 1) {  

      if (mouseX >=317 && mouseX<=562 && mouseY >=500 && mouseY <=541)
        estadoBotao7 = 1;
      else
        estadoBotao7 = 0;

      if (estadoBotao7 == 1 && mousePressed)
        telaPause = 0;

      //Elementos visuais da tela de instruções
      MostraInstrucoes();
    }
  }   

  //Remoção do fade quando o jogo retorna do pause.
  if (tela == 1 && !jogoPausa) {
    temFade = false;
  }
}


//Função que monta as telas de instruções
void Instrucoes() {

  if (tela == 2) {
    if (mouseX >=317 && mouseX<=562 && mouseY >=500 && mouseY <=541)
      estadoBotao3 = 1;
    else
      estadoBotao3 = 0;

    if (estadoBotao3 == 1 && mousePressed)
      tela = 0;
  }

  if (mouseX >=580 && mouseX<=640 && mouseY >=499 && mouseY <=545)
    estadoBotao8 = 1;
  else
    estadoBotao8 = 0;

  if (mouseX >=240 && mouseX<=300 && mouseY >= 499 && mouseY <=545)
    estadoBotao9 = 1;
  else
    estadoBotao9 = 0;

  if (estadoBotao8 == 1 && mousePressed && paginaInst == 0)
    paginaInst = 1;

  if (estadoBotao9 == 1 && mousePressed && paginaInst == 1)
    paginaInst = 0;
}

//A função que restaura o estado do jogo ao inicial quando ocorre Game Over ou retorno ao menu.
void SairDoJogo() {
  //Reset das informações do Mario
  marioX = 320; 
  marioY = 120;
  estadoMario = 0;
  timerMarioAnda = 7;
  resetEstado = 7;
  marioMartela = false;
  timerMartela = 7;
  marioSpeed = 4;
  marioMorre = false;
  andaDir = false; 
  andaEsq = false;
  timerSobe = 30;
  marioPausa = false;
  atrasoMorte = 30;
  morreuMario = false;
  resetMarioMorte = 180;
  timerMarioMorre = 5;
  subEstadoMorteMario = 0;


  //Reset das informações do Lakitu
  lakituX = 700;
  lakituY = 50;
  lakituSpeed = 0;
  estadoLakitu = 0;
  resetLakitu = 30;
  resetLakitu2 = 300;
  resetLakitu3 = 120;
  lakituCaixa = 0;
  lakituPausa = false;
  lakituVai = true;
  subEstadoLakitu = 0;

  //Reset de outras informações do jogo
  elevadorY = 185;
  elevadorSobe = false;

  numCogumelos = 0;
  overflow = false;

  jogoPausa = false;
  temFade = false;

  numCogumelos = 0;
  //Reset dos dados quanto a pontuação e progresso
  level = 1;
  score = 0;
  vidas = 5;    
}

//Display da tela de instruções
void MostraInstrucoes() {  
  //Se for na instrucao do menu, queremos o fundo, mas não é o caso pro jogo.
  if (tela == 2)
    image(interfacespr[0], 0, 0);
  push();
  noStroke();
  fill(180, 180, 255, 100);
  rect(50, 50, 780, 400);
  pop();



  //Imagens das setinhas da tela de instruções.
  if (estadoBotao8 == 0)
    image(interfacespr[7], 580, 499);
  if (estadoBotao8 == 1)
    image(interfacespr[8], 578, 497);

  if (estadoBotao9 == 0)
    image(interfacespr[9], 239, 499);
  if (estadoBotao9 == 1)
    image(interfacespr[10], 237, 497);

  //Diferenciação de telas para visualização dos botões
  if (tela == 2) {
    if (estadoBotao3 == 0)
      image(botaomenuspr[10], 317, 500);
    if (estadoBotao3 == 1)
      image(botaomenuspr[11], 305, 498);
  }
  if (tela == 1) {
    if (estadoBotao7 == 0)
      image(botaomenuspr[10], 317, 500);
    if (estadoBotao7 == 1)
      image(botaomenuspr[11], 305, 498);
  }
  AnimaInstrucoes();
  MostraAnimaInstrucoes();
}



//Função que executa as animações presentes na tela de instruções
void AnimaInstrucoes() {
  timerAnimacao1--;
  timerAnimacao2--;
  timerAnimacao3--;

  if (timerAnimacao1 == 0) {
    estadoMarioMartelaInst++; 
    estadoMarioAndaInst++;
    estadoMarioCapaInst++;
    estadoLakituInst++;
    estadoCoguInst++;
    estadoComportaInst++;
    timerAnimacao1 = 10;
  }

  if (timerAnimacao2 == 0) {
    estadoBotoesApertaInst++;

    timerAnimacao2 = 60;
  }
  if (timerAnimacao3== 0) {

    estadoBotaoInst++;
    timerAnimacao3= 30;
  }
  if (estadoMarioMartelaInst > 5)
    estadoMarioMartelaInst = 0;
  if (estadoMarioAndaInst > 2)
    estadoMarioAndaInst = 0;
  if (estadoBotoesApertaInst > 1)
    estadoBotoesApertaInst = 0;
  if (estadoMarioCapaInst > 2)
    estadoMarioCapaInst = 0;
  if (estadoLakituInst >2)
    estadoLakituInst=0;
  if (estadoCoguInst > 3)
    estadoCoguInst = 0;
  if (estadoComportaInst>2)
    estadoComportaInst = 0; 
  if (estadoBotaoInst > 1) 
    estadoBotaoInst = 0;
}

//Função de display das animações.
void MostraAnimaInstrucoes() {

  if (paginaInst == 0) {
    //Mario andando e setinhas
    image(mariospr[estadoMarioAndaInst], 50, 54);
    image(mariospr[estadoMarioAndaInst+3], 80, 54);
    image(tecladospr[estadoBotoesApertaInst+2], 150, 90);
    image(tecladospr[estadoBotoesApertaInst+4], 180, 90);

    //Mario martelando e Z
    image(mariospr[12+estadoMarioMartelaInst], 70, 148);
    image(tecladospr[estadoBotoesApertaInst], 150, 185);

    //Mario pause e TAB
    image(mariospr[23], 70, 238);
    image(tecladospr[estadoBotoesApertaInst+6], 160, 290);

    //Mario de capa e SPACEBAR
    image(mariospr[24+estadoMarioCapaInst], 70, 328);
    image(tecladospr[estadoBotoesApertaInst+8], 160, 384);

    //Texto
    image(interfacespr[11], 264, 10);
    image(interfacespr[6], 0, 0);
  }
  if (paginaInst == 1) {
    //Lakitu 
    image(lakituspr[3+estadoLakituInst], 60, 80);
    image(lakituspr[9+estadoLakituInst], 120, 80);

    //Caixa de cogumelos e comporta  
    image(interfacespr[13], 70, 300);
    image(comportaspr[0], 87, 410);
    if (estadoCoguInst >= 1) {
      image(cogumelo, 95, 372);  
      if (estadoCoguInst >= 2) {
        image(cogumelo, 95, 332);  
        if (estadoCoguInst >= 3) {
          image(cogumelo, 95, 292);
        }
      }
    }

    //Caixa de cogumelos e botão
    image(botaospr[estadoBotaoInst], 680, 173);
    image(interfacespr[13], 720, 80);
    image(comportaspr[estadoComportaInst], 737, 190);

    //Cogumelo caindo e cano
    image(cogumelo, 735, 270+(estadoCoguInst*30));
    image(cano, 720, 350);

    //Texto
    image(interfacespr[12], 284, 10);
    image(interfacespr[14], 0, 0);
  }
}

//Função que confere se o jogo acabou.
void Gameover() {
  if (gameover) {
    MostraGameover();
  }
}

//Função que mostra GAME OVER na tela.
void MostraGameover() {
  tela = 3;
  tempoGameover--;
  if (tempoGameover == 0) {
    SairDoJogo();
    tela = 0;
    tempoGameover = 300;
    gameover = false;
  }
}
