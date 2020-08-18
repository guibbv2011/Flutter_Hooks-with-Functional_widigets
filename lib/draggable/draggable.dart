import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'draggable.g.dart';

@hwidget
Widget dragablleApp() {
  final coughtColor = useState(Colors.white);
  final size = MediaQuery.of(useContext()).size;
  return Container(
    width: size.width * 0.9,
    height: size.height * 0.9,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          DragBox(Offset(size.aspectRatio * 0.25, 0.0), 'Box one', Colors.blue),
          DragBox(
              Offset(size.aspectRatio * 0.50, 0.0), 'Box two', Colors.orange),
          DragBox(Offset(size.aspectRatio * 0.75, 0.0), 'Box tree', Colors.red),
          Positioned(
            left: size.shortestSide * 0.5,
            bottom: size.shortestSide * 0.0,
            child: DragTarget(
              onAccept: (Color color) => coughtColor.value = color,
              builder: (context, accept, rejected) {
                return Container(
                  width: size.shortestSide * 0.75,
                  height: size.shortestSide * 0.3,
                  decoration: BoxDecoration(
                    color: accept.isEmpty
                        ? coughtColor.value
                        : Colors.grey.shade100,
                  ),
                  child: Center(
                    child: Text('Drag Here'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}

@hwidget
Widget dragBox(Offset initPos, String label, Color itemColor) {
  final shortSide = MediaQuery.of(useContext()).size.shortestSide;
  final position = useState(initPos);
  return Positioned(
    left: position.value.dx,
    top: position.value.dy,
    child: Draggable(
      data: itemColor,
      child: Container(
        width: shortSide * 0.2,
        height: shortSide * 0.2,
        color: itemColor,
        child: Center(
          child: Text(label),
        ),
      ),
      onDraggableCanceled: (velocity, offset) => position.value = offset,
      feedback: Material(
        child: Container(
          width: shortSide * 0.2,
          height: shortSide * 0.2,
          color: itemColor.withOpacity(0.3),
          child: Center(
            child: Text(label),
          ),
        ),
      ),
    ),
  );
}
