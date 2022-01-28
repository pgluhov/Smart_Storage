
//import processing.pdf.*;          // Import PDF code  
import http.requests.*;

String Save_CSV [];
String Save_lot_unload_CSV = "";
int FindPisitionUnload = 0;
boolean Call_BtnUnloadDone = false;
String echo_msql;
String lot = "";
String unloading_lot = "";
String loading_lot = "";
String artikul = "";
String artikul_nabor = "";
String locate = "";
String quantity = "";
String Artikul = "";
String Quantity = "";
int ColorSearch = 1;

//String Adress_Server = "192.168.0.140";
String Adress_Server = "localhost";

import processing.serial.*;
Serial myPort;  // Create object from Serial class
String in_String_Com = "";

import controlP5.*;
ControlP5 cp5;
Textarea WorkTextArea;
Textlabel WorkTextlabeloOld;
Textlabel WorkTextlabeloNew;
Textlabel WorkTextlabeloUnloding;
Textfield lot_load;
Textfield lot_unload;
Textfield lot_search;


int Tab_setHeight = 25; 
int Tab_setWidth = 95;
boolean theFlag = true;
//RadioButton RadioBTN_1;
Table table;

void setup() {
  size(395, 890);
  noStroke();  
  cp5 = new ControlP5(this);
  cp5.setFont(createFont("arial", 15));  
  Init_TAB();  
  Init_Controllers();
  Init_Com_Port();  
     
  // размещаем контроллеры в отдельных вкладках
  cp5.getController("DownloadDB").moveTo("loading");  
  cp5.getController("lot_unloading").moveTo("unloading");
  cp5.getController("lot_loading").moveTo("loading");
  cp5.getController("labelold").moveTo("loading");  
  cp5.getController("labelnew").moveTo("loading");  
  cp5.getController("labelunload").moveTo("unloading"); 
  cp5.getController("BtnUnloadDone").moveTo("unloading");
  cp5.getController("DownloadDB").moveTo("loading");
  cp5.getController("BtnOnLedFree").moveTo("Setting");
  cp5.getController("btnOffLedFree").moveTo("Setting");
  //cp5.getController("btnOffLED").moveTo("default");
  
  //UnloadDone
  // Вкладка 'global' - это вкладка, которая находится поверх любого 
  
}

void draw() {
  background(color(128));  
  rect(0, 0, width, 26);
  }


void controlEvent(ControlEvent theEvent) {
  if (theEvent.isAssignableFrom(Textfield.class)) {
    println(theEvent.getName()+": " +theEvent.getStringValue());
    if(theEvent.getName()=="input_lot"){lot = theEvent.getStringValue(); Data_lot_msql(); return;} 
    if(theEvent.getName()=="input_artikul"){artikul = theEvent.getStringValue(); Data_artikul_msql(); return;}
    if(theEvent.getName()=="lot_unloading"){unloading_lot = theEvent.getStringValue(); Data_unloading_lot_msql(); return;}
    if(theEvent.getName()=="lot_loading"){loading_lot = theEvent.getStringValue(); Data_loading_msql(); return;}
    
    if(theEvent.getName()=="input_artikul_nabor"){artikul_nabor = theEvent.getStringValue(); Data_artikul_nabor_msql(); return;}
    
  }  
   if (theEvent.isTab()){println("got an event from tab : "+theEvent.getTab().getName()+" with id "+theEvent.getTab().getId());
       if(theEvent.getTab().getName()=="default"){lot_search.keepFocus(false); lot_load.keepFocus(false); lot_unload.keepFocus(false);}
       if(theEvent.getTab().getName()=="loading"){lot_load.keepFocus(true); lot_search.keepFocus(false); lot_unload.keepFocus(false);}       
       if(theEvent.getTab().getName()=="unloading"){lot_unload.keepFocus(true); lot_load.keepFocus(false); lot_search.keepFocus(false);}       
      }
      
  }
 

public void btnOpenCSV() {
  println(""); 
  println("button btnOpenCSV");
  WorkTextlabeloUnloding.setText("данные выгруженной ячейки:");
  selectInput("Select a file to process:", "fileSelected");
}


public void DownloadDB() {
  println(""); 
  println("button DownloadDB");
  Update_lot_and_quantity();
  lot_load.setFocus(true);  
}
 
 
public void BtnUnloadDone() {
  println(""); 
  println("button BtnUnloadDone");
  unloading_lot = "";
  int y = 0 ; 
  for (int i = 0; i < FindPisitionUnload; i = i+1) { 
  unloading_lot = getValue(Save_lot_unload_CSV, '&', y);
  Call_BtnUnloadDone = true;
  Data_unloading_lot_msql();
  delay(10);
  y++;
  }
 
} 

public void btnOffLED() {
  println(""); 
  println("button btnOffLED");  
  Save_lot_unload_CSV = "";
  WorkTextArea.setText("");
  WorkTextlabeloUnloding.setText("данные выгруженной ячейки:");
  Transmit_Com("3");  
}

public void btnOffLedFree() {
  println(""); 
  println("button btnOffLedFree");   
  Transmit_Com("3"); 
}
 
public void BtnOnLedFree(){
Transmit_Com("3");
delay(10);
Search_locates_qantity_0_msql();
int x = 1 ; 
int count = int(getValue(echo_msql, '$', x));
print("найдено пустых "+count);
ColorSearch = 2 ;
locate = "";
int y = 1 ; 
for (int i = 0; i < count; i = i+1) { 
  locate = getValue(echo_msql, ';', y);
  //print("locate "+locate);
  y=y+1;
  Transmit_Com("2"); 
  delay(10);
}
ColorSearch = 1 ;
echo_msql = ""; 
}
