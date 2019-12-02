PImage cogumelo;
int numCogumelos = 0;
Cogumelo[] arrCogumelos = new Cogumelo[30];
boolean overflow = false;

int quedaFireball = 0;
int timerFireball = 10;
int estadoFireball = 0;

class Cogumelo {
  int cogumeloX;
  int cogumeloY;
  boolean cogumeloColide;
  boolean cogumeloConta = true;
  int cogumeloLado;

  Cogumelo() {
    this.cogumeloX = 400;
    this.cogumeloY = 70;
  }
  void display() {
    if (!jogoPausa) {
      if (!cogumeloColide && !lakituPausa && !marioPausa)
        this.cogumeloY+=2;
    }
    image(cogumelo, cogumeloX, cogumeloY);
  }
  void colideCogumelos() {
    //Check da colisão com o fundo da caixa L1
    if (this.cogumeloY == 200 && cogumeloLado == 1 && estadoCaixaL1 != 1)
      this.cogumeloColide = true;
    //Re-teste de colisão quando o botão L1 é apertado.
    if (this.cogumeloColide == true && this.cogumeloY<=200 && cogumeloLado == 1 && estadoCaixaL1 == 1) 
      this.cogumeloColide = false;

    //Check da colisão com o fundo da caixa R1
    if (this.cogumeloY == 200 && cogumeloLado == 2 && estadoCaixaR1 != 1)
      this.cogumeloColide = true;
    //Re-teste de colisão quando o botão R1 é apertado.
    if (this.cogumeloColide == true && this.cogumeloY<=200 && cogumeloLado == 2 && estadoCaixaR1 == 1) 
      this.cogumeloColide = false;

    //Check da colisão com o fundo da caixa L2
    if (this.cogumeloY == 380 && cogumeloLado == 1 && estadoCaixaL1 != 1)
      this.cogumeloColide = true;
    //Re-teste de colisão quando o botão L2 é apertado.
    if (this.cogumeloColide == true && this.cogumeloY>=300 && cogumeloLado == 1 && estadoCaixaL2 == 1) 
      this.cogumeloColide = false;

    //Check da colisão com o fundo da caixa R1
    if (this.cogumeloY == 380 && cogumeloLado == 2 && estadoCaixaR2 != 1)
      this.cogumeloColide = true;
    //Re-teste de colisão quando o botão R1 é apertado.
    if (this.cogumeloColide == true && this.cogumeloY>=300 && cogumeloLado == 2 && estadoCaixaR2 == 1) 
      this.cogumeloColide = false;


    //Check de overflow caixa L1
    if (this.cogumeloY == 86 && cogumeloLado == 1 && estadoCaixaL1 == 0 && this.cogumeloColide == true) 
      overflow = true;
    //Check de overflow caixa L2
    if (this.cogumeloY == 266 && cogumeloLado == 1 && estadoCaixaL2 == 0 && this.cogumeloColide == true) 
      overflow = true;
    //Check de overflow caixa R1
    if (this.cogumeloY == 86 && cogumeloLado == 2 && estadoCaixaR1 == 0 && this.cogumeloColide == true) 
      overflow = true;
    //Check de overflow caixa R2
    if (this.cogumeloY == 266 && cogumeloLado == 2 && estadoCaixaR2 == 0 && this.cogumeloColide == true) 
      overflow = true;

    //Loop checks dos cogumelos
    for (int i = 0; i < numCogumelos; i++) {
      for (int j = 0; j < numCogumelos; j++) {
        if (i!=j) {
          if (arrCogumelos[i].cogumeloY > arrCogumelos[j].cogumeloY-40 && arrCogumelos[i].cogumeloY < arrCogumelos[j].cogumeloY  && arrCogumelos[i].cogumeloLado == arrCogumelos[j].cogumeloLado)
            arrCogumelos[i].cogumeloColide = true;
        }
      }
    }
  }


  void destroiCogumelos() {
    timerFireball--;
    if (estadoFireball == 0) {
      image(spellspr[0], this.cogumeloX-5, this.cogumeloY-650+quedaFireball);
      if (timerFireball == 0) {
        timerFireball = 10;
        estadoFireball = 1;
      }
    }
    if (estadoFireball == 1) {
      image(spellspr[1], this.cogumeloX-5, this.cogumeloY-650+quedaFireball);  
      if (timerFireball == 0) {
        timerFireball = 10;
        estadoFireball = 2;
      }
    }
    if (estadoFireball == 2) {
      image(spellspr[2], this.cogumeloX-5, this.cogumeloY-650+quedaFireball);  
      if (timerFireball == 0) {
        timerFireball = 10;
        estadoFireball = 3;
      }
    }
    if (estadoFireball == 3) {
      image(spellspr[3], this.cogumeloX-5, this.cogumeloY-650+quedaFireball);  
      if (timerFireball == 0) {
        timerFireball = 10;
        estadoFireball = 0;
      }
    }

    if (this.cogumeloY < 490) {
      if (this.cogumeloY-650+quedaFireball < this.cogumeloY)
        quedaFireball+=10;
    }
  }
  void contaCogumelos() {

    if (this.cogumeloY > 550 && cogumeloConta) {
      cogumeloConta = false; 
      score++;
      scoreFase++;
    }
  }
}



//Função que percorre o Array de cogumelos e mostra-os na tela, executando seus métodos.
void MostraCogumelos() {
  if (numCogumelos > 0) {
    for (int i = 0; i < numCogumelos; i++) {
      arrCogumelos[i].display();
      arrCogumelos[i].colideCogumelos();
      arrCogumelos[i].contaCogumelos();
      if (scoreFase == 10)
        arrCogumelos[i].destroiCogumelos();
    }
  }
}
