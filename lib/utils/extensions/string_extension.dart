extension StringExtension on String {
  bool equals(String str) => str != null && this == str;

  bool notEmpty() => this.isNotEmpty;

  bool greaterThan(String str) => this.length > str.length;

  bool lessThan(String str) => this.length < str.length;
}