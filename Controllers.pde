
void Init_Controllers() { // создаем контроллеры      
 
  cp5.addButton("BtnOnLedFree")
    .setLabel("Засветить все пустые ячейки")
    .setBroadcast(false)
    .setPosition(10, 45)
    .setSize(375, 40)
    .setValue(1)
    .setBroadcast(true)
    .getCaptionLabel().align(CENTER, CENTER)
    ;
    
  cp5.addButton("btnOffLedFree")
    .setLabel("выключить результат поиска")
    .setBroadcast(false)
    .setPosition(10, 840)
    .setSize(375, 40)
    .setValue(1)
    .setBroadcast(true)
    .getCaptionLabel().align(CENTER, CENTER)
    ; 
    
  cp5.addButton("DownloadDB")
    .setLabel("перезаписать данные в ячейке")
    .setBroadcast(false)
    .setPosition(10, 840)
    .setSize(375, 40)
    .setValue(1)
    .setBroadcast(true)
    .getCaptionLabel().align(CENTER, CENTER)
    ;
    
  cp5.addButton("btnOffLED")
    .setLabel("выключить результат поиска")
    .setBroadcast(false)
    .setPosition(10, 840)
    .setSize(375, 40)
    .setValue(1)
    .setBroadcast(true)
    .getCaptionLabel().align(CENTER, CENTER)
    ;   
    
  cp5.addButton("BtnUnloadDone")
    .setLabel("Выгрузить все найденное по CSV")
    .setBroadcast(false)
    .setPosition(10, 840)
    .setSize(375, 40)
    .setValue(1)
    .setBroadcast(true)
    .getCaptionLabel().align(CENTER, CENTER)
    ;     

  cp5.addButton("btnOpenCSV")
    .setBroadcast(false)
    .setPosition(10, 795)
    .setSize(375, 40)
    .setValue(2)
    .setBroadcast(true)
    .setLabel("открыть CSV")
    .getCaptionLabel().align(CENTER, CENTER)
    ;  

 lot_unload = cp5.addTextfield("lot_unloading")
    .setPosition(10, 45)
    .setSize(375, 40)
    .setLabel("выгрузка по лоту")
    .setFont(createFont("arial", 15))    
    .setColor(color(200, 200, 200))
    .setColorBackground(color(0, 10, 0))    
    ;
    
  lot_load = cp5.addTextfield("lot_loading")
    .setPosition(10, 45)
    .setSize(375, 40)
    .setLabel("загрузка новой катушки")
    .setFont(createFont("arial", 15))    
    .setColor(color(200, 200, 200))
    .setColorBackground(color(0, 10, 0))    
    ;    

  lot_search = cp5.addTextfield("input_lot")
    .setPosition(10, 45)
    .setSize(375, 40)
    .setLabel("поиск по лоту")
    .setFont(createFont("arial", 15))
    .setFocus(true)
    .setColor(color(200, 200, 200))
    .setColorBackground(color(0, 10, 0))
    ;

  cp5.addTextfield("input_artikul")
    .setPosition(10, 112)
    .setSize(375, 40)
    .setFont(createFont("arial", 15))
    .setLabel("поиск по номенклатуре")
    .setColor(color(200, 200, 200))
    .setColorBackground(color(0, 10, 0))
    ;
    
  cp5.addTextfield("input_artikul_nabor")
    .setPosition(10, 725)
    .setSize(375, 40)
    .setFont(createFont("arial", 15))
    .setLabel("набор по номенклатуре")
    .setColor(color(200, 200, 200))
    .setColorBackground(color(0, 10, 0))
    ;  
    
  WorkTextArea = cp5.addTextarea("txt")
    .setPosition(10, 190)
    .setSize(375, 528)
    .setFont(createFont("arial", 15))
    .setLineHeight(18)    
    .setColor(10)
    .setColorBackground(color(255, 100))
    .setColorForeground(color(255, 100));
  ;
     
 WorkTextlabeloOld = cp5.addTextlabel("labelold")
    .setText("текущее наполнение позиции")
    .setPosition(10,200)
    .setColor(10)
    .setFont(createFont("arial", 15))
    ;
    
 WorkTextlabeloNew = cp5.addTextlabel("labelnew")
    .setText("данные для нового размещения")
    .setPosition(10,540)
    .setColor(10)
    .setFont(createFont("arial", 15))    
    ;    
 
  WorkTextlabeloUnloding = cp5.addTextlabel("labelunload")
    .setText("данные выгруженной ячейки:")
    .setPosition(10,200)
    .setColor(10)
    .setFont(createFont("arial", 15))    
    ;    
    
}
