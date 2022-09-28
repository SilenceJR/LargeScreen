part of 'home_page.dart';

class _RightSideWidget extends StatelessWidget {
  final PageController pageController;
  final List<Widget> pages;

  const _RightSideWidget(
      {Key? key, required this.pageController, required this.pages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [$styles.colors.greyStrong, $styles.colors.greyMedium],
              ),
            ),
            child: Column(children: [
              WindowTitleBarBox(
                  child: Row(children: [
                Expanded(child: MoveWindow()),
                const WindowButtons()
              ])),
              Expanded(
                  child: PageView(
                controller: pageController,
                scrollDirection: Axis.vertical,
                children: pages,
              ))
            ])));
  }
}
