import 'package:flutter/material.dart';

class ResultBMI extends StatelessWidget {
  final String bmi;
  final String result;
  final String feedback;
  final String gender;

  const ResultBMI({
    super.key,
    required this.bmi,
    required this.result,
    required this.feedback,
    required this.gender,
  });

  Color getBackgroundColor() {
    double bmiValue = double.parse(bmi);
    if (bmiValue < 18.5) {
      return Colors.blue; // น้ำหนักต่ำกว่าเกณฑ์
    } else if (bmiValue >= 18.5 && bmiValue < 22.90) {
      return Colors.green; // น้ำหนักปกติสมส่วน
    } else if (bmiValue >= 23 && bmiValue < 24.90) {
      return const Color.fromARGB(255, 241, 164, 11); // น้ำหนักเกิน
    } else if (bmiValue > 25 && bmiValue < 29.90) {
      return const Color.fromARGB(255, 255, 111, 0); // อ้วนระดับ 1
    } else {
      return Colors.red; // อ้วนระดับ 2 (อันตราย)
    }
  }

  String getImagePath() {
    double bmiValue = double.parse(bmi);
    String genderFolder = gender == 'male' ? 'male' : 'female';
    String picName = "";

    if (bmiValue < 18.5) {
      picName = 'underweight';
    } else if (bmiValue >= 18.5 && bmiValue < 22.90) {
      picName = 'normal';
    } else if (bmiValue >= 23 && bmiValue < 24.90) {
      picName = 'overweight';
    } else if (bmiValue > 25 && bmiValue < 29.90) {
      picName = 'obese1';
    } else {
      picName = 'obese2';
    }

    return 'assets/images/$genderFolder/$picName.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Result'),
      ),
      body: Container(
        color: getBackgroundColor(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  getImagePath(),
                  width: 400,
                  height: 400,
                ),
                Text(
                  'ค่า BMI ของคุณอยู่ที่ : $bmi',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  result,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  feedback,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('ลองใหม่อีกครั้ง'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
