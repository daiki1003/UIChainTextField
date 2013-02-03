UIChainTextField
================

This is a UITextField when 'enter' pressed, the object which is subclass of UIResponder and was connected with InterfaceBuilder will be firstResponder.

Thank you for your interest.

To use this class, 3 step will be needed.

1. import this class.
  
    #import "UIChainTextField.h"

2. in your InterfaceBuilder file which uses UITextField, open "Identity Inspector" (press option+command+3), and change custom class to UIChainTextField.
    
3. open "Connections Inspector" (press option+command+6), connect outlets 'nextChainResponder' 
        with instance of UIResponder class which you want it become firstResponder when user presses 'enter'.
