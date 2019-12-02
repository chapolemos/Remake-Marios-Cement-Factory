//Variáveis do mario.
int marioSpeed = 4;
int marioX = 320; 
int marioY = 120;
int estadoMario = 0;
int timerMarioAnda = 7;
int resetEstado = 7;
int timerMartela = 7;

boolean andaDir = false, andaEsq = false;
boolean marioPisa;
boolean marioMartela = false;
boolean marioMorre = false;
boolean marioPausa = false;

int atrasoMorte = 30;
int timerSobe = 30;
boolean morreuMario = false;
int resetMarioMorte = 180;
int timerMarioMorre = 5;
int subEstadoMorteMario = 0;


//Função que cuida das princiapais mecanicas e interações do personagem.
void Mario() {
  //Reset do mario para a posição inicial, parado, para a direção correta.
  if (!keyPressed) {
    timerMarioAnda = 7;
    resetEstado--;
  } 
  if (resetEstado == 0 && (estadoMario == 0 || estadoMario == 1 || estadoMario == 2 || estadoMario == 3)) {
    estadoMario = 0;
    resetEstado = 1;
  }
  if (resetEstado == 0 && (estadoMario == 4 || estadoMario == 5 || estadoMario == 6 || estadoMario == 7)) {
    estadoMario = 4;
    resetEstado = 1;
  }

  if (!lakituPausa && !marioPausa) {
    if (andaEsq) {
      resetEstado = 7;

      if (!marioMartela)
        marioX-=marioSpeed;
      timerMarioAnda--;

      if ((estadoMario == 0 || estadoMario == 4) && timerMarioAnda == 0) {
        estadoMario = 1;
        timerMarioAnda = 7;
      }
      if (estadoMario == 1 && timerMarioAnda == 0) {
        estadoMario = 2;
        timerMarioAnda = 7;
      }
      if (estadoMario == 2 && timerMarioAnda == 0) {
        estadoMario = 3;
        timerMarioAnda = 7;
      }
      if (estadoMario == 3 && timerMarioAnda == 0) {
        estadoMario = 0;
        timerMarioAnda = 7;
      }
    }

    if (andaDir) {
      resetEstado = 7;

      if (!marioMartela)
        marioX+=marioSpeed;
      timerMarioAnda--;

      if ((estadoMario == 0 || estadoMario == 4) && timerMarioAnda == 0) {
        estadoMario = 5;
        timerMarioAnda = 7;
      }

      if (estadoMario == 5 && timerMarioAnda == 0) {
        estadoMario = 6;
        timerMarioAnda = 7;
      }
      if (estadoMario == 6 && timerMarioAnda == 0) {
        estadoMario = 7;
        timerMarioAnda = 7;
      }
      if (estadoMario == 7 && timerMarioAnda == 0) {
        estadoMario = 4;
        timerMarioAnda = 7;
      }
    }

    //Verificação da martelada
    if (keyPressed && (key == 'z' || key == 'Z')) {

      if (estadoMario == 0 || estadoMario == 1 || estadoMario == 2 || estadoMario == 3) {
        estadoMario = 8;
        marioMartela = true;
      }
      if (estadoMario == 4 || estadoMario == 5 || estadoMario == 6 || estadoMario == 7) {
        estadoMario = 14;
        marioMartela = true;
      }
      //Estados da martelada
    }
    if (marioMartela) {
      timerMartela--;
      if (estadoMario == 8 && timerMartela == 0) {
        timerMartela = 7;
        estadoMario = 9;
      }
      if (estadoMario == 9 && timerMartela == 0) {
        timerMartela = 7;
        estadoMario = 10;
      }
      if (estadoMario == 10 && timerMartela == 0) {
        timerMartela = 7;
        estadoMario = 11;
      }
      if (estadoMario == 11 && timerMartela == 0) {
        timerMartela = 7;
        estadoMario = 12;
      }
      if (estadoMario == 12 && timerMartela == 0) {
        timerMartela = 7;
        estadoMario = 13;
      }
      if (estadoMario == 13 && timerMartela == 0) {
        timerMartela = 7;
        estadoMario = 0;
        marioMartela = false;
      }

      //Pra direita 
      if (estadoMario == 14 && timerMartela == 0) {
        timerMartela = 7;
        estadoMario = 15;
      }
      if (estadoMario == 15 && timerMartela == 0) {
        timerMartela = 7;
        estadoMario = 16;
      }
      if (estadoMario == 16 && timerMartela == 0) {
        timerMartela = 7;
        estadoMario = 17;
      }
      if (estadoMario == 17 && timerMartela == 0) {
        timerMartela = 7;
        estadoMario = 18;
      }
      if (estadoMario == 18 && timerMartela == 0) {
        timerMartela = 7;
        estadoMario = 19;
      }
      if (estadoMario == 19 && timerMartela == 0) {
        timerMartela = 7;
        estadoMario = 4;
        marioMartela = false;
      }
    }
  }

  //Animação da morte do mario

  if (estadoMario == 20 && subEstadoMorteMario == 0 && timerMarioMorre == 0) {
    subEstadoMorteMario = 1;
    timerMarioMorre = 10;
  }
  if (estadoMario == 20 && subEstadoMorteMario == 1 && timerMarioMorre == 0) {
    subEstadoMorteMario = 0;
    timerMarioMorre = 10;
  }


  //Mario caiu no buraco 
  if (marioY > 490 && !marioPausa)
    morreuMario = true;
}

