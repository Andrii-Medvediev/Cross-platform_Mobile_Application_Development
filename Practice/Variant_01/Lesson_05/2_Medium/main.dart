// ignore_for_file: equal_elements_in_set

void main() {
  Set<String> phoneNumbers = {
    "+380501112233",
    "+380501112233",
    "+380671234567",
    "+380931234567",
  };

  print("Унікальні номери телефонів:");
  for (var phone in phoneNumbers) {
    print(phone);
  }

  print("Всього унікальних клієнтів: ${phoneNumbers.length}");

  String checkNumber = "+380671234567";
  print("Містить $checkNumber: ${phoneNumbers.contains(checkNumber)}");
}
