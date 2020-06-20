int[] Values = {0,36,73,110,146,183,219,255};
int[] RGBc = {-1,-1,-1};
int[][]BadRBGv = {{127,127,127},{0,0,0},{255,255,255}};
int[][] GoodPosN = {{61,61,89,89},{1171,571,1199,599}};
int[][] GoodPosC = {{961,61,989,89},{1171,61,1199,89}};
String [] MText = {"Red And Green are Equal","Green And Blue are Equal","Red And Blue are Equal","All Colour Channels are Equal"};
String type = "B";
int tt;
boolean RV = false;
int v;
boolean CM = false;
boolean Man = true;
void setup(){
  size(1500,600);
}
void draw(){
  background(127);
  if(CM && type != "M"){
    textSize(20);
    fill(255);
    text("All Colour Channels Are Different",0,20);
  }
  if(RGBc[0] != -1 && RGBc[1] != -1 & RGBc[2] != -1 && !Man){
    strokeWeight(5);
    if(RGBc[0] < 64 && RGBc[1] < 64 && RGBc[2] < 64){
      stroke(255);
    }
    fill(255);
    textSize(20);
    text("Colour : R" + round(RGBc[0] / 36.5) + " G" +  round(RGBc[1] / 36.5) + " B"  +  round(RGBc[2]  / 36.5),1200,320);
    text("Real Colour :",1200,340);
    text("R" + RGBc[0] + " G" + RGBc[1] + " B"  + RGBc[2],1200,360);
    fill(RGBc[0],RGBc[1],RGBc[2]);
    rect(1205,5,290,290);
    stroke(0);
    strokeWeight(1);
  }
  if(Man){
   fill(255);
   int ts = 20;
   textSize(ts);
   int c = ts;
   text("Controls :",1205,c);
   c = c + ts;
   text("R : Switch To Squares",1205,c);
   c = c + ts;
   text("Representing Red",1235,c);
   c = c + ts * 2;
   text("G : Switch To Squares",1205,c);
   c = c + ts;
   text("Representing Green",1235,c);
   c = c + ts * 2;
   text("B : Switch To Squares",1205,c);
   c = c + ts;
   text("Representing Blue",1235,c);
   c = c + ts * 2;
   text("C : Switch To and From Colour",1205,c);
   c = c + ts;
   text("Channel Mode",1235,c);
   c = c + ts * 2;
   text("M : Switch To Matching",1205,c);
   c = c + ts;
   text("Colour Channels View",1235,c);
   c = c + ts;
   text("(Channel Mode Only)",1235,c);
   c = c + ts * 2;
   text("I : Switch To And From",1205,c);
   c = c + ts;
   text("Showing True 8-Bit RGB",1230,c);
   c = c + ts;
   text("Values",1230,c);
   c = c + ts * 2;
   text("H : Show/Hide This Help ",1205,c);
   c = c + ts;
   text("Message",1235,c);
   c = c + ts * 2;
   text("Click : Show A Colours RGB",1205,c);
   c = c + ts;
   text("Values(Only Shows Up ",1270,c);
   c = c + ts;
   text("When This Help ",1270,c);
   c = c + ts;
   text("Message Is Closed)",1270,c);
   c = c + ts * 2;
  }
  textSize(30);
  for(int b = 0;b <= 3; b++){
    fill(255);
    textSize(20);
    if(RV){
      v = Values[b];
    }else{
      v = b;
    }
    if (type != "M"){
      text(type + " = " + v,60 + 300 * b,40);
    }else if (b != 3){
      text(MText[b],60 + 300 * b,30);
    }else{
      text(MText[b], 10 + 300 * b,30);
    }
    if (type == "R"){
      //print("R");
      tt = 0;
    }
    if (type == "G"){
      //print("G");
      tt = 1;
    }
    if (type == "B"){
      //print("B");
      tt = 2;
    }
    if(CM && type != "M"){
      DrawRGGridC(Values[b],60 + 300 * b,60,tt);
    }else if(type != "M"){
      DrawRGGrid(Values[b],60 + 300 * b,60,tt);
    }else if (b != 3){
      DrawEGrid(b,60 + 300 * b,60,tt);
    }else{
      DrawAEGrid(b,60 + 300 * b,60,tt);
    }
  }
  for(int b = 0;b <= 3; b++){
    fill(255);
    textSize(20);
    if(RV){
      v = Values[b + 4];
    }else{
      v = b + 4;
    }
    if (type != "M"){
      text(type + " = " + v,60 + 300 * b,340);
    }
    if (type == "R"){
      tt = 0;
    }
    if (type == "G"){
      tt = 1;
    }
    if (type == "B"){
      tt = 2;
    }
    if(CM && type != "M"){
      DrawRGGridC(Values[b + 4],60 + 300 * b,360,tt);
    }else if (type != "M"){
      DrawRGGrid(Values[b + 4],60 + 300 * b,360,tt);
    }
  }
}

