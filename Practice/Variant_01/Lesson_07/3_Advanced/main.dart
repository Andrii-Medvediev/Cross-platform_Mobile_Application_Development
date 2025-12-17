void main() {
  int position = 22;
  String status;

  switch (position) {
    case 1:
      status = "На обслуговуванні";
      break;
    case 2:
    case 3:
    case 4:
    case 5:
      status = "Скоро обслуговування";
      break;
    default:
      status = position > 20 ? "Дуже довге очікування" : "Очікування довге";
  }

  print(status);
}
