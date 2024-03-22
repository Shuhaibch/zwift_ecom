import 'package:ecommerce/commen/widgets/custom_shapes/container/circular_containers.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CChooiceChip extends StatelessWidget {
  const CChooiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;
  @override
  Widget build(BuildContext context) {
    final isColor = CHelperFuntions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? CColors.whiteColor : null),
        avatar: isColor
            ? CCircularContainer(
                width: 50,
                height: 50,
                backgroundColor: CHelperFuntions.getColor(text)!)
            : null,
        shape: isColor ? const CircleBorder() : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        // selectedColor: Colors.green,
        backgroundColor: isColor ? CHelperFuntions.getColor(text)! : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
      ),
    );
  }
}