void DrawRGGrid(int b,int x,int y,int t){
  textSize(20);
  if(RV){
    textSize(10);
  }
  String ty = "ERROR";
  if (t == 0){
    ty = "B";
  }
  if (t == 1){
    ty = "B";
  }
  if (t == 2){
    ty = "G";
  }
  for(int r = 0;r <= 7; r++){
    if(RV){
      v = Values[r];
    }else{
      v = r;
    }
    text(ty+v,x-30,y + ((r + 1)  * 30));
  }
  if (t == 0){
    ty = "G";
  }
  if (t == 1){
    ty = "R";
  }
  if (t == 2){
    ty = "R";
  }
  for(int r = 0;r <= 7; r++){
    if(RV){
      v = Values[r];
    }else{
      v = r;
    }
    text(ty+v,x + (30 * r),y);
  }
  for(int r = 0;r <= 7; r++){
    for(int g = 0;g <= 7; g++){
      if (t == 0){
        fill(b,Values[r],Values[g]);
       }
       if (t == 1){
        fill(Values[r],b,Values[g]);
       }
       if (t == 2){
        fill(Values[r],Values[g],b);
       }
      rect(x + (r * 30),y + (g * 30),30,30);
    }
  }
}
void DrawRGGridC(int b,int x,int y,int t){
  textSize(20);
  if(RV){
    textSize(10);
  }
  int [] NL = {};
  int [] NLN = {};
  for(int r = 0;r <= 7; r++){
    if(Values[r] != b){
      NL = expand(NL,NL.length + 1);
      NL[NL.length - 1] = Values[r];
    }
  }
  for(int r = 0;r <= 7; r++){
    if(Values[r] != b){
      NLN = expand(NLN,NLN.length + 1);
      NLN[NLN.length - 1] = r;
    }
  }
  String ty = "ERROR";
  if (t == 0){
    ty = "B";
  }
  if (t == 1){
    ty = "B";
  }
  if (t == 2){
    ty = "G";
  }
  for(int r = 0;r <= 6; r++){
    if(RV){
      v = NL[r];
    }else{
      v = NLN[r];
    }
    text(ty+v,x-30,y + ((r + 1)  * 30));
  }
  if (t == 0){
    ty = "G";
  }
  if (t == 1){
    ty = "R";
  }
  if (t == 2){
    ty = "R";
  }
  for(int r = 0;r <= 6; r++){
    if(RV){
      v = NL[r];
    }else{
      v = NLN[r];
    }
    text(ty+v,x + (30 * r),y);
  }
  for(int r = 0;r <= 6; r++){
    for(int g = 0;g <= 6; g++){
      if (t == 0){
        fill(b,NL[r],NL[g]);
       }
       if (t == 1){
        fill(NL[r],b,NL[g]);
       }
       if (t == 2){
        fill(NL[r],NL[g],b);
       }
      if(r != g){
        rect(x + (r * 30),y + (g * 30),30,30);
      }else{
        fill(255);
        rect(x + (r * 30),y + (g * 30),30,30);
        fill(0);
        strokeWeight(5);
        line(x + (r * 30) + 5,y + (g * 30) + 5,x + (r * 30) + 25,y + (g * 30) + 25);
        line(x + (r * 30) + 5,y + (g * 30) + 25,x + (r * 30) + 25,y + (g * 30) + 5);
        strokeWeight(1);
      }
    }
  }
}

