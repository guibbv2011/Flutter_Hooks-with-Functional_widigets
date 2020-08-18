import 'package:flutter/material.dart';

sliderControl({timer: Function, mtd: Function, int div, max}) {
  return Slider(
    value: timer.value,
    min: 0.0,
    max: max,
    onChanged: (value) {
      if (mtd.isAnimating == false) {
        timer.value = value;
      }
    },
    divisions: div,
    label: timer.value.toString(),
  );
}
