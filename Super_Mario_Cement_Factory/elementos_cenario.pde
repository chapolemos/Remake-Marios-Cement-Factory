/*Máquinas de estado das caixas e suas variáveis.
 L é para Left, R para Right. 1 e 2 são as de cima e de baixo, respectivamente.
 Estado 0 é fechado, estado 1 é aberto. */

//Estados, timers e resets das caixas e dos botões.
int estadoCaixaL1 = 0;
int estadoCaixaL2 = 0;
int estadoCaixaR1 = 0;
int estadoCaixaR2 = 0;

int estadoBotaoL1 = 0;
int estadoBotaoL2 = 0;
int estadoBotaoR1 = 0;
int estadoBotaoR2 = 0;

int timerCaixaL1 = 7;
int timerCaixaL2 = 7;
int timerCaixaR1 = 7;
int timerCaixaR2 = 7;

int resetBotaoL1 = 0;
int resetBotaoL2 = 0;
int resetBotaoR1 = 0;
int resetBotaoR2 = 0;

//Imagem do elevador, sua coordenada, direção e velocidade.
PImage elevador;
int elevadorY = 185;
boolean elevadorSobe = false;
int elevadorSpeed = 2;

//Função da ativação dos botões, suas interações e suas mudanças de estado.
void Botoes() {
  //Ativação dos botões
  if (marioX >= 150 && marioX <= 170 && marioY == 182 && estadoMario == 13) {
    estadoBotaoL1 = 1;
    resetBotaoL1 = 10;
  }
  if (marioX >= 675 && marioX <= 695 && marioY == 182 && estadoMario == 18) {
    estadoBotaoR1 = 1;
    resetBotaoR1 = 10;
  }
  if (marioX >= 150 && marioX <= 170 && marioY == 362 && estadoMario == 13) {
    estadoBotaoL2 = 1;
    resetBotaoL2 = 10;
  }
  if (marioX >= 675 && marioX <= 695 && marioY == 362 && estadoMario == 18) {
    estadoBotaoR2 = 1;
    resetBotaoR2 = 10;
  }

  //Resets dos botões
  if (resetBotaoL1==0)
    estadoBotaoL1 = 0;
  if (resetBotaoR1==0)
    estadoBotaoR1 = 0;
  if (resetBotaoL2==0)
    estadoBotaoL2 = 0;
  if (resetBotaoR2==0)
    estadoBotaoR2 = 0;
  //Timers dos resets
  if (estadoBotaoL1 == 1) 
    resetBotaoL1--;
  if (estadoBotaoR1 == 1) 
    resetBotaoR1--;
  if (estadoBotaoL2 == 1) 
    resetBotaoL2--;
  if (estadoBotaoR2 == 1) 
    resetBotaoR2--;
}

