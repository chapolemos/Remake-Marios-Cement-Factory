/* Comentários do desenvolvedor sobre esta aba:
 
 resetLakitu2 é para quando o jogador passa de fase.
 resetLakitu3 é para quando o jogador morre ou cai no vão da fase.
 */
//Variáveis para o Lakitu
int lakituX = 700;
int lakituY = 50;
int lakituSpeed = 0;
int estadoLakitu = 0;

int resetLakitu = 30;
int resetLakitu2 = 300;
int resetLakitu3 = 120;
int lakituCaixa = 0;

boolean lakituPausa = false;
boolean lakituVai = true;

int subEstadoLakitu = 0;
int timerSubEstadoLakitu = 20;

int raivaLakitu = 10;

//Variáveis para o Thwomp
int thwompX = 0;
int thwompY = -150;

//Variáveis para as Fireballs
int timerFireballsSobe = 60;
int timerFireballsStandby = 240;
int fireball1Y = 600;
int fireball2Y = 600;
boolean fireballSobe = false;

//Variáveis para animar as Fireballs 
int piscaFogo = 5;
int estadoFogo = 0;

//Variáveis para o Bullet Bill
int caminhoBill = 0;
int billX = -100, billY = 200;
int timerResetBill = 20;
int timerDisparaBill = 300;
boolean restartaBill = false;
boolean disparaBill = true;

void Lakitu() {
  timerSubEstadoLakitu--;
  if (timerSubEstadoLakitu == 0) {
    subEstadoLakitu++;
    timerSubEstadoLakitu = 20;
    if (subEstadoLakitu > 2)
      subEstadoLakitu = 0;
  }

  //Movimento de lakitu e velocidade.
  if (!lakituPausa && !marioPausa)
    lakituSpeed = level+1;
  else
    lakituSpeed = 0;
  if (lakituVai) 
    lakituX+=lakituSpeed;
  if (!lakituVai)
    lakituX-=lakituSpeed;


  //Limites para o movimento de Lakitu, arremesso de cogumelos e animação.
  if (lakituX < 30) {
    lakituVai = true;
    lakituCaixa = 1;   
    estadoLakitu = 1;
    arrCogumelos[numCogumelos] = new Cogumelo();
    arrCogumelos[numCogumelos].cogumeloX = 34;
    arrCogumelos[numCogumelos].cogumeloLado = 1;
    numCogumelos++;
  }
  if (lakituX > 800) {    
    lakituVai = false;
    lakituCaixa = 2;   
    estadoLakitu = 1;
    arrCogumelos[numCogumelos] = new Cogumelo();
    arrCogumelos[numCogumelos].cogumeloX = 804;
    arrCogumelos[numCogumelos].cogumeloLado = 2;
    numCogumelos++;
  }
  //Estados de lakitu e suas mudanças.

  if (estadoLakitu == 1)
    resetLakitu--;

  if (resetLakitu == 0) {
    lakituCaixa = 0;
    estadoLakitu = 0;
    resetLakitu = 30;
  }

  //Contabilização de pontuação da fase, e execução da função de limpeza.
  if (scoreFase == 10) {
    LimpaLakitu();
  }
}


//Função que simboliza a transição de fase, onde Lakitu se enfurece, destroi os cogumelos, e aumenta o desafio.
void LimpaLakitu() {
  lakituPausa = true;
  resetLakitu2--; 
  raivaLakitu--;
  //Lakitu mexendo-se de raiva.
  if (raivaLakitu == 0 && estadoLakitu == 0 ) {
    estadoLakitu = 1;
    raivaLakitu = 10;
  }
  if (raivaLakitu == 0 && estadoLakitu == 1 ) {
    estadoLakitu = 0;
    raivaLakitu = 10;
  }
  //O fim do "estado de raiva" de lakitu, onde o jogo volta a correr.
  if (resetLakitu2 == 0) {
    scoreFase = 0;
    elevadorSpeed = 2;
    marioSpeed = 4;
    lakituPausa = false;
    numCogumelos = 0;
    level++;
    resetLakitu2 = 300;
  }
}

//Função que rege as falhas do jogador e sua punição.
void MachucaLakitu() {
  lakituPausa = true;
  resetLakitu3--;
  vidas--;
}


