import 'package:flutter/material.dart';
import 'package:bmi_126/widgets/constants.dart';
import 'package:bmi_126/widgets/card.dart';
import 'package:numberpicker/numberpicker.dart';
import 'result_bmi.dart';

class InputBMI extends StatefulWidget {
  const InputBMI({Key? key}) : super(key: key);

  @override
  State<InputBMI> createState() => _InputPageState();
}

class _InputPageState extends State<InputBMI> {
  bool? isMaleSelected;
  int height = 170;
  int weight = 60;
  int age = 18;
  String gender = "";

  void ageIncrement() {
    setState(() {
      age++;
    });
  }

  void ageDecrement() {
    setState(() {
      age = (age > 0) ? age - 1 : 0;
    });
  }

  void _showGenderAlertDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'แจ้งเตือน!!',
          style: TextStyle(color: Colors.blue), // Set the title text color
        ),
        content: const Text(
          'โปรดเลือกเพศก่อนคำนวณ BMI',
          style: TextStyle(color: Colors.black), // Set the content text color
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('ตกลง'),
          ),
        ],
        backgroundColor: Colors.white, // Set the background color
        elevation: 10.0, // Set the elevation
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Set the border radius
        ),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: kbackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            'BMI Calculator',
            style: textTheme.bodyMedium,
          ),
        ),
        centerTitle: false,
        titleSpacing: 20,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMaleSelected = true;
                      gender = "male";
                    });
                  },
                  child: AppCard(
                    borderSide: isMaleSelected == true
                        ? const BorderSide(color: Colors.white70, width: 3)
                        : BorderSide.none,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.male,
                          color: Colors.orange,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'ชาย',
                          style: isMaleSelected == true
                              ? textTheme.bodySmall
                              : textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMaleSelected = false;
                      gender = "female";
                    });
                  },
                  child: AppCard(
                    borderSide: isMaleSelected == false
                        ? const BorderSide(color: Colors.white70, width: 3)
                        : BorderSide.none,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.female,
                          color: Colors.pinkAccent,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'หญิง',
                          style: isMaleSelected == false
                              ? textTheme.bodySmall
                              : textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AppCard(
                width: 370,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'ส่วนสูง (ซม.)',
                      style: textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onVerticalDragUpdate: (details) {
                        setState(() {
                          height -= details.primaryDelta!.round();
                          height = height.clamp(120, 220);
                        });
                      },
                      child: NumberPicker(
                        minValue: 120,
                        maxValue: 220,
                        value: height,
                        selectedTextStyle:
                            const TextStyle(color: Colors.white, fontSize: 24),
                        textStyle: const TextStyle(
                            color: Colors.white54, fontSize: 16),
                        axis: Axis.horizontal,
                        itemCount: 5,
                        itemWidth: 60,
                        onChanged: (newValue) {
                          setState(() {
                            height = newValue;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: List.generate(
                        5,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 29),
                          height: index == 2 ? 30 : 20,
                          width: 2,
                          color: index == 2 ? Colors.white : Colors.white54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppCard(
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      Text(
                        'น้ำหนัก (กก.)',
                        style: textTheme.bodySmall,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                        onVerticalDragUpdate: (details) {
                          setState(() {
                            weight -= details.primaryDelta!.round();
                            weight = weight.clamp(10, 150);
                          });
                        },
                        child: Container(
                          height: 80,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.18),
                            border: Border.all(
                              width: 2,
                              color: Colors.grey.withOpacity(.3),
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              const Positioned(
                                bottom: 60,
                                child: RotatedBox(
                                  quarterTurns: 45,
                                  child: Icon(
                                    Icons.play_arrow_rounded,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Center(
                                child: NumberPicker(
                                  minValue: 10,
                                  maxValue: 150,
                                  value: weight,
                                  itemWidth: 40,
                                  selectedTextStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                  textStyle: const TextStyle(
                                    color: Colors.white54,
                                    fontSize: 16,
                                  ),
                                  axis: Axis.horizontal,
                                  onChanged: (newValue) {
                                    setState(() {
                                      weight = newValue;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                AppCard(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'อายุ',
                        style: textTheme.bodySmall,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              ageDecrement();
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.white54,
                                  width: 3,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '-',
                                  style: textTheme.labelSmall,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '$age',
                            style: textTheme.bodyLarge,
                          ),
                          InkWell(
                            onTap: () {
                              ageIncrement();
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.white54,
                                  width: 3,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '+',
                                  style: textTheme.labelSmall,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isMaleSelected == null) {
            _showGenderAlertDialog();
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultBMI(
                  bmi: calculateBMI(height, weight),
                  result: bmiResult(),
                  feedback: bmiFeedBack(),
                  gender: gender,
                ),
              ),
            );
          }
        },
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        shape: const CircleBorder(),
        child: const Text(
          'คำนวณ',
          style: TextStyle(
            color: kbackgroundColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

double bmi = 18;
calculateBMI(int height, int weight) {
  bmi = weight / (height * height) * 10000;
  return bmi.toStringAsFixed(1);
}

bmiResult() {
  if (bmi < 18.5) {
    return 'น้ำหนักต่ำกว่าเกณฑ์';
  } else if (bmi >= 18.5 && bmi < 22.90) {
    return 'น้ำหนักปกติสมส่วน';
  } else if (bmi >= 23 && bmi < 24.90) {
    return 'น้ำหนักเกิน';
  } else if (bmi > 25 && bmi < 29.90) {
    return 'อ้วนระดับ 1';
  } else {
    return 'อ้วนระดับ 2 (อันตราย)';
  }
}

bmiFeedBack() {
  if (bmi < 18.5) {
    return 'ค่า BMI น้อยกว่า 18.5 แสดงว่าอยู่ในเกณฑ์น้ำหนักต่ำกว่าเกณฑ์หรือผอม ซึ่งอาจส่งผลเสียต่อสุขภาพได้หลายประการ ดังนั้นควรเพิ่มน้ำหนักอย่างค่อยเป็นค่อยไป เพื่อให้ร่างกายได้รับสารอาหารและพลังงานที่เพียงพอ และควรปรึกษาแพทย์หรือนักโภชนาการเพื่อขอคำแนะนำที่เหมาะสมกับตนเอง';
  } else if (bmi >= 18.5 && bmi < 22.90) {
    return 'ค่า BMI ระหว่าง 18.5- 22.90 ซึ่งอยู่ในเกณฑ์ปกติ ห่างไกลโรคที่เกิดจากความอ้วน และมีความเสี่ยงต่อการเกิดโรคต่าง ๆ น้อยที่สุด แต่ก็ควรพยายามรักษาระดับค่า BMI ให้อยู่ในระดับนี้ให้นานที่สุด และควรตรวจสุขภาพทุกปี';
  } else if (bmi >= 23 && bmi < 24.90) {
    return 'ค่า BMI ระหว่าง 23 - 24.90 ซึ่งอยู่ในเกณฑ์น้ำหนักเกิน เสี่ยงต่อการเกิดโรคบางชนิด เช่น โรคหัวใจ โรคเบาหวานชนิดที่ 2 โรคข้อเข่าเสื่อม เป็นต้น ควรปรับพฤติกรรมการรับประทานอาหารและออกกำลังกายอย่างสม่ำเสมอ';
  } else if (bmi > 25 && bmi < 30) {
    return 'ค่า BMI ระหว่าง 25 - 29.90  ซึ่งอยู่ในเกณฑ์ อ้วนระดับที่ 1 เสี่ยงต่อการเกิดโรคต่าง ๆ มากขึ้น ควรปรับพฤติกรรมการรับประทานอาหารและออกกำลังกายอย่างเข้มข้นมากขึ้น และอาจต้องปรึกษาแพทย์หรือนักโภชนาการ';
  } else {
    return 'ค่า BMI มากกว่า 30 ซึ่งอยู่ในเกณฑ์ อ้วนระดับที่ 2 เสี่ยงต่อการเกิดโรคต่าง ๆ มาก ควรปรับพฤติกรรมการรับประทานอาหารและออกกำลังกายอย่างเข้มข้นที่สุด และอาจต้องปรึกษาแพทย์หรือนักโภชนาการเพื่อรับการรักษา';
  }
}
