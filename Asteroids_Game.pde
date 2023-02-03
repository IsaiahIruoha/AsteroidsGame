//int declaration
int screen; //allows multiple screens
int arraySize; //controls the amount of asteroids
int barraySize; //controls the amount of particles in the background
int score; //keeps the score

//float declaration
float asteroidx, asteroidy, asteroidspeedx, asteroidspeedy; //menu screen flying asteroid
float startWidth, startHeight, startX, startY; //start button variables
float easyWidth, easyHeight, easyX, easyY; //easy button variables
float mediumWidth, mediumHeight, mediumX, mediumY; //medium button variables
float hardWidth, hardHeight, hardX, hardY; //hard button variables
float menubuttonWidth, menubuttonHeight, menubuttonX, menubuttonY; //menu button variables
float pauseWidth, pauseHeight, pauseX, pauseY; //pause button variables
float helpWidth, helpHeight, helpX, helpY; //pause button variables
float retryX, retryY; //retry button
float textCountDown; //countdown for text flashing on loss/win screen
float gameDifficulty; //allows game to switch between difficulty
float playerX, playerY, playerSpeedx, playerSpeedy;  //player variables
float [] aX, aY, aSx, aSy; //asteroid array
float astSize; //size of asteroid allowing difference in mode
float timeEasy; //time for easy mode evac
float timeMedium; //time for medium mode evac
float timeHard; //time for hard mode evac
float gameCountDown; //countdown for evacuation 
float [] bX, bY, bSx; //background particles array
float pewQuickness; //multiplier for laser speed
float randomx, randomy;//allows asteroid spawning to find empty location
float respawnTimer; //timer before asteroids respawn
float astColour; //colour of asteroid, allows changing colour
float shipX, shipY, shipSpeedX, shipSpeedY; //AI ship details
float DownCount; //countdown for the AI ship lasers

ArrayList<Float> pewX = new ArrayList<Float>(); //laser array X coordinate
ArrayList<Float> pewY = new ArrayList<Float>(); //laser array Y coordinate
ArrayList<Float> pewSX = new ArrayList<Float>(); //laser array speed X coordinate
ArrayList<Float> pewSY = new ArrayList<Float>(); //laser array speed Y coordinate
ArrayList<Float> laserX = new ArrayList<Float>(); //laser array X coordinate
ArrayList<Float> laserY = new ArrayList<Float>(); //laser array Y coordinate
ArrayList<Float> laserSX = new ArrayList<Float>(); //laser array speed X coordinate
ArrayList<Float> laserSY = new ArrayList<Float>(); //laser array speed Y coordinate


//PImage declaration
PImage asteroid; //asteroid image
PImage retry; //retry button
PImage pause; //pause button
PImage over; //game won screen
PImage losebackground; //lose screen
PImage backgroundmenu; //menu/start screen
PImage difficultybackground; //difficulty selector screen
PImage laserHits; //target icon displayed next to asteroids eliminated
PImage Help; //image for the help button

//String declaration
String start; //start text
String easy; //easy mode text
String welcome; //welcome text
String name; //game name text
String medium; //medium mode text
String hard; //hard mode text
String choose; //choose your difficulty text
String losetext;  //lose text
String menuText; //main menu back button text
String gameover; //win text

//boolean declaration
boolean pausing; //allow game to be paused
boolean spawning; //allows perfect spawning
boolean out; //allows garbage disposale of asteroids
boolean goodPlayer; //allows game to spawn in AI ship upon button press

