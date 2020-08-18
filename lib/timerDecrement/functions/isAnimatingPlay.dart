isAnimatingPlay({mtd: Function, animate: Function}) => () {
      if (mtd.isAnimating) {
        mtd.stop();
        animate.value = false;
      } else {
        mtd.forward(
          from: mtd.value == 0.0 ? 1.0 : mtd.value,
        );
        animate.value = true;
      }
    };
