
String removeUnicodeApostrophes(String strInput) {
  // First remove the single slash.
  String strModified = strInput.replaceAll(String.fromCharCode(92), "");
  // Now, we can replace the rest of the unicode with a proper apostrophe.
  return strModified.replaceAll("u0027", "\'");
}