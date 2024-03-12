import 'package:flutter/material.dart';

class SixScreen extends StatefulWidget {
  const SixScreen({super.key});

  @override
  State<SixScreen> createState() => _SixScreenState();
}

class _SixScreenState extends State<SixScreen> {
  double right = 110;
  double left = 110;
  double bottom = 330;
  double top = 330;

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
                  onPressed: () {
                    top = top - 20;
                    bottom = bottom + 20;
                    setState(() {});
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
                      onPressed: () {
                        left = left - 20;
                        right = right + 20;
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 40,
                      ),
                    ),
                    const SizedBox(width: 20),
                    TextButton(
                      onPressed: () {
                        right = right - 20;
                        left = left + 20;
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    bottom = bottom - 20;
                    top = top + 20;
                    setState(() {});
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
