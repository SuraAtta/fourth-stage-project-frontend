import 'package:flutter/cupertino.dart';

import 'prodect_body.dart';

class HomeProdectsBar extends StatefulWidget {
  const HomeProdectsBar({Key? key}) : super(key: key);

  @override
  State<HomeProdectsBar> createState() => _HomeProdectsBarState();
}

class _HomeProdectsBarState extends State<HomeProdectsBar> {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              reverse: true,
              itemCount: 20,
              itemBuilder: (BuildContext context, index) {
                return CartBody();
              })
    )
    ]);
  }
}
