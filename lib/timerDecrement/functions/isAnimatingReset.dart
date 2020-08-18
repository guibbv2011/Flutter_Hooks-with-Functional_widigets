isAnimatingReset({mtd: Function, animate: Function}) => () {
      if (mtd.isAnimating) {
        mtd
          ..stop(canceled: true)
          ..reset();
        animate.value = false;
      }
    };
