import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _MainScroll(),
        const Positioned(
          bottom: 0,
          child: ButtonTheme(),
        )
      ],
    ));
  }
}

class ButtonTheme extends StatelessWidget {
  const ButtonTheme({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 20),
      width: size.width,
      height: 100,
      decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
      child: const Text(
        'Add a new Item',
        style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 3),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    const _ListItem(title: 'Orange', color: Color.fromARGB(255, 25, 40, 168)),
    const _ListItem(title: 'Family', color: Color.fromARGB(255, 125, 109, 156)),
    const _ListItem(
        title: 'Subscriptions', color: Color.fromARGB(255, 207, 44, 74)),
    const _ListItem(title: 'Books', color: Color.fromARGB(255, 209, 26, 163)),
    const _ListItem(title: 'Orange', color: Color.fromARGB(255, 207, 80, 25)),
    const _ListItem(title: 'Family', color: Color.fromARGB(255, 207, 61, 17)),
    const _ListItem(
        title: 'Subscriptions', color: Color.fromARGB(255, 18, 214, 60)),
    const _ListItem(title: 'Books', color: Color.fromARGB(255, 224, 55, 154)),
  ];
  _MainScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        // const SliverAppBar(
        //   floating: true,
        //   backgroundColor: Colors.red,
        //   title: Text('Hellow wordls'),
        // ),
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverHeaderPersonalizado(
              minHeight: 200,
              maxHeight: 250,
              child: Container(
                alignment: Alignment.centerLeft,
                color: Colors.white,
                child: _Titulo(),
              )),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          ...items,
          const SizedBox(
            height: 120,
          )
        ]))
      ],
    );
  }
}

class _SliverHeaderPersonalizado extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;
  _SliverHeaderPersonalizado({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight;
  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxExtent ||
        minHeight != oldDelegate.minExtent ||
        child != child;
  }
}

class _Titulo extends StatelessWidget {
  const _Titulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          // color: Colors.red,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: const Text(
            'New ',
            style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
          ),
        ),
        Stack(
          children: [
            Container(
              // color: Colors.blue,
              child: const Text(
                'List ',
                style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
            Positioned(
              bottom: 5,
              child: Container(
                height: 4,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color.fromARGB(255, 70, 244, 54)),
              ),
            )
          ],
        )
      ],
    );
  }
}

class _ListaTareas extends StatelessWidget {
  final items = [
    const _ListItem(title: 'Orange', color: Color.fromARGB(255, 25, 40, 168)),
    const _ListItem(title: 'Family', color: Color.fromARGB(255, 125, 109, 156)),
    const _ListItem(
        title: 'Subscriptions', color: Color.fromARGB(255, 207, 44, 74)),
    const _ListItem(title: 'Books', color: Color.fromARGB(255, 209, 26, 163)),
    const _ListItem(title: 'Orange', color: Color.fromARGB(255, 207, 80, 25)),
    const _ListItem(title: 'Family', color: Color.fromARGB(255, 207, 61, 17)),
    const _ListItem(
        title: 'Subscriptions', color: Color.fromARGB(255, 18, 214, 60)),
    const _ListItem(title: 'Books', color: Color.fromARGB(255, 224, 55, 154)),
  ];

  _ListaTareas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext, int index) => items[index]);
  }
}

class _ListItem extends StatelessWidget {
  final Color color;
  final String title;
  const _ListItem({
    Key? key,
    required this.color,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(10),
      height: 150,
      // width: 90,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color,
      ),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
      ),
    );
  }
}
