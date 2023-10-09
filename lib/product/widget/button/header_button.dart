
import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/extensions/context_extension.dart';
import 'package:flutter_architecture/view/_product/_constants/game_constants.dart';

class HeaderButton extends StatelessWidget {
  const HeaderButton({Key? key, this.titleText, this.onPressed}) : super(key: key);
  final String? titleText;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLowHorizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [buildTextTitle(context), buildFlatButtonRight(context)],
      ),
    );
  }

  Text buildTextTitle(BuildContext context) {
    return Text(
     GameConstants.title,
      style:  context.textTheme.headline5!.copyWith(color: context.colors.onError),
    );
  }

  Widget buildFlatButtonRight(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
           GameConstants.viewAll,
            style: context.textTheme.bodyMedium!.copyWith(color: context.colors.onError),
          ),
          Icon(Icons.arrow_right, color: context.colors.onError)
        ],
      ),
    );
  }
}