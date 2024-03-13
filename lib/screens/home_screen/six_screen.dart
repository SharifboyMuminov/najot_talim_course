import 'package:flutter/material.dart';

class SixScreen extends StatefulWidget {
  const SixScreen({super.key});

  @override
  State<SixScreen> createState() => _SixScreenState();
}

class _SixScreenState extends State<SixScreen> {
  late AnimationController animationController;
  double right = 110;
  double left = 110;
  double bottom = 330;
  double top = 330;
  bool isTop = false;
  bool isRight = false;
  bool isLeft = false;
  bool isBottom = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          AnimatedPositioned(
            top: top,
            left: left,
            right: right,
            bottom: bottom,
            curve: Curves.linear,
            duration: const Duration(milliseconds: 300),
            child: Container(
              color: Colors.blue,
            ),
          ),
          Positioned(
            bottom: 50,
            left: 50,
            right: 50,
            child: Column(
              children: [
                TextButton(
                  onPressed: () async {
                    isRight = false;
                    isLeft = false;
                    isBottom = false;
                    isTop = true;
                    setState(() {});
                    while (true) {
                      await Future.delayed(const Duration(milliseconds: 100));
                      if (top - 20 < 0) {
                        setState(() {});
                        break;
                      } else if (isTop) {
                        top = top - 20;
                        bottom = bottom + 20;
                        setState(() {});
                      } else {
                        break;
                      }
                    }
                  },
                  child: const Icon(
                    Icons.arrow_upward_outlined,
                    size: 40,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () async {
                        isRight = false;
                        isTop = false;
                        isBottom = false;
                        isLeft = true;
                        setState(() {});

                        while (true) {
                          await Future.delayed(
                              const Duration(milliseconds: 100));
                          if (left - 20 < 0) {
                            break;
                          } else if (isLeft) {
                            left = left - 20;
                            right = right + 20;
                            setState(() {});
                          } else {
                            break;
                          }
                        }
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 40,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        isRight = false;
                        isTop = false;
                        isBottom = false;
                        isLeft = false;
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.stop,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        isRight = true;
                        isLeft = false;
                        isBottom = false;
                        isTop = false;

                        while (true) {
                          await Future.delayed(
                              const Duration(milliseconds: 100));
                          if (right - 20 < 0) {
                            setState(() {});
                            break;
                          } else if (isRight) {
                            right = right - 20;
                            left = left + 20;
                            setState(() {});
                          } else {
                            break;
                          }
                        }
                      },
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () async {
                    isTop = false;
                    isRight = false;
                    isLeft = false;
                    isBottom = true;
                    while (true) {
                      await Future.delayed(const Duration(milliseconds: 100));
                      if (bottom - 20 < 0) {
                        setState(() {});
                        break;
                      } else if (isBottom) {
                        bottom = bottom - 20;
                        top = top + 20;
                        setState(() {});
                      } else {
                        break;
                      }
                    }
                  },
                  child: const Icon(
                    Icons.arrow_downward,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
