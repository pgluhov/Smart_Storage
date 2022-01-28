 //<>//
void Init_Com_Port() {
   
  try {
    printArray(Serial.list()); 
    String portName = Serial.list()[0];  
    myPort = new Serial(this, portName, 9600, 'O', 8, 1);
  } 
  catch(ArrayIndexOutOfBoundsException err) {    
    WorkTextArea.setText("Ошибка подключения\nк системе хранения"); 
    println("COM порты отсутствуют");
  }
}


void Transmit_Com(String FormatSearch) {  
  // FormatSearch = 1 включить один светодиод по адресу locate и выключить остальные
  // FormatSearch = 2 включить один светодиод по адресу locate не выключая остальные
  // FormatSearch = 3 выключить всё
  // FormatSearch = 4 выключить один светодиод по адресу locate
  try {
    myPort.write(locate+";"+ColorSearch+";"+FormatSearch+"\n");  
    print("\nTransmit_Com " +locate+";"+ColorSearch+";"+FormatSearch+"\n\n");
  }
  catch(NullPointerException err) {
    println(" COM порты отсутствуют");
  }
}


void serialEvent(Serial myPort) { 
  in_String_Com = myPort.readString();  
  print(in_String_Com);
}
