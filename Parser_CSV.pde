
void fileSelected(File selection) {
  //Transmit_Com("3"); // all off leds
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());    
    table = loadTable(selection.getAbsolutePath(), "header");    
    println(table.getRowCount() + " строк в файле ");    
    WorkTextArea.setText(table.getRowCount() + " строк в файле");    
    String String_CSV = "";    
    FindPisitionUnload = 0;
    Save_lot_unload_CSV = "";
    
    int findStrok = 0;
    for (TableRow row : table.rows()) {
        int id = row.getInt("No");
        String ComponentName = row.getString("ComponentName");
        String TotalComponent = row.getString("TotalComponent"); 
        println(ComponentName);
        String RequestText = "http://"+ Adress_Server + "/give_data_for_artikul.php?artikul=" + ComponentName; 
        GetRequest get = new GetRequest(RequestText);
        get.send();
        echo_msql = get.getContent(); //
        println(echo_msql);
        lot = getValue(echo_msql, ';', 1);
        locate = getValue(echo_msql, ';', 2);  
        quantity = getValue(echo_msql, ';', 3);
        int l1 = lot.length();        
        String Compare = "0";
        String CompareErr = ";";
        if(CompareErr.equals(locate) == true){locate="";}
        // проверяем, одинаковы ли строки 'Compare' и 'quantity':
        if (Compare.equals(quantity) == true)        
        {String_CSV  +="необходимо " + TotalComponent + "шт  (" + ComponentName + ")\n";} 
        else {String_CSV  +="необходимо " + TotalComponent + "шт  (" + ComponentName + ") " + locate+ "\n";}
        if (l1 > 2 && (Compare.equals(quantity) == false)){Transmit_Com("2"); findStrok++; Save_lot_unload_CSV += lot+"&"; FindPisitionUnload++;} 
        delay(10);
    } 
    int AllStrok = table.getRowCount();  //
    int NotStrok = AllStrok - findStrok; //
    WorkTextArea.setText(table.getRowCount() + " строк в файле\nне найдено позиций: " + NotStrok + "\n\n" +String_CSV);
    //Unloading_to_CSV += FindPisitionUnload;
    Save_lot_unload_CSV += FindPisitionUnload;    
    println("_"+FindPisitionUnload);
    print(Save_lot_unload_CSV);
    
  }
}
