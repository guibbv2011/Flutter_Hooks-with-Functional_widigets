import 'package:flutter/material.dart';

textControl({mtd: Function, time: Function}) {
  return Text(
    mtd.isAnimating == false
        ? '${mtd.duration.inMinutes}:${(mtd.duration.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${time.inMinutes}:${(time.inSeconds % 60).toString().padLeft(2, '0')}',
    style: TextStyle(fontSize: 30.0),
  );
}
