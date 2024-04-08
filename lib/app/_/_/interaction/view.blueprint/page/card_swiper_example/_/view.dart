import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import '../../../../../../../../main.dart';
import '../item/view.dart';
import '_/state_child.dart';
import '_/state_mother.dart';

class NewView extends StatefulWidget {
  NewView({super.key});

  @override
  State<NewView> createState() => StateChild();
}

class NewViewState extends State<NewView> with StateMother {
  final CardSwiperController controller = CardSwiperController();

  List<Widget> cards = [
    ItemView(
      name: 'One, 1',
      job: 'Developer',
      city: 'Areado',
      color: const [Color(0xFFFF3868), Color(0xFFFFB49A)],
    ),
    ItemView(
      name: 'Two, 2',
      job: 'Manager',
      city: 'New York',
      color: const [Color(0xFF736EFE), Color(0xFF62E4EC)],
    ),
    ItemView(
      name: 'Three, 3',
      job: 'Engineer',
      city: 'London',
      color: const [Color(0xFF2F80ED), Color(0xFF56CCF2)],
    ),
    ItemView(
      name: 'Four, 4',
      job: 'Designer',
      city: 'Tokyo',
      color: const [Color(0xFF0BA4E0), Color(0xFFA9E4BD)],
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return CardSwiper(
      controller: controller,
      cardsCount: cards.length,
      onSwipe: (
        int previousIndex,
        int? currentIndex,
        CardSwiperDirection direction,
      ) {
        debugPrint(
          'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
        );
        return true;
      },
      onUndo: (
          int? previousIndex,
          int currentIndex,
          CardSwiperDirection direction,
          ) {
        debugPrint(
          'The card $currentIndex was undod from the ${direction.name}',
        );
        return true;
      },
      numberOfCardsDisplayed: 3,
      backCardOffset: const Offset(40, 40),
      padding: const EdgeInsets.all(24.0),
      cardBuilder: (
        context,
        index,
        horizontalThresholdPercentage,
        verticalThresholdPercentage,
      ) =>
          cards[index],
    );
  }
}

main() async {
  return buildApp(appHome: NewView());
}
