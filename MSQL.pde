
void Update_lot_and_quantity(){
  String Update = "http://"+ Adress_Server + "/update_lot_and_quantity.php?artikul="+Artikul+"&lot="+loading_lot+"&quantity="+Quantity;                     
  String RequestUpdate = Update; 
  GetRequest getUp = new GetRequest(RequestUpdate);
  getUp.send();
  println("\nTrancmit_Artikul "+Artikul);
  println("Trancmit_Quantity "+Quantity);
  println("Trancmit_loading_lot "+loading_lot);
  Artikul = "";
  Quantity = "";
  loading_lot = "";
}

void Data_loading_msql(){  
  String RequestArtikul = "http://"+ Adress_Server + "/give_data_artikul_compare.php?lot=" + loading_lot;  
  GetRequest getA = new GetRequest(RequestArtikul);
  getA.send();
  String echo = getA.getContent(); 
  println("\nResive_MSQL "+echo);
  //String trash = getValue(echo, ';', 0);
  Artikul = getValue(echo, ';', 1);
  Quantity = getValue(echo, ';', 2);
  println(Artikul);
  
  String RequestPosition = "http://"+ Adress_Server + "/give_data_for_artikul.php?artikul=" + Artikul;   
  GetRequest getP = new GetRequest(RequestPosition);
  getP.send();
  echo_msql = getP.getContent(); 
  println("\nResive_MSQL "+echo_msql);
  //trash = getValue(echo_msql, ';', 0);
  artikul = getValue(echo_msql, ';', 1);
  locate = getValue(echo_msql, ';', 2); 
  quantity = getValue(echo_msql, ';', 3);  
  String Stellage = getValue(locate, '_', 0);
  String Polka = getValue(locate, '_', 1);
  String Case  = getValue(locate, '_', 2);  
  String CaseAdrr = getValue(locate, '_', 3);  
  WorkTextlabeloOld.setText("поиск позиции для размещения:\n\nпозиция занята "+artikul+"\n\nпозиция "+locate+"\n\n"+ 
                       "стеллаж "+Stellage+"\n\n"+
                       "полка "+Polka+"\n\n"+
                       "кейс "+Case+"\n\n"+
                       "ячейка "+CaseAdrr+"\n\n"+
                       "количество "+ quantity);
  
  WorkTextlabeloNew.setText("данные для перезаписи размещения:\n\nидентификатор "+Artikul+"  "+loading_lot+"\n\nпозиция "+locate+"\n\n"+ 
                       "стеллаж "+Stellage+"\n\n"+
                       "полка "+Polka+"\n\n"+
                       "кейс "+Case+"\n\n"+
                       "ячейка "+CaseAdrr+"\n\n"+
                       "количество "+ Quantity);
                       
  String Update = "http://"+ Adress_Server + "/update_lot_and_quantity.php?artikul="+Artikul+"&lot="+loading_lot+"&quantity="+Quantity;                     
  String RequestUpdate = Update; 
  GetRequest getUp = new GetRequest(RequestUpdate);
  getUp.send();                      
}



void Data_lot_msql(){  
  String RequestText = "http://"+ Adress_Server + "/give_data_for_lot.php?lot=" + lot; 
  GetRequest get = new GetRequest(RequestText);
  get.send();
  echo_msql = get.getContent(); 
  print("\nResive_MSQL "+echo_msql);  
  String trash = getValue(echo_msql, ';', 0);
  artikul = getValue(echo_msql, ';', 1);
  locate = getValue(echo_msql, ';', 2); 
  quantity = getValue(echo_msql, ';', 3);  
  String Stellage = getValue(locate, '_', 0);
  String Polka = getValue(locate, '_', 1);
  String Case  = getValue(locate, '_', 2);  
  String CaseAdrr = getValue(locate, '_', 3);  
  //lot.trim(); //убирает пробелы вокруг переменной  
  WorkTextArea.setText("поиск по номенклатуре:\n\nнайден "+artikul+"  "+lot+"\nпозиция "+locate+"\n"+ 
                       "стеллаж "+Stellage+"\n"+
                       "полка "+Polka+"\n"+
                       "кейс "+Case+"\n"+
                       "ячейка "+CaseAdrr+"\n"+
                       "количество "+ quantity); 
  Transmit_Com("1");
  echo_msql ="";
  artikul ="";
  lot ="";
  locate ="";
  quantity ="";
  println();
  println();  
}



