import 'package:flutter/foundation.dart';

class MaterialReturn {
  final String title;
  final bool isABook;
  MaterialReturn({required this.title, required this.isABook});
  String toString() => this.title;
}