//Função de abertura das comportas das caixas na lateral da tela.
void Comportas() {  
  //Caixa de cima da esquerda
  if (estadoCaixaL1 == 0) {
    timerCaixaL1 = 7;
  } else
    timerCaixaL1--;

  if (estadoCaixaL1 == 0 && estadoBotaoL1 == 1) {
    estadoCaixaL1 = 1;    
    timerCaixaL1 = 7;
  }
  if (estadoCaixaL1 == 1 && timerCaixaL1 <= 0) {
    estadoCaixaL1 = 2; 
    timerCaixaL1 = 22;
  }
  if (estadoCaixaL1 == 2 && timerCaixaL1 == 0) {
    estadoCaixaL1 = 3;    
    timerCaixaL1 = 7;
  }
  if (estadoCaixaL1 == 3 && timerCaixaL1 == 0) {
    timerCaixaL1 = 7;
    estadoCaixaL1 = 0;
  }
  //Caixa de cima da direita
  if (estadoCaixaR1 == 0) {
    timerCaixaR1 = 7;
  } else
    timerCaixaR1--;

  if (estadoCaixaR1 == 0 && estadoBotaoR1 == 1) {
    estadoCaixaR1 = 1;    
    timerCaixaR1 = 7;
  }
  if (estadoCaixaR1 == 1 && timerCaixaR1 <= 0) {
    estadoCaixaR1 = 2; 
    timerCaixaR1 = 22;
  }
  if (estadoCaixaR1 == 2 && timerCaixaR1 == 0) {
    estadoCaixaR1 = 3;    
    timerCaixaR1 = 7;
  }
  if (estadoCaixaR1 == 3 && timerCaixaR1 == 0) {
    timerCaixaR1 = 7;
    estadoCaixaR1 = 0;
  }
  //Caixa de baixo da esquerda
  if (estadoCaixaL2 == 0) {
    timerCaixaL2 = 7;
  } else
    timerCaixaL2--;

  if (estadoCaixaL2 == 0 && estadoBotaoL2 == 1) {
    estadoCaixaL2 = 1;    
    timerCaixaL2 = 7;
  }
  if (estadoCaixaL2 == 1 && timerCaixaL2 <= 0) {
    estadoCaixaL2 = 2; 
    timerCaixaL2 = 22;
  }
  if (estadoCaixaL2 == 2 && timerCaixaL2 == 0) {
    estadoCaixaL2 = 3;    
    timerCaixaL2 = 7;
  }
  if (estadoCaixaL2 == 3 && timerCaixaL2 == 0) {
    timerCaixaL2 = 7;
    estadoCaixaL2 = 0;
  }
  //Caixa de baixo da direita
  if (estadoCaixaR2 == 0) {
    timerCaixaR2 = 7;
  } else
    timerCaixaR2--;

  if (estadoCaixaR2 == 0 && estadoBotaoR2 == 1) {
    estadoCaixaR2 = 1;    
    timerCaixaR2 = 7;
  }
  if (estadoCaixaR2 == 1 && timerCaixaR2 <= 0) {
    estadoCaixaR2 = 2; 
    timerCaixaR2 = 22;
  }
  if (estadoCaixaR2 == 2 && timerCaixaR2 == 0) {
    estadoCaixaR2 = 3;    
    timerCaixaR2 = 7;
  }
  if (estadoCaixaR2 == 3 && timerCaixaR2 == 0) {
    timerCaixaR2 = 7;
    estadoCaixaR2 = 0;
  }
}
void MostraBotoes() {
  //Botao de cima da esquerda
  if (estadoBotaoL1 == 0)
    image(botaospr[0], 114, 203);
  if (estadoBotaoL1 == 1)    
    image(botaospr[1], 114, 203);
  //Botao de cima da direita
  if (estadoBotaoR1 == 0)
    image(botaospr[0], 733, 203);
  if (estadoBotaoR1 == 1)    
    image(botaospr[1], 733, 203);
  //Botao de baixo da esquerda
  if (estadoBotaoL2 == 0)
    image(botaospr[0], 114, 384);
  if (estadoBotaoL2 == 1)    
    image(botaospr[1], 114, 384);
  //Botao de baixo da direita
  if (estadoBotaoR2 == 0)
    image(botaospr[0], 733, 384);
  if (estadoBotaoR2 == 1)    
    image(botaospr[1], 733, 384);
}

void MostraComportas() {
  //Caixa de cima da esquerda
  if (estadoCaixaL1 == 0)
    image(comportaspr[0], 26, 240);
  if (estadoCaixaL1 == 1)
    image(comportaspr[1], 26, 240);
  if (estadoCaixaL1 == 2)
    image(comportaspr[2], 26, 240);
  if (estadoCaixaL1 == 3)
    image(comportaspr[1], 26, 240);

  //Caixa de cima da direita
  if (estadoCaixaR1 == 0)
    image(comportaspr[0], 800, 240);
  if (estadoCaixaR1 == 1)
    image(comportaspr[1], 800, 240);
  if (estadoCaixaR1 == 2)
    image(comportaspr[2], 800, 240);
  if (estadoCaixaR1 == 3)
    image(comportaspr[1], 800, 240);

  //Caixa de baixo da esquerda
  if (estadoCaixaL2 == 0)
    image(comportaspr[0], 26, 420);
  if (estadoCaixaL2 == 1)
    image(comportaspr[1], 26, 420);
  if (estadoCaixaL2 == 2)
    image(comportaspr[2], 26, 420);
  if (estadoCaixaL2 == 3)
    image(comportaspr[1], 26, 420);

  //Caixa de baixo da direita
  if (estadoCaixaR2 == 0)
    image(comportaspr[0], 800, 420);
  if (estadoCaixaR2 == 1)
    image(comportaspr[1], 800, 420);
  if (estadoCaixaR2 == 2)
    image(comportaspr[2], 800, 420);
  if (estadoCaixaR2 == 3)
    image(comportaspr[1], 800, 420);
}

//Função que rege o elevador ao centro da tela
void Elevador() {
  if (!lakituPausa && !marioPausa) {
    if (elevadorSobe)
      elevadorY-=elevadorSpeed;
    if (!elevadorSobe)
      elevadorY+=elevadorSpeed;
  }
  if (elevadorY > 435)
    elevadorSobe = true;
  if (elevadorY < 215)
    elevadorSobe = false;
}
//Função que mostra o elevador na posição adequada.
void MostraElevador() {
  image(elevador, 365, elevadorY);
}

//Display dos canos na parte inferior da tela.
void MostraCanos() {
  image(cano, 20, 500);
  image(cano, 790, 500);
}
