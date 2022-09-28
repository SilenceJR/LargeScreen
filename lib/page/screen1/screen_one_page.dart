import 'package:flutter/material.dart';

class Screen1Page extends StatefulWidget {
  const Screen1Page({Key? key}) : super(key: key);

  @override
  State<Screen1Page> createState() => _Screen1PageState();
}

class _Screen1PageState extends State<Screen1Page> {
  final images = [
    'https://img0.baidu.com/it/u=922902802,2128943538&fm=253&fmt=auto&app=120&f=JPEG?w=1422&h=800',
    'https://img1.baidu.com/it/u=3622442929,3246643478&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500',
    'https://t7.baidu.com/it/u=1415984692,3889465312&fm=193&f=GIF',
    'https://t7.baidu.com/it/u=1819248061,230866778&fm=193&f=GIF',
    'https://t7.baidu.com/it/u=4036010509,3445021118&fm=193&f=GIF',
    'https://t7.baidu.com/it/u=963301259,1982396977&fm=193&f=GIF',
    'https://t7.baidu.com/it/u=1575628574,1150213623&fm=193&f=GIF',
    'https://t7.baidu.com/it/u=91673060,7145840&fm=193&f=GIF',
    'https://t7.baidu.com/it/u=2291349828,4144427007&fm=193&f=GIF',
    'https://t7.baidu.com/it/u=1297102096,3476971300&fm=193&f=GIF',
    'https://t7.baidu.com/it/u=852388090,130270862&fm=193&f=GIF',
    'https://t7.baidu.com/it/u=4240641596,3235181048&fm=193&f=GIF',
    'https://t7.baidu.com/it/u=3655946603,4193416998&fm=193&f=GIF',
    'https://t7.baidu.com/it/u=3078321260,3840584311&fm=193&f=GIF',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Container(
            decoration: const BoxDecoration(color: Colors.black38),
          ),
        ),
        Image.network(
          images[0],
          fit: BoxFit.fitWidth,
          width: 320,
          height: 600,
          loadingBuilder: (
            BuildContext context,
            Widget child,
            ImageChunkEvent? loadingProgress,
          ) {
            return const CircularProgressIndicator();
          },
        ),
        SizedBox.expand(
          child: GridView.builder(
            // shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8,
                childAspectRatio: 1.687,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20
                // childAspectRatio: 1.2,
                ),
            itemBuilder: (_, index) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Image.network(
                  images[index],
                  fit: BoxFit.fitWidth,
                  width: 320,
                  height: 600,
                  loadingBuilder: (
                    BuildContext context,
                    Widget child,
                    ImageChunkEvent? loadingProgress,
                  ) {
                    return const CircularProgressIndicator();
                  },
                ),
              );
            },
            itemCount: images.length,
          ),
        ),
      ],
    );
  }
}
