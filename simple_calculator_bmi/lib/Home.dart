import 'package:flutter/material.dart';
import 'package:simple_calculator_bmi/InputBmi.dart';

import 'utils/ViewUtils.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Nilai BMI (IMT)	Kategori
  // < 17,0	Kurus, Kekurangan berat badan berat
  // 17,0 – 18,4	Kurus, Kekurangan berat badan ringan
  // 18,5 – 25,0	Normal
  // 25,1 – 27,0	Gemuk, Kelebihan berat badan tingkat ringan
  // > 27	Gemuk, Kelebihan berat badan tingkat berat
  // https://ilmupengetahuanumum.com/rumus-dan-cara-menghitung-bmi-body-mass-index/
// BMI = Berat Badan / (Tinggi Badan * Tinggi Badan)

  TextEditingController userTinggi = TextEditingController();
  TextEditingController userBerat = TextEditingController();

  String result = "";

  @override
  Widget build(BuildContext context) {
    String calculateBmi(InputBmi userData) {
      double bmi =
          userData.tinggi / (userData.berat / 100 * userData.berat / 100);

      String bmiResult = bmi.toString();

      print("BMI Result" + bmiResult);
      if (bmi < 17.0) {
        bmiResult = "Kurus, Kekurangan berat badan berat";
      } else if (bmi > 17.0 && bmi < 18.49) {
        bmiResult = "Kurus, Kekurangan Berat Badan Ringan";
      } else if (bmi > 18.5 && bmi < 25.49) {
        bmiResult = "Normal";
      } else if (bmi > 25.1 && bmi < 27.0) {
        bmiResult = "Gemuk, Kelebihan berat badan tingkat ringan";
      } else {
        bmiResult = "Gemuk, Kelebihan berat badan tingkat berat";
      }

      return bmiResult;
    }

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "BMI Calculator",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 38,
                    color: Colors.white),
              ),
              TextFormField(
                  keyboardType: TextInputType.number,
                  controller: userTinggi,
                  decoration: InputDecoration(
                    hintText: "Tinggi",
                    hintStyle: TextStyle(color: Colors.white),
                  )),
              TextFormField(
                inputFormatters: [],
                keyboardType: TextInputType.number,
                controller: userBerat,
                decoration: InputDecoration(
                  hintText: "Berat Badan",
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      print("Calculate Clicked");

                      setState(() {
                        InputBmi userData = new InputBmi();

                        userData.tinggi =
                            double.parse(userTinggi.text.toString());
                        userData.berat =
                            double.parse(userBerat.text.toString());
                        print(" result userdata" +
                            userData.tinggi.toString() +
                            " " +
                            userData.berat.toString());

                        if (userData != null) {
                          result = calculateBmi(userData);
                          print(" result" + result);
                        } else {
                          //user or pass wrong
                          ViewUtils().showToast(
                              "Masukkan Tinggi badan dan/atau Berat Badan");
                        }
                      });
                    },
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                          fontSize: 18, color: Colors.blueGrey.shade900),
                    ),
                  ),
                ),
              ),
              Text(
                "$result",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
