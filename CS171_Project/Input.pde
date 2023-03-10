// reference: http://ntci.on.ca/compsci/hef/ics3/ch1/1_4.html

// only imported the necessary codes for String
// then converted the string values into double, float etc. myself in the main code

import javax.swing.*;

String prompt(String str)
{
   println(str);
   String input = JOptionPane.showInputDialog(str);
   if (input == null)
      return null;
   println(input);
   return input;
}

String getString(String str)
{
   return prompt(str);
}
