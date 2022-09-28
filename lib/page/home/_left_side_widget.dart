part of 'home_page.dart';

class _LeftSideWidget extends StatelessWidget {
  final PageController pageController;
  final List<Widget> pages;

  const _LeftSideWidget(
      {Key? key, required this.pageController, required this.pages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.2,
        color: $styles.colors.greyStrong,
        child: Column(
          children: [
            WindowTitleBarBox(child: MoveWindow()),
            Expanded(
                child: Column(
              children: [
                ...pages
                    .map((e) => SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              pageController.animateToPage(pages.indexOf(e),
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut);
                            },
                            child: Text('${e.runtimeType}'))))
                    .toList(),
              ],
            ))
          ],
        ));
  }
}
