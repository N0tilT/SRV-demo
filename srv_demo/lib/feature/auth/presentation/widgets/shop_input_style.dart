import 'package:flutter/material.dart';

final shopInputStyle = InputDecoration(
  fillColor: Colors.white,
  constraints: const BoxConstraints(maxHeight: 40),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(
      color: Colors.red, // Цвет границы при ошибке
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(
      color: Colors.red, // Цвет границы при фокусе и ошибке
    ),
  ),
  filled: true,
  errorStyle: const TextStyle(
    color: Colors.red, // Цвет текста ошибки
  ),
  hintStyle: const TextStyle(
    color: Colors.black, // Цвет подсказки
  ),
  labelStyle: const TextStyle(
    color: Colors.black, // Цвет текста внутри поля
  ),
);