//Display de Lakitu. Auto-explicativo.
void MostraLakitu() {

  if (lakituVai) {
    if (estadoLakitu == 0 && subEstadoLakitu == 0)
      image(lakituspr[3], lakituX, lakituY);
    if (estadoLakitu == 0 && subEstadoLakitu == 1)
      image(lakituspr[4], lakituX, lakituY);
    if (estadoLakitu == 0 && subEstadoLakitu == 2)
      image(lakituspr[5], lakituX, lakituY);



    if (estadoLakitu == 1 && subEstadoLakitu == 0)
      image(lakituspr[9], lakituX, lakituY);
    if (estadoLakitu == 1 && subEstadoLakitu == 1)
      image(lakituspr[10], lakituX, lakituY);
    if (estadoLakitu == 1 && subEstadoLakitu == 2)
      image(lakituspr[11], lakituX, lakituY);
  } else {
    if (estadoLakitu == 0 && subEstadoLakitu == 0)
      image(lakituspr[0], lakituX, lakituY);
    if (estadoLakitu == 0 && subEstadoLakitu == 1)
      image(lakituspr[1], lakituX, lakituY);
    if (estadoLakitu == 0 && subEstadoLakitu == 2)
      image(lakituspr[2], lakituX, lakituY);



    if (estadoLakitu == 1 && subEstadoLakitu == 0)
      image(lakituspr[6], lakituX, lakituY);
    if (estadoLakitu == 1 && subEstadoLakitu == 1)
      image(lakituspr[7], lakituX, lakituY);
    if (estadoLakitu == 1 && subEstadoLakitu == 2)
      image(lakituspr[8], lakituX, lakituY);
  }
}


//Função que faz com que Mario seja esmagado quando a caixa sobrecarrega
void Thwomp() {
  thwompX = marioX-30;
  image(thwompspr[0], thwompX, thwompY);
  if (overflow && !marioPausa) {
    thwompY+=10;
    lakituPausa = true;
  }
  if (thwompY+92 >= marioY) {
    morreuMario = true;
  }
}


//Função que fazem as fireballs saltarem da parte inferior da tela
void Fireballs() {  
  if (!marioPausa && !lakituPausa) {

    timerFireballsStandby--;
    if (timerFireballsStandby <= 0) {
      fireballSobe = true;


      if (fireballSobe) {
        timerFireballsSobe--;
        fireball1Y-=7;
        fireball2Y-=7;
      } 

      if (timerFireballsSobe == 0) {
        fireballSobe = false;
        timerFireballsSobe = 60;
        timerFireballsStandby = 240;
      }
    }
    if ( fireball1Y < 600 & fireball2Y < 600 & !fireballSobe) {
      fireball1Y+=5;
      fireball2Y+=5;
    }
    if (marioX > 200 && marioX < 245 && fireball2Y > marioY - 32 && fireball2Y < marioY +50)
      morreuMario = true;
    if (marioX > 620 && marioX < 665 && fireball2Y > marioY - 32 && fireball2Y < marioY +50)
      morreuMario = true;
  }
}


//Função de display das fireballs
void MostraFireballs() {
  piscaFogo--;
  if (piscaFogo < 0) {
    piscaFogo = 5;
    if (estadoFogo == 0)
      estadoFogo = 1;
    else
      estadoFogo = 0;
  }
  if (fireballSobe) {
    if (estadoFogo == 0) {
      image(desafiospr[4], 220, fireball1Y);
      image(desafiospr[4], 640, fireball2Y);
    } else {
      image(desafiospr[5], 220, fireball1Y);
      image(desafiospr[5], 640, fireball2Y);
    }
  } else { 
    if (estadoFogo == 0) {
      image(desafiospr[2], 220, fireball1Y);
      image(desafiospr[2], 640, fireball2Y);
    } else {
      image(desafiospr[3], 220, fireball1Y);
      image(desafiospr[3], 640, fireball2Y);
    }
  }
}

//Função de bullet bill, o inimigo bala
void BulletBill() {
  if (!marioPausa && !lakituPausa) {


    if (timerResetBill ==0) {
      caminhoBill++;
      if (caminhoBill > 3)
        caminhoBill = 0;
      if (caminhoBill == 0) {
        billX = -100;
        billY = 200;
      }
      if (caminhoBill == 1) {   
        billX = 980; 
        billY = 380;
      }
      if (caminhoBill == 2) {
        billX = 980;
        billY = 200;
      }
      if (caminhoBill == 3) {
        billX = -100; 
        billY = 380;
      }
      disparaBill = true;
      timerResetBill = 20;
      timerDisparaBill = 300;
    }

    if (timerDisparaBill == 0) { 
      disparaBill = false;
      restartaBill = true;
    }
    if (disparaBill) {
      timerDisparaBill--;
      if (caminhoBill == 0 || caminhoBill == 3)
        billX+=5;
      if (caminhoBill == 1 || caminhoBill == 2)
        billX-=5;

      restartaBill = false;
    }
    if (restartaBill) {
      timerResetBill--;
    
    }
    if (billX > marioX-32 && billX < marioX+35 && billY > marioY - 20 && billY < marioY+55)
      morreuMario = true;
  }

}

//Função de display do bullet bill
void MostraBulletBill() {
  if (caminhoBill == 0 || caminhoBill == 3)
    image(desafiospr[1], billX, billY);
  if (caminhoBill == 1 || caminhoBill == 2)
    image(desafiospr[0], billX, billY);
}