void setup () { 

  size (640, 480); //scren dimensions

  frameRate(30); //framerate

  //images being brought from sketch folder
  asteroid = loadImage("asteroid.png");
  backgroundmenu = loadImage("openbackground.jpg");
  difficultybackground = loadImage("difficultybackground.png");
  losebackground = loadImage("lose.jpg");
  retry = loadImage("retry.png");
  over = loadImage("over.jpg");
  pause = loadImage("pause.png");
  laserHits = loadImage("pews.png");
  Help = loadImage("Help.png");

  //previously declared variables are matched with values
  screen = 0;
  welcome = "Welcome to";
  name = "Asteroids Zone";
  asteroidspeedx = 3 + floor(random(6));
  asteroidspeedy = 3 + floor(random(6));
  asteroidx = floor(random(640));
  asteroidy = floor(random(480));
  startWidth = 300;
  startHeight = 100;
  startX = 170;
  startY = 200;
  start = "START";
  easyWidth = 300;
  easyHeight = 90;
  easyX = 170;
  easyY = 50;
  easy = "EASY";
  mediumWidth = 300;
  mediumHeight = 90;
  mediumX = 170;
  mediumY = 155;
  medium = "MEDIUM";
  hardWidth = 300;
  hardHeight = 90;
  hardX = 170;
  hardY = 260;
  hard = "HARD";
  choose = "Choose Your Difficulty!";
  losetext = "You Lost!";
  retryX = 270;
  retryY = 270;
  gameover = "You Win!";
  menubuttonX = 12;
  menubuttonY = 12;
  menubuttonWidth = 90; 
  menubuttonHeight = 50; 
  menuText = "Menu";
  pauseX = 580;
  pauseY = 15;
  pauseWidth = 50;
  pauseHeight = 50;
  pausing = false;
  goodPlayer = true; 
  textCountDown = 40;
  playerX = 320;
  playerY = 240;
  playerSpeedx = random(4)-2;
  playerSpeedy = random(4)-2;
  arraySize = 50; 
  astSize = 20;
  timeEasy = 75;
  timeMedium = 125;
  timeHard = 250;
  gameCountDown = 30; 
  barraySize = 80;
  pewQuickness = 10; 
  randomx = random(width);
  randomy = random(height); 
  score = 0;
  respawnTimer = 563; 
  out = false;
  astColour =  50 + random(155);
  shipX = 100;
  shipY = 100; 
  shipSpeedX = 1;
  shipSpeedY = 1;
  DownCount = 1;
  helpX = 525;
  helpY = 15;
  helpWidth = 50;
  helpHeight = 50;

  bX = new float [barraySize];
  bY = new float [barraySize];
  bSx = new float [barraySize];

  for (int j = 0; j < barraySize; j++) { //spawns in the background particles at a random location and speed
    bX[j] = random(width);
    bY[j] = random(height);
    bSx[j] = 1 + random(9);
  }

  aX = new float [arraySize];
  aY = new float [arraySize];
  aSx = new float [arraySize];
  aSy = new float [arraySize];

  perfectSpawn(); //spawns in asteroids away from eachother
}

