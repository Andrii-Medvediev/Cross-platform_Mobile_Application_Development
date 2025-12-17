void main() {
  int position = 5;
  String status;

  if (position == 1) {
    status = "На обслуговуванні";
  } else if (position <= 5) {
    status = "Скоро буде обслуговування";
  } else {
    status = "Очікування довге";
  }

  print(status);
}
