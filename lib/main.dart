import 'package:flutter/material.dart';
import 'btnvalue.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String number1 = "";
  String operator = "";
  String number2 = "";

  //---ButtonColor--
  Color getcolor(value) {
    return [Btn.del, Btn.calculate].contains(value)
        ? Colors.indigo
        : [Btn.per, Btn.multiply, Btn.divide, Btn.subtract, Btn.add, Btn.clr]
                .contains(value)
            ? Colors.orange
            : Colors.grey;
  }

  void onbtntab(String value){

    if(value!=Btn.dot && int.tryParse(value)== null){

    }

    setState(() {
      number1+=value;
      operator+=value;
      number2+=value;

    });
  }

  //-----Button Builder----
  Widget buildButton(value) {

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Material(
        color: getcolor(value),
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white38),
            borderRadius: BorderRadius.circular(100)),
        child: InkWell(
          onTap: () => onbtntab(value),
          child: Center(
              child: Text(
            value,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white
            ),
          )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Calculator",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.indigo,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(190, 60),
        )),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.bottomRight,
                  color: Colors.black,
                  child: Text(
                    "$number1$operator$number2".isEmpty
                        ? "0"
                        : "$number1$operator$number2",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),
            Wrap(
              children: Btn.BtnValue.map(
                (value) => SizedBox(
                    height: screen.height / 8,
                    width: value == Btn.n0
                        ? screen.width / 2.3
                        : (screen.width / 4.5),
                    child: buildButton(value)
                ),
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
