void draw() {  
  //Menu 
  if (tela == 0) { 
    Menu();
  }
  //Jogo
  if (tela == 1) {  
    if (morreuMario) {
      MorreMario();
      timerMarioMorre--;
    }

    image(cenario, 0, 0); 
    image(estrela, 400, 5);
    if (!jogoPausa) {
      Gravidade(); 
      Thwomp();  
      Mario();
      ChecaColisoesMario();  
      if (keyPressed && key == ' ')
        TestaMario();
      Lakitu();
      Elevador();
      Botoes();
      Comportas();
      if (level>1)
        Fireballs();
      if (level>3)
        BulletBill();
    }
    VidasMario();
    Scoreboard();
    Comportas();
    MostraBotoes();
    MostraLakitu();
    MostraElevador();
    MostraCogumelos();
    MostraComportas();
    MostraMario();
    MostraCanos();
    MostraFireballs();
    MostraBulletBill();
    PausaJogo();
  }

  Instrucoes();
  //Tela de instruções
  if (tela == 2)
    MostraInstrucoes();
  //Game over
  if (tela == 3) {
    fill(0);
    rect(0, 0, 880, 550);
    image(interfacespr[15], 284, 128);
  }
  Gameover();
}

void settings() {
  size(880, 550);
}

void setup() {

  frameRate(60);
  cenario = loadImage("Sprites/Cenario.png");
  cano = loadImage("Sprites/Cano.png");
  for (int i=0; i<99; i++) { 
    nomeimg[i] = str(i)+".png";
  }
  //Sprites do mario
  for (int i=0; i<27; i++) {
    mariospr[i] = loadImage("Sprites/Mario/"+nomeimg[i]);
  }
  //Sprites do lakitu
  for (int i=0; i<15; i++) {
    lakituspr[i] = loadImage("Sprites/Lakitu/"+nomeimg[i]);
  }
  //Sprites do botão
  for (int i=0; i<2; i++) {
    botaospr[i] = loadImage("Sprites/Botao/"+nomeimg[i]);
  }
  //Sprites das Comportas
  for (int i=0; i<3; i++) {
    comportaspr[i] = loadImage("Sprites/Comporta/"+nomeimg[i]);
  }
  for (int i=0; i<8; i++) {
    spellspr[i] = loadImage("Sprites/Fireball/"+nomeimg[i]);
  }
  for (int i=0; i<3; i++) {
    thwompspr[i] = loadImage("Sprites/Thwomp/"+nomeimg[i]);
  }
  for (int i=0; i<10; i++) {
    scorespr[i] = loadImage("Sprites/Score/"+nomeimg[i]);
  }
  for (int i=0; i<12; i++) {
    botaomenuspr[i] = loadImage("Sprites/UI/Botoes/B"+nomeimg[i]);
  }
  for (int i=0; i<16; i++) {
    interfacespr[i] = loadImage("Sprites/UI/Menu/"+nomeimg[i]);
  }
  for (int i=0; i<10; i++) {
    tecladospr[i] = loadImage("Sprites/UI/Teclado/"+nomeimg[i]);
  }
  for (int i=0; i<6; i++) {
    desafiospr[i] = loadImage("Sprites/Desafios/"+nomeimg[i]);
  }

  elevador = loadImage("Sprites/Elevador.png");
  cogumelo = loadImage("Sprites/Cogumelo.png");
  estrela = loadImage("Sprites/Star.png");
}

void keyPressed() {
  if (keyCode == LEFT && !andaDir && (estadoMario == 0 || estadoMario == 4))
    andaEsq = true;
  if (keyCode == RIGHT && !andaEsq && (estadoMario == 0 || estadoMario == 4))
    andaDir = true;

  if (keyCode == TAB && !jogoPausa && tela == 1) {
    jogoPausa = true;
  }
}
void keyReleased() {
  if (keyCode == LEFT)
    andaEsq = false;
  if (keyCode == RIGHT)
    andaDir = false;
}
