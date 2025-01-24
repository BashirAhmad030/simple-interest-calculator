import 'package:flutter/material.dart';

class SIForm extends StatefulWidget {
  const SIForm({super.key});

  @override
  State<SIForm> createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {
  final _formKey = GlobalKey<FormState>();

  final _currences = [
    "Rupees",
    "Dolors",
    "pounds",
  ];
  var currentItemSeleceted = " ";

  @override
  void initState() {
    super.initState();
    currentItemSeleceted = _currences[0];
  }

  final _miinimumPadding = 5.0;
  TextEditingController pricipalControllor = TextEditingController();
  TextEditingController roiControllor = TextEditingController();
  TextEditingController termControllor = TextEditingController();

  var displayResult = "";

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.titleMedium;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text("Simple Interest Calculator"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(_miinimumPadding * 2),
          child: ListView(
            children: [
              getAssetImage(),
              Padding(
                padding: EdgeInsets.only(
                    top: _miinimumPadding, bottom: _miinimumPadding),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  controller: pricipalControllor,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Principal Amount";
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Principle",
                      hintText: " Enter Principle  eg 12000",
                      labelStyle: textStyle,
                      errorStyle: const TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 15.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: _miinimumPadding, bottom: _miinimumPadding),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  controller: roiControllor,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Rate of Interest";
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Rate of Interest",
                      hintText: " In Percent",
                      labelStyle: textStyle,
                      errorStyle: const TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 15.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: _miinimumPadding, bottom: _miinimumPadding),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: textStyle,
                        controller: termControllor,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Time in Years";
                          }
                        },
                        decoration: InputDecoration(
                            labelText: "Term",
                            hintText: " Time in Years",
                            labelStyle: textStyle,
                            errorStyle: const TextStyle(
                              color: Colors.yellowAccent,
                              fontSize: 15.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: _miinimumPadding * 5,
                    ),
                    Expanded(
                      child: DropdownButton<String>(
                        items: _currences.map((dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (newvalueIsSelected) {
                          // Your code to execute, When a menu item selected from the Drop Down
                          _onDropDownButtonState(newvalueIsSelected);
                        },
                        value: currentItemSeleceted,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: _miinimumPadding, bottom: _miinimumPadding),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (_formKey.currentState!.validate()) {
                              this.displayResult = _calculateTotolReturns();
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Theme.of(context).primaryColorDark,
                          backgroundColor: Colors.indigoAccent,
                        ),
                        child: const Text(
                          "Calculate",
                          textScaleFactor: 1.5,
                        ),
                      ),
                    ),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _resetResult();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Theme.of(context).primaryColorLight,
                          backgroundColor: Theme.of(context).primaryColorDark),
                      child: const Text("Reset",
                          textScaler: TextScaler.linear(1.5)),
                    )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(_miinimumPadding * 2),
                child: Text(
                  displayResult,
                  style: textStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getAssetImage() {
    AssetImage assetImage = const AssetImage("assets/money.png");
    Image image = Image(
      image: assetImage,
      width: 125.0,
      height: 125.0,
    );
    return Container(
      margin: EdgeInsets.all(_miinimumPadding * 10.5),
      child: image,
    );
  }

  String _calculateTotolReturns() {
    double pricipal = double.parse(pricipalControllor.text);
    double roi = double.parse(roiControllor.text);
    double term = double.parse(termControllor.text);
    double totalAmaountPaybile = pricipal + (pricipal * roi * term) / 100;
    String result =
        "After $term years, your investment will be worth $totalAmaountPaybile $currentItemSeleceted";
    return result;
  }

  void _resetResult() {
    termControllor.text = "";
    pricipalControllor.text = "";
    roiControllor.text = "";
    displayResult = " ";
    currentItemSeleceted = _currences[0];
  }

  void _onDropDownButtonState(newvalueIsSelected) {
    setState(() {
      this.currentItemSeleceted = newvalueIsSelected.toString();
    });
  }
}
