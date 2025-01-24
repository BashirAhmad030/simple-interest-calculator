import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({super.key});

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  var _currences = ["Rupes", "Dolors", "pounds",];
  var currentItemSeleceted = "Rupes";
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        items: _currences.map((dropDownStringItem){
          return DropdownMenuItem<String>(
            value: dropDownStringItem,
              child: Text(dropDownStringItem),
          );
        }).toList(),
        onChanged: (newvalueIsSelected){
          // Your code to execute, When a menu item selected from the Drop Down
          _onDropDownButtonState(newvalueIsSelected);

        },
        value:currentItemSeleceted ,
    );
  }
   void _onDropDownButtonState(newvalueIsSelected){
     setState(() {
       this.currentItemSeleceted = newvalueIsSelected.toString();
     });
  }
}
