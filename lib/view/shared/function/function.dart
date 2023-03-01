String? vinputphne(String input) {
  if (input.isEmpty) {
    return 'Please this felid is required';
  } else if (input.length < 11) {
    return 'This is short';
  }
  return null;
}

String? vinputpassword(String input) {
  if (input.isEmpty) {
    return 'Please this felid is required';
  } else if (input.length < 6) {
    return 'Must be grater than 6 latters';
  }
  return null;
}

String? vinputname(String input) {
  if (input.isEmpty) {
    return 'Please this felid is required';
  }
  return null;
}

String? vinputprice(String input) {
  if (input.isEmpty) {
    return 'Please this felid is required';
  } else if (input.length < 2) {
    return 'It must be two numbers or more';
  }
  return null;
}