void DrawEGrid(int b,int x,int y,int t){
  textSize(20);
  if(RV){
    textSize(10);
  }
  //print(b + " ");
  String ty = "ERROR";
  if (b == 0){
    ty = "B";
  }
  if (b == 1){
    ty = "R";
  }
  if (b == 2){
    ty = "G";
  }
  for(int r = 0;r <= 7; r++){
    if(RV){
      v = Values[r];
    }else{
      v = r;
    }
    text(ty+v,x-30,y + ((r + 1)  * 30));
  }
  if (b == 0){
    ty = "Y";
  }
  if (b == 1){
    ty = "C";
  }
  if (b == 2){
    ty = "M";
  }
  for(int r = 0;r <= 7; r++){
    if(RV){
      v = Values[r];
    }else{
      v = r;
    }
    text(ty+v,x + (30 * r),y);
  }
  for(int r = 0;r <= 7; r++){
    for(int g = 0;g <= 7; g++){
      if (b == 0){
        fill(Values[r],Values[r],Values[g]);
       }
       if (b == 1){
        fill(Values[g],Values[r],Values[r]);
       }
       if (b == 2){
        fill(Values[r],Values[g],Values[r]);
       }
       if(r != g){
         rect(x + (r * 30),y + (g * 30),30,30);
       }else{
        fill(255);
        rect(x + (r * 30),y + (g * 30),30,30);
        fill(0);
        strokeWeight(5);
        line(x + (r * 30) + 5,y + (g * 30) + 5,x + (r * 30) + 25,y + (g * 30) + 25);
        line(x + (r * 30) + 5,y + (g * 30) + 25,x + (r * 30) + 25,y + (g * 30) + 5);
        strokeWeight(1);
       }
    }
  }
}
void DrawAEGrid(int b,int x,int y,int t){
  textSize(20);
  if(RV){
    textSize(10);
  }
  //print(b + " ");
  String ty = "W";
  for(int r = 0;r <= 7; r++){
    if(RV){
      v = Values[r];
    }else{
      v = r;
    }
    text(ty+v,x + (30 * r),y);
  }
  for(int r = 0;r <= 7; r++){
    for(int g = 0;g <= 0; g++){
        fill(Values[r]);
       rect(x + (r * 30),y + (g * 30),30,30);
    }
  }
}

void keyPressed(){
  //print(keyCode);
  if(keyCode == 82){
    type = "R";
  }
  if(keyCode == 71){
    type = "G";
  }
  if(keyCode == 66){
    type = "B";
  }
  if(keyCode == 73){
    RV = !RV;
  }
  if(keyCode == 67){
    CM = !CM;
    if (!CM && type == "M"){
      type = "B";
    }
  }
  if(keyCode == 72){
    Man = !Man;
  }
  if(keyCode == 77 && CM){
    type = "M";
  }
}

void mouseClicked(){
  color colour = get(mouseX,mouseY);
  //print();
  RGBc[0] = int(red(colour));
  RGBc[1] = int(green(colour));
  RGBc[2] = int(blue(colour));
  int gtb = 0;
  for(int i = 0;i <= 2;i++){
    //print(RGBc[0] + " " + RGBc[1] + " " +RGBc[2] + " : " + BadRBGv[i][0] + " " +BadRBGv[i][1] + " " +BadRBGv[i][2] + "   " );
    if(RGBc[0] == BadRBGv[i][0] && RGBc[1] == BadRBGv[i][1] &&RGBc[2] == BadRBGv[i][2] ){
      gtb = i + 1;
      //print(gtb - 2);
      if(!CM & i > 0){
        //print("Hi");
        if(mouseX > GoodPosN[gtb - 2][0] && mouseY > GoodPosN[gtb - 2][1] && mouseX < GoodPosN[gtb - 2][2] && mouseY < GoodPosN[gtb - 2][3]){
          gtb = 0;
        }
      }
      if(CM & type == "M" & i > 0){
        //print("Hi");
        if(mouseX > GoodPosC[gtb - 2][0] && mouseY > GoodPosC[gtb - 2][1] && mouseX < GoodPosC[gtb - 2][2] && mouseY < GoodPosC[gtb - 2][3]){
          gtb = 0;
        }
      }
    }
  }
  if(gtb != 0){
    RGBc[0] = -1;
    RGBc[1] = -1;
    RGBc[2] = -1;
  }
}