//Função de display do Mario.
void MostraMario() {
  //Pra esquerda
  if (estadoMario == 0)//Parado
    image(mariospr[0], marioX-24, marioY-18);
  if (estadoMario == 1) 
    image(mariospr[1], marioX-20, marioY-18);
  if (estadoMario == 2) 
    image(mariospr[2], marioX-20, marioY-18);
  if (estadoMario == 3) 
    image(mariospr[1], marioX-20, marioY-18);

  //Pra direita
  if (estadoMario == 4) //Parado
    image(mariospr[3], marioX-24, marioY-18);
  if (estadoMario == 5) 
    image(mariospr[4], marioX-20, marioY-18);
  if (estadoMario == 6) 
    image(mariospr[5], marioX-20, marioY-18);
  if (estadoMario == 7) 
    image(mariospr[4], marioX-20, marioY-18);

  //Martela pra esquerda
  if (estadoMario == 8)
    image(mariospr[6], marioX-24, marioY-18);
  if (estadoMario == 9)
    image(mariospr[7], marioX-24, marioY-18);
  if (estadoMario == 10)
    image(mariospr[8], marioX-24, marioY-18);
  if (estadoMario == 11)
    image(mariospr[9], marioX-24, marioY-18);
  if (estadoMario == 12)
    image(mariospr[10], marioX-24, marioY-18);
  if (estadoMario == 13)
    image(mariospr[11], marioX-24, marioY-18);

  //Martela pra direita
  if (estadoMario == 14)
    image(mariospr[12], marioX-24, marioY-18);
  if (estadoMario == 15)
    image(mariospr[13], marioX-24, marioY-18);
  if (estadoMario == 16)
    image(mariospr[14], marioX-24, marioY-18);
  if (estadoMario == 17)
    image(mariospr[15], marioX-24, marioY-18);
  if (estadoMario == 18)
    image(mariospr[16], marioX-24, marioY-18);
  if (estadoMario == 19)
    image(mariospr[17], marioX-24, marioY-18);


  //Mario morto, estado unico com sub-estados.

  if (estadoMario == 20 && subEstadoMorteMario == 0)
    image(mariospr[18], marioX-30, marioY-18);
  if (estadoMario == 20 && subEstadoMorteMario == 1)
    image(mariospr[19], marioX-30, marioY-18);
}


//Função que confere as colisões com plataformas e elevador, além de limitar seu movimento
void ChecaColisoesMario() {
  //Posição padrão, onde mario não está.
  marioPisa = false;


  //Testes para verificar se Mario está pisando em uma plataforma.
  //Colisão com a plataforma esquerda de cima
  if (marioX > 100 && marioX < 345 && marioY > 180 && marioY < 200 && estadoMario!= 20) {
    marioPisa = true;
    marioY = 182;
  }
  //Colisão com a plataforma esquerda de baixo
  if (marioX > 100 && marioX < 345 && marioY > 360 && marioY < 380 && estadoMario!= 20) {
    marioPisa = true;
    marioY = 362;
  }
  //Colisão com a plataforma direita de cima
  if (marioX > 500 && marioX < 745 && marioY > 180 && marioY < 200 && estadoMario!= 20) {
    marioPisa = true;
    marioY = 182;
  }
  //Colisão com a plataforma direita de baixo
  if (marioX > 500 && marioX < 745 && marioY > 360 && marioY < 380 && estadoMario != 20) {
    marioPisa = true;
    marioY = 362;
  }

  //Colisão com o elevador
  if (marioY > elevadorY-52 && marioY < elevadorY - 35 && marioX > 340 && marioX < 510 && estadoMario != 20) {
    //marioPisaElevador = true;
    marioY = elevadorY-52;
  } 




  //Limitações de movimento para o botão lateral
  if (marioX < 150)
    marioX = 150;
  if (marioX > 695)
    marioX = 695;
}


//A função que verifica se Mario está pisando em algo e determina a sua queda.
void Gravidade() {
  if (!lakituPausa && !marioPausa)
    if (!marioPisa)
      marioY+=4;
}

//Função usada como "cheat mode" ou para testar diferentes interações do mario.
void TestaMario() {
  if (mousePressed) {
    marioX = mouseX-21;
    marioY = mouseY-28;
  }
}


//Função que executa a sequencia de comandos da morte do mario.
void MorreMario() {
  estadoMario = 20;
  marioPausa = true;

  atrasoMorte--;
  if (atrasoMorte <= 0) {

    timerSobe--;
    resetMarioMorte--;
    if (timerSobe > 0) {
      marioY-=3;
    } else
      marioY+=5;

    if (resetMarioMorte == 0) {
      marioX = 320;
      marioY = 120;

      vidas--;
      fireball1Y = 600;
      fireball2Y = 600;

      timerFireballsSobe = 60;
      timerFireballsStandby = 240;
      fireballSobe = false;

      caminhoBill = 0;
      billX = -100;
      billY = 200;
      timerResetBill = 20;
      timerDisparaBill = 300;
      restartaBill = false;
      disparaBill = true;

      morreuMario = false;
      marioMorre = false;
      marioPausa = false;
      lakituPausa = false;

      estadoMario = 0;
      resetMarioMorte = 180;
      timerSobe = 30;
      atrasoMorte = 30;
      if (overflow) {
        numCogumelos = 0;
        thwompY = -150;
      }
      overflow = false;
    }
  }
}
