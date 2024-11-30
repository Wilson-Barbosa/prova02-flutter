class ImcCalculator {
  double weight;
  double height;

  ImcCalculator({required this.weight, required this.height});

  double calculateImc() {
    return weight / (height * height);
  }

  String returnMessage() {
    double imc = calculateImc();
    String message = "";

    if (imc < 18.5) {
      message = "Abaixo do peso";
    } else if (imc >= 18.5 && imc < 25) {
      message = "Seu peso é normal";
    } else if (imc >= 25 && imc < 30) {
      message = "Possível sobrepeso";
    } else if (imc >= 30 && imc < 35) {
      message = "Obsidade grau 1";
    } else if(imc >=35 && imc < 40) {
      message = "Obesidade grau 2";
    } else if(imc >= 40 ) {
      message = "Obesidade grau 3";
    }
    
    return message;
  }
}