void draw () { 

  if (screen == 0) { //starting menu screen

    background(backgroundmenu); //background image

    //welcome text with game name
    fill(#C433DB); 
    textSize(30);
    text(welcome, 80, 100);
    textSize(55);
    text(name, 130, 160);

    //start button 
    fill(0, 100);
    rect(startX, startY, startWidth, startHeight, 8);
    fill(#C433DB);
    text(start, startX + 65, startY + 70);

    //floating images given speeds
    image(asteroid, asteroidx, asteroidy, 100, 100);
    asteroidx = asteroidx + asteroidspeedx;
    asteroidy = asteroidy + asteroidspeedy;

    //floating images if statements to stay within width and height
    if (asteroidx > 555) asteroidspeedx = -5; 
    if (asteroidx < -15) asteroidspeedx = 5;
    if (asteroidy > 395) asteroidspeedy = -5;
    if (asteroidy < -15) asteroidspeedy = 5;
  }

  if (screen == 1) { //difficulty selector screen

    //easy button created
    background(difficultybackground);
    fill(#FE00FF, 220);
    rect(easyX, easyY, easyWidth, easyHeight, 8);
    textSize(50);
    fill(0);
    text(easy, easyX + 90, easyY + 65);

    //medium button created
    fill(#B124B2, 220);
    rect(mediumX, mediumY, mediumWidth, mediumHeight, 8);
    textSize(50);
    fill(0);
    text(medium, mediumX + 55, mediumY + 65);

    //hard button created
    fill(#69056A, 260);
    rect(hardX, hardY, hardWidth, hardHeight, 8);
    textSize(50);
    fill(0);
    text(hard, hardX + 80, hardY + 65); 

    //text "choose difficulty"
    textSize(35);
    fill(255);
    text(choose, 120, 430);

    //menu button to go back to previous screen
    fill(255, 156);
    rect(menubuttonX, menubuttonY, menubuttonWidth, menubuttonHeight, 8);
    fill(0, 187);
    textSize(25);
    text(menuText, menubuttonX + 12, menubuttonY + 33 );
  }

  if (screen == 2) { //main game screen

    if (!pausing) { //if game paused is false, allows pausing to take place

      background(0); //black background

      image(Help, helpX, helpY, helpWidth, helpHeight); 

      if (!goodPlayer) { //if once button pressed goodPlayer == false, then AI ship spawns in to assist

        fill(0, (150 + random(100)), 0);
        ellipse(shipX, shipY, 40, 40);  //creating the AI ship

        if (shipX < 0) shipSpeedX = shipSpeedX * -1;  //if ship attempts to travel out of bounds, turn around
        else if (shipX > width) shipSpeedX = shipSpeedX * -1;
        if (shipY < 0) shipSpeedY = shipSpeedY * -1;
        else if (shipY > height - 40) shipSpeedY = shipSpeedY * -1; 

        shipX = shipX + shipSpeedX; //allows ship to change speeds
        shipY = shipY + shipSpeedY;

        for (int i = 0; i < laserX.size(); i++) {  
          fill(0, 255, 0);
          ellipse(laserX.get(i), laserY.get(i), 15, 15); //lasers created

          laserX.set(i, laserX.get(i) + laserSX.get(i));  //sets lasers x and y coordinates to react with speed adjustments
          laserY.set(i, laserY.get(i) + laserSY.get(i));
        }

        for (int i = 0; i < arraySize; i++) {

          if (dist(shipX, shipY, aX[i], aY[i]) < 100) { //allows the AI ship to track asteroids and follow them
            shipSpeedX = (aX[i] - shipX) / dist(aX[i], aY[i], shipX, shipY);
            shipSpeedY = (aY[i] - shipY) / dist(aX[i], aY[i], shipX, shipY);
          }
        }

        DownCount = DownCount - 1;

        if (DownCount == 1) { //if countdown finishes, allows AI ship to fire shot
          for (int i = 0; i < arraySize; i++) {
            if (laserX.size() == 0) { //can only fire 1 shot at a time
              if (dist(shipX, shipY, aX[i], aY[i]) < 100) { //finds the direction of the target and adjusts the speed for it
                laserSX.add(aX[i] - shipX); 
                laserSY.add(aY[i] - shipY);

                if (dist(shipX, shipY, aX[i], aY[i]) < 100) {
                  laserX.add(shipX);
                  laserY.add(shipY);

                  for (int j = 0; j < laserX.size(); j++) {

                    laserSX.set(j, 8 * laserSX.get(j) / dist(shipX, shipY, aX[i], aY[i])); //speed of lasers is controlled
                    laserSY.set(j, 8 * laserSY.get(j) / dist(shipX, shipY, aX[i], aY[i]));
                  }
                }
              }
            }
          }
        }
      }

      if (DownCount == 0) DownCount = 90; //countdown resets

      for (int i=0; i < arraySize; i++) { //double for loop
        for (int j=0; j < laserX.size(); j++) {
          if (dist(laserX.get(j), laserY.get(j), aX[i], aY[i] ) < astSize/2 + 5) {  //laser on asteroid collision detection

            aX[i] = 900; //asteroids "disapear"
            aY[i] = 900;
            aSx[i] = 0; 
            aSy[i] = 0;
            score = score + 1; 
            laserX.remove(j); 
            laserY.remove(j);
            laserSX.remove(j);
            laserSY.remove(j);
          }
        }
      }

      for (int i=0; i < laserX.size(); i++) { //Laser garbage disposal
        if (laserX.get(i) > width || laserX.get(i) < 0 || laserY.get(i) < 0 || laserY.get(i) > height - 40) { //if laser travels out of bounds
          out = true;
        } else { 
          out = false;
        }
        while (out == true) { 
          laserY.remove(i);
          laserX.remove(i);
          laserSX.remove(i);
          laserSY.remove(i);
          out = false;
        }
      }

      for (int i = 0; i < pewX.size(); i++) { //creates the lasers, colour and size
        fill(255, 0, 0);
        ellipse(pewX.get(i), pewY.get(i), 5, 5);

        pewX.set(i, pewX.get(i) + pewSX.get(i)); //sets the lasers speeds
        pewY.set(i, pewY.get(i) + pewSY.get(i));
      } 


      for (int j = 0; j < barraySize; j++) { //creates particle background effect
        bX[j] = bX[j] - bSx[j];
        fill (0, 0, random(255)); //random blue colour
        rect(bX[j], bY[j], bSx[j], bSx[j], 8); 

        if (bX[j] < 0) { //if the particle flies off screen on the left it finds a new coordinate and comes back from the right side
          bX[j] = 640 + random(width);
          bSx[j] = random(9); //randomizes new speed if reset
        }
      }

      image(pause, pauseX, pauseY, pauseWidth, pauseHeight); //pause image

      playerX = playerX + playerSpeedx; //player speed established
      playerY = playerY + playerSpeedy;

      if (playerX < 0) playerX = width; //if player exits screen, teleports to opposite side
      else if (playerX > width) playerX = 0;
      if (playerY < 0) playerY = height;
      else if (playerY > height) playerY = 0; 

      fill(100 + random(155), 0, 0); //colour of player 
      ellipse(playerX, playerY, 15, 15); //size and shape of player

      for (int i = 0; i < arraySize; i++) { //asteroid creation 
        aX[i] = aX[i] + aSx[i]; //speed set for asteroids
        aY[i] = aY[i] + aSy[i];

        if (aX[i] != 0 && aY[i] !=0) { //if asteroid traveled off the screen, teleports to opposite side
          if (aX[i] > width) aX[i] = 0;
          else if (aX[i] < 0) aX[i] = width;
          else if (aY[i] > height - 40) aY[i] = 0;
          else if (aY[i] < 0) aY[i] = height - 40;
          fill(astColour); //changes colour when game is opened
          ellipse(aX[i], aY[i], astSize, astSize); //asteroid size and shape put together

          for (int j=0; j < arraySize; j++) { //asteroid on asteroid collision detection

            if (i!=j && dist(aX[i], aY[i], aX[j], aY[j]) < astSize) { //if asteroids come to close to eachother then speeds reverse direction

              aSx[i] = aSx[i] * -1;

              aSy[i] = aSy[i] * -1;
            }
          }
        }
      }

      for (int i = 0; i < arraySize; i++) { //asteroid on player collision detection
        if (dist(playerX, playerY, aX[i], aY[i]) < astSize/2 + 7.5) {
          screen = 3; //sends player to the lose screen
        }
      }

      for (int i=0; i < arraySize; i++) { //double for loop
        for (int j=0; j < pewX.size(); j++) {
          if (dist(pewX.get(j), pewY.get(j), aX[i], aY[i] ) < astSize/2 + 5) {  //laser on asteroid collision detection

            aX[i] = 900; //asteroids "disapear"
            aY[i] = 900;
            aSx[i] = 0; 
            aSy[i] = 0;
            score = score + 1; //score changes when asteroid hit, allows elimination tracking
            pewX.remove(j); //lasers are removed when they hit an asteroid
            pewY.remove(j);
            pewSX.remove(j);
            pewSY.remove(j);
          }
        }
      }

      respawnTimer = respawnTimer - 1; //allows waves of asteroids

      if (respawnTimer == 1) { //if timer is up, then commence perfect spawning sequence
        for (int i=0; i < arraySize; i++) {
          spawning = false;
          while (spawning == false) { //while statement is used to make sure every asteroid spawns in its own area before system continues with program
            randomx = random(width);
            randomy = random(height);
            spawning = true; 

            for (int j=0; j < i; j++) { 
              if (dist(aX[j], aY[j], randomx, randomy) < astSize) { //checks if asteroid is far enough from other asteroids
                spawning = false;
              } else if (dist(playerX, playerY, randomx, randomy) < astSize + 25) { //checks if asteroid is far enough from player
                spawning = false;
              }
            }
          }
          aX[i] = randomx; //assigns coordinates if they met the requirements
          aY[i] = randomy;
          aSx[i] = random(4)-2; //changes the speed of the asteroids for variety
          aSy[i] = random(4)-2;
        }
      }

      if (respawnTimer == 0) respawnTimer = 563; //resets the timer if it hits zero

      if (gameDifficulty == 1) { //easy mode
        arraySize = 15; //amount of asteroids
        astSize = 30; //size of asteroids

        fill(30);
        rect(0, 440, width, 50);
        fill(255, 0, 0);
        text("Incoming Evacuation = " + floor(timeEasy) + "s", 170, 468); //displays time left until evacuation, uses specific variable depending on mode

        gameCountDown = gameCountDown - 1; //countdown for evacuation feature, allows 1s intervals
        if (gameCountDown == 1) { 
          timeEasy = timeEasy -1;
        }
        if (gameCountDown == 0) gameCountDown = 30; //reset countdown if finished
        if (timeEasy == 0) screen = 4; //if timer is up game = won
      } 

      if (gameDifficulty == 2) { //medium mode
        arraySize = 25; //amount of asteroids
        astSize = 25; //size of asteroids

        fill(30);
        rect(0, 440, width, 50);
        fill(255, 0, 0);
        text("Incoming Evacuation = " + floor(timeMedium) + "s", 170, 468); //displays time left until evacuation, uses specific variable depending on mode

        gameCountDown = gameCountDown - 1; //countdown for evacuation feature, allows 1s intervals
        if (gameCountDown == 1) { //countdown less then 20 do
          timeMedium = timeMedium -1;
        }
        if (gameCountDown == 0) gameCountDown = 30; //reset countdown if finished
        if (timeMedium == 0) screen = 4; //if timer is up, game = won
      }

      if (gameDifficulty == 3) { //hard mode
        arraySize = 50; //amount of asteroids
        astSize = 20; //size of asteroids

        fill(30);
        rect(0, 440, width, 50);
        fill(255, 0, 0);
        text("Incoming Evacuation = " + floor(timeHard) + "s", 170, 468); //displays time left until evacuation, uses specific variable depending on mode

        gameCountDown = gameCountDown - 1; //countdown for evacuation feature, allows 1s intervals
        if (gameCountDown == 1) { //countdown less then 20 do
          timeHard = timeHard -1;
        }
        if (gameCountDown == 0) gameCountDown = 30; //reset countdown if finished
        if (timeHard == 0) screen = 4; //if timer is up, game = won
      }

      fill(255); 
      textSize(30);
      text(score, 48, 471); //asteroid eliminations counter
      image(laserHits, 10, 443, 35, 35); //target image next to score

      for (int i=0; i < pewX.size(); i++) { //Laser garbage disposal
        if (pewX.get(i) > width || pewX.get(i) < 0 || pewY.get(i) < 0 || pewY.get(i) > height - 40) { //if laser travels out of bounds
          out = true;
        } else { 
          out = false;
        }
        while (out == true) { //removes laser
          pewY.remove(i);
          pewX.remove(i);
          pewSX.remove(i);
          pewSY.remove(i);
          out = false;
        }
      }
    }
  }

  if (screen == 3) { //gameover screen, player has lose

    background(losebackground); //background image

    textCountDown = textCountDown - 1; //countdown for flashing time left feature

    //text setup for losing + transparent background
    fill(0, 160);
    rect(100, 100, 440, 280, 8);
    fill(#F00A0A);
    textSize(60);
    text(losetext, 183, 173);


    //flashing feature added
    if (textCountDown < 20) { //countdown less then 20 do
      textSize(30);
      fill(255);
      if (gameDifficulty == 1)  text(floor(timeEasy) + "s", 340, 237);
      if (gameDifficulty == 2)  text(floor(timeMedium) + "s", 340, 237);
      if (gameDifficulty == 3)  text(floor(timeHard) + "s", 340, 237);
    }
    textSize(30);
    fill(255);
    text("Time Left = ", 161, 237);

    if (textCountDown < 0) textCountDown = 40; //reset countdown if finished

    //retry button created
    image(retry, retryX, retryY, 100, 100);

    fill(255); 
    textSize(30);
    text(score, 48, 471); //asteroid eliminations during game played
    image(laserHits, 10, 443, 35, 35); //image for the players asteroid eliminations
  }

  if (screen == 4) { //evacuation successfull (win)

    background(over); //background image

    //gameover text and transparent background
    fill(0, 160);
    rect(100, 100, 440, 280, 8);
    fill(#14DB44);
    textSize(60);
    text(gameover, 196, 173);

    textCountDown = textCountDown - 1; //flashing time left amount feature (0)

    //flashing time left feature setup
    if (textCountDown < 20) { //countdown less then 20 do
      textSize(30);
      fill(255);
      if (gameDifficulty == 1)  text(floor(timeEasy) + "s", 340, 237);
      if (gameDifficulty == 2)  text(floor(timeMedium) + "s", 340, 237);
      if (gameDifficulty == 3)  text(floor(timeHard) + "s", 340, 237);
    }
    textSize(30);
    fill(255);
    text("Time Left = ", 161, 237);

    if (textCountDown < 0) textCountDown = 40; //reset countdown if finished

    image(retry, retryX, retryY, 99, 100); //retry button

    fill(255); 
    textSize(30);
    text(score, 48, 471); //asteroid elimination tracker
    image(laserHits, 10, 443, 35, 35); //target image for asteroid eliminations
  }
}

void mousePressed() { //if mouse button clicked

  if (screen == 2) { //if playing the game
    if (pewX.size() < 5) { //stops laser spamming limits to 5 lasers

      pewX.add(playerX); //laser is created on the player
      pewY.add(playerY);

      pewSX.add(mouseX - playerX); //speed is set to the distance between the player and the mouse
      pewSY.add(mouseY - playerY);

      for (int i=0; i < pewX.size(); i++) { //makes the speed 1 * pewQuickness, allows laser to travel where mouse points
        if (pewX.get(i) == playerX && pewY.get(i) == playerY && pewSX.get(i) == mouseX - playerX && pewSY.get(i) == mouseY - playerY) {
          pewSX.set(i, pewQuickness * pewSX.get(i) / dist(playerX, playerY, mouseX, mouseY));
          pewSY.set(i, pewQuickness * pewSY.get(i) / dist(playerX, playerY, mouseX, mouseY));
        }
      }
    }
      if (mouseX > pauseX && mouseX < pauseX + pauseWidth && mouseY > pauseY && mouseY < pauseY + pauseHeight) { //if pause button clicked, checks if pause it already in place
        if (pausing == false) {
          pausing = true;
        } else {
          pausing = false;
        }
      }

      if (mouseX > helpX && mouseX < helpX + helpWidth && mouseY > helpY && mouseY < helpY + helpHeight) { //if help button clicked, checks if AI ship has already been spawned
        if (goodPlayer == false) {
          goodPlayer = true;
        } else {
          goodPlayer = false;
        }
      }
    
  }

  if (screen == 1) { //if difficulty selector screen is enabled
    if (mouseX > easyX && mouseX < easyX + easyWidth && mouseY > easyY && mouseY < easyY + easyHeight) { //easy button click registration, customizes variables
      screen = 2;
      gameDifficulty = 1;
    }

    if (mouseX > mediumX && mouseX < mediumX + mediumWidth && mouseY > mediumY && mouseY < mediumY + mediumHeight) { //medium button click registration, customizes variables
      screen = 2;
      gameDifficulty = 2;
    }

    if (mouseX > hardX && mouseX < hardX + hardWidth && mouseY > hardY && mouseY < hardY + hardHeight) { //hard button click registration, customizes variables
      screen = 2;
      gameDifficulty = 3;
    }
    if (mouseX > menubuttonX && mouseX < menubuttonX + menubuttonWidth && mouseY > menubuttonY && mouseY < menubuttonY + menubuttonHeight) { //menu button, takes user back to starting screen
      screen = 0;
    }
  }

  if (screen == 3 || screen == 4) { //if on the win or lose screens
    if (mouseX > retryX && mouseX < retryX + 100 && mouseY > retryY && mouseY < retryY + 100) { //retry button on screen 3 and 4, resets all necessary variables/values
      screen = 1;
      playerX = 320;
      playerY = 240;
      timeEasy = 75;
      timeMedium = 125;
      timeHard = 250;
      playerSpeedx = random(4)-2;
      playerSpeedy = random(4)-2;
      score = 0; 
      respawnTimer = 563;
      pewX.clear();
      pewY.clear();
      pewSX.clear();
      pewSY.clear();
      astColour =  50 + random(155);
      laserX.clear();
      laserY.clear();
      laserSX.clear();
      laserSY.clear();
      goodPlayer = true; 

      perfectSpawn(); //spawns in asteroids away from eachother
    }
  }

  if (screen == 0) { //if menu screen is enabled
    if (mouseX > startX && mouseX < startX + startWidth && mouseY > startY && mouseY < startY + startHeight) { //start button click registration 
      screen = 1;
    }
  }
}

void keyPressed() { //if assigned key is pressed

  if (keyCode == UP) playerSpeedy = playerSpeedy - 0.5; //player moves up
  else if (keyCode == DOWN) playerSpeedy = playerSpeedy + 0.5; //player moves down
  else if (keyCode == LEFT) playerSpeedx = playerSpeedx - 0.5; //player moves left
  else if (keyCode == RIGHT) playerSpeedx = playerSpeedx + 0.5; //player moves right
}

void perfectSpawn() {

  for (int i=0; i < arraySize; i++) { //perfect spawning system in place for after reset occurs
    spawning = false;
    while (spawning == false) { //game cannot continue until all of the asteroids are spawned in and the conditions have been met
      randomx = random(width);
      randomy = random(height);
      spawning = true; 

      for (int j=0; j < i; j++) {
        if (dist(aX[j], aY[j], randomx, randomy) < astSize + 5) { //checks distance from other asteroids
          spawning = false;
        } else if (dist(playerX, playerY, randomx, randomy) < astSize + 25) { //checks distance from player
          spawning = false;
        }
      }
    }
    aX[i] = randomx; //assigns the found coordinates to the asteroid
    aY[i] = randomy;
    aSx[i] = random(4)-2; //gives it a new random speed
    aSy[i] = random(4)-2;
  }
}
