
void Init_TAB() {
  
  // По умолчанию все контроллеры хранятся внутри вкладки default
  // добавляем вторую вкладку с именем 'Status' и 'Config'
  
  cp5.addTab("default")
    .setColorBackground(color(0, 160, 100))
    .setColorLabel(color(255))
    .setColorActive(color(255, 128, 0))
    .setWidth(Tab_setWidth) //ширина вкладки
    .setHeight(Tab_setHeight)
    .getCaptionLabel().align(CENTER, CENTER)
    ;

  cp5.addTab("unloading")
    .setColorBackground(color(0, 160, 100))
    .setColorLabel(color(255))
    .setColorActive(color(255, 128, 0))
    .setWidth(Tab_setWidth) //ширина вкладки
    .setHeight(Tab_setHeight)
    //.getCaptionLabel().align(CENTER, CENTER)
    ;

  cp5.addTab("loading")
    .setColorBackground(color(0, 160, 100))
    .setColorLabel(color(255))
    .setColorActive(color(255, 128, 0))
    .setWidth(Tab_setWidth) //ширина вкладки
    .setHeight(Tab_setHeight) 
    .getCaptionLabel().align(CENTER, CENTER)
    ;

  cp5.addTab("Setting")
    .setColorBackground(color(0, 160, 100))
    .setColorLabel(color(255))
    .setColorActive(color(255, 128, 0))
    .setWidth(Tab_setWidth) //ширина вкладки
    .setHeight(Tab_setHeight) 
    .getCaptionLabel().align(CENTER, CENTER)
    ;    
  // если вы хотите получить controlEvent, когда
  // нажата вкладка, используйте activeEvent (true)

  cp5.getTab("default")
    .activateEvent(true)
    .setLabel("Search")
    .setId(1)
    ;

  cp5.getTab("unloading")  
    .activateEvent(true)    
    .setId(2)
    ;

  cp5.getTab("loading")
    .activateEvent(true)
    .setId(3)
    ;

  cp5.getTab("Setting")
    .activateEvent(true)
    .setId(4)
    ;   
 
}  
  
 /*
a list of all methods available for the Tab Controller
 use ControlP5.printPublicMethodsFor(Tab.class);
 to print the following list into the console.
 
 You can find further details about class Tab in the javadoc.
 
 Format:
 ClassName : returnType methodName(parameter type)
 
 
 controlP5.ControllerGroup : CColor getColor() 
 controlP5.ControllerGroup : Canvas addCanvas(Canvas) 
 controlP5.ControllerGroup : ControlWindow getWindow() 
 controlP5.ControllerGroup : Controller getController(String) 
 controlP5.ControllerGroup : ControllerProperty getProperty(String) 
 controlP5.ControllerGroup : ControllerProperty getProperty(String, String) 
 controlP5.ControllerGroup : Label getCaptionLabel() 
 controlP5.ControllerGroup : Label getValueLabel() 
 controlP5.ControllerGroup : String getAddress() 
 controlP5.ControllerGroup : String getInfo() 
 controlP5.ControllerGroup : String getName() 
 controlP5.ControllerGroup : String getStringValue() 
 controlP5.ControllerGroup : String toString() 
 controlP5.ControllerGroup : Tab add(ControllerInterface) 
 controlP5.ControllerGroup : Tab addListener(ControlListener) 
 controlP5.ControllerGroup : Tab bringToFront() 
 controlP5.ControllerGroup : Tab bringToFront(ControllerInterface) 
 controlP5.ControllerGroup : Tab close() 
 controlP5.ControllerGroup : Tab disableCollapse() 
 controlP5.ControllerGroup : Tab enableCollapse() 
 controlP5.ControllerGroup : Tab getTab() 
 controlP5.ControllerGroup : Tab hide() 
 controlP5.ControllerGroup : Tab hideArrow() 
 controlP5.ControllerGroup : Tab hideBar() 
 controlP5.ControllerGroup : Tab moveTo(ControlWindow) 
 controlP5.ControllerGroup : Tab moveTo(PApplet) 
 controlP5.ControllerGroup : Tab open() 
 controlP5.ControllerGroup : Tab registerProperty(String) 
 controlP5.ControllerGroup : Tab registerProperty(String, String) 
 controlP5.ControllerGroup : Tab remove(CDrawable) 
 controlP5.ControllerGroup : Tab remove(ControllerInterface) 
 controlP5.ControllerGroup : Tab removeCanvas(Canvas) 
 controlP5.ControllerGroup : Tab removeListener(ControlListener) 
 controlP5.ControllerGroup : Tab removeProperty(String) 
 controlP5.ControllerGroup : Tab removeProperty(String, String) 
 controlP5.ControllerGroup : Tab setAddress(String) 
 controlP5.ControllerGroup : Tab setArrayValue(float[]) 
 controlP5.ControllerGroup : Tab setArrayValue(int, float) 
 controlP5.ControllerGroup : Tab setCaptionLabel(String) 
 controlP5.ControllerGroup : Tab setColor(CColor) 
 controlP5.ControllerGroup : Tab setColorActive(int) 
 controlP5.ControllerGroup : Tab setColorBackground(int) 
 controlP5.ControllerGroup : Tab setColorForeground(int) 
 controlP5.ControllerGroup : Tab setColorLabel(int) 
 controlP5.ControllerGroup : Tab setColorValue(int) 
 controlP5.ControllerGroup : Tab setHeight(int) 
 controlP5.ControllerGroup : Tab setId(int) 
 controlP5.ControllerGroup : Tab setLabel(String) 
 controlP5.ControllerGroup : Tab setMouseOver(boolean) 
 controlP5.ControllerGroup : Tab setMoveable(boolean) 
 controlP5.ControllerGroup : Tab setOpen(boolean) 
 controlP5.ControllerGroup : Tab setPosition(float, float) 
 controlP5.ControllerGroup : Tab setPosition(float[]) 
 controlP5.ControllerGroup : Tab setSize(int, int) 
 controlP5.ControllerGroup : Tab setStringValue(String) 
 controlP5.ControllerGroup : Tab setTitle(String) 
 controlP5.ControllerGroup : Tab setUpdate(boolean) 
 controlP5.ControllerGroup : Tab setValue(float) 
 controlP5.ControllerGroup : Tab setVisible(boolean) 
 controlP5.ControllerGroup : Tab setWidth(int) 
 controlP5.ControllerGroup : Tab show() 
 controlP5.ControllerGroup : Tab showArrow() 
 controlP5.ControllerGroup : Tab showBar() 
 controlP5.ControllerGroup : Tab update() 
 controlP5.ControllerGroup : Tab updateAbsolutePosition() 
 controlP5.ControllerGroup : boolean isBarVisible() 
 controlP5.ControllerGroup : boolean isCollapse() 
 controlP5.ControllerGroup : boolean isMouseOver() 
 controlP5.ControllerGroup : boolean isMoveable() 
 controlP5.ControllerGroup : boolean isOpen() 
 controlP5.ControllerGroup : boolean isUpdate() 
 controlP5.ControllerGroup : boolean isVisible() 
 controlP5.ControllerGroup : boolean setMousePressed(boolean) 
 controlP5.ControllerGroup : float getArrayValue(int) 
 controlP5.ControllerGroup : float getValue() 
 controlP5.ControllerGroup : float[] getArrayValue() 
 controlP5.ControllerGroup : float[] getPosition() 
 controlP5.ControllerGroup : int getHeight() 
 controlP5.ControllerGroup : int getId() 
 controlP5.ControllerGroup : int getWidth() 
 controlP5.ControllerGroup : int listenerSize() 
 controlP5.ControllerGroup : void controlEvent(ControlEvent) 
 controlP5.ControllerGroup : void remove() 
 controlP5.Tab : String getStringValue() 
 controlP5.Tab : Tab activateEvent(boolean) 
 controlP5.Tab : Tab bringToFront() 
 controlP5.Tab : Tab moveTo(ControlWindow) 
 controlP5.Tab : Tab setActive(boolean) 
 controlP5.Tab : Tab setAlwaysActive(boolean) 
 controlP5.Tab : Tab setHeight(int) 
 controlP5.Tab : Tab setLabel(String) 
 controlP5.Tab : Tab setValue(float) 
 controlP5.Tab : Tab setWidth(int) 
 controlP5.Tab : boolean isActive() 
 controlP5.Tab : boolean isAlwaysActive() 
 controlP5.Tab : float getValue() 
 java.lang.Object : String toString() 
 java.lang.Object : boolean equals(Object) 
 
 created: 2015/03/24 12:25:49
 
 */ 