void Data_artikul_msql(){  
  String RequestText = "http://"+ Adress_Server + "/give_data_for_artikul.php?artikul=" + artikul; 
  GetRequest get = new GetRequest(RequestText);
  get.send();
  echo_msql = get.getContent(); 
  print("\nResive_MSQL "+echo_msql); 
  
  String trash = getValue(echo_msql, ';', 0);
  lot = getValue(echo_msql, ';', 1);
  locate = getValue(echo_msql, ';', 2);  
  quantity = getValue(echo_msql, ';', 3);  
  String Stellage = getValue(locate, '_', 0);
  String Polka = getValue(locate, '_', 1);
  String Case  = getValue(locate, '_', 2);  
  String CaseAdrr = getValue(locate, '_', 3);
  
  //lot.trim(); //убирает пробелы вокруг переменной
  WorkTextArea.setText("поиск по номенклатуре:\n\nнайден "+artikul+"  "+lot+"\nпозиция "+locate+"\n"+ 
                       "стеллаж "+Stellage+"\n"+
                       "полка "+Polka+"\n"+
                       "кейс "+Case+"\n"+
                       "ячейка "+CaseAdrr+"\n"+
                       "количество "+ quantity); 
  Transmit_Com("1");
  echo_msql ="";
  artikul ="";
  lot ="";
  locate ="";
  quantity ="";
  println();
  println();  
}



void Data_unloading_lot_msql(){   
  String Request = "http://"+ Adress_Server + "/search_id_lot.php?lot=" + unloading_lot; 
  GetRequest get = new GetRequest(Request);
  get.send();
  echo_msql = get.getContent();  
  //String trash = getValue(echo_msql, ';', 0);
  String id = getValue(echo_msql, ';', 1); 
  locate = getValue(echo_msql, ';', 2);  
  artikul = getValue(echo_msql, ';', 3); 
  quantity = getValue(echo_msql, ';', 4); 
  lot = getValue(echo_msql, ';', 5);   
  
  String Stellage = getValue(locate, '_', 0);
  String Polka = getValue(locate, '_', 1);
  String Case  = getValue(locate, '_', 2);  
  String CaseAdrr = getValue(locate, '_', 3);
  
  print("\nID_MSQL:"+id + " locate:" + locate);
  
 if(Call_BtnUnloadDone == false){WorkTextlabeloUnloding.setText("данные выгруженной ячейки:\n\nидентификатор "+artikul+"  "+lot+"\n\nпозиция "+locate+"\n\n"+ 
                       "стеллаж "+Stellage+"\n\n"+
                       "полка "+Polka+"\n\n"+
                       "кейс "+Case+"\n\n"+
                       "ячейка "+CaseAdrr+"\n\n"+
                       "количество "+ quantity);
                        }
  if(Call_BtnUnloadDone == true){WorkTextlabeloUnloding.setText("данные выгруженных ячеек:\n\n\nвыгружено "+FindPisitionUnload+" позиций\n\n");}
  
  String RequestDELETE = "http://"+ Adress_Server + "/delete_lot_and_quantity.php?id=" + id; 
  GetRequest getDel = new GetRequest(RequestDELETE);
  getDel.send();
  Transmit_Com("4");
  Call_BtnUnloadDone = false;  
}

void Search_locates_qantity_0_msql(){   
  String Request = "http://"+ Adress_Server + "/search_locates_where_qantity_0.php"; 
  GetRequest get = new GetRequest(Request);
  get.send();
  echo_msql = get.getContent(); 
  //print(echo_msql);
}



void Data_artikul_nabor_msql(){  
  String RequestText = "http://"+ Adress_Server + "/give_data_for_artikul.php?artikul=" + artikul_nabor; 
  GetRequest get = new GetRequest(RequestText);
  get.send();
  echo_msql = get.getContent(); 
  print("\nResive_MSQL "+echo_msql); 
  
  String trash = getValue(echo_msql, ';', 0);
  lot = getValue(echo_msql, ';', 1);
  locate = getValue(echo_msql, ';', 2);  
  quantity = getValue(echo_msql, ';', 3);  
  String Stellage = getValue(locate, '_', 0);
  String Polka = getValue(locate, '_', 1);
  String Case  = getValue(locate, '_', 2);  
  String CaseAdrr = getValue(locate, '_', 3);
  
  //lot.trim(); //убирает пробелы вокруг переменной
  WorkTextArea.setText("поиск по номенклатуре:\n\nнайден "+artikul+"  "+lot+"\nпозиция "+locate+"\n"+ 
                       "стеллаж "+Stellage+"\n"+
                       "полка "+Polka+"\n"+
                       "кейс "+Case+"\n"+
                       "ячейка "+CaseAdrr+"\n"+
                       "количество "+ quantity); 
                       
  if(int(quantity)>0){Transmit_Com("2");}
  echo_msql ="";
  artikul ="";
  lot ="";
  locate ="";
  quantity ="";
  println();
  println();  
}
