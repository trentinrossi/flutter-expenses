import 'package:flutter/material.dart';

class GraphBar extends StatelessWidget {
  final String? label;
  final double? value;
  final double? percentage;

  const GraphBar({
    this.label,
    this.value,
    this.percentage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: [
            SizedBox(
              height: constraints.maxHeight * 0.10,
              child: FittedBox(
                child: Text(value!.toStringAsFixed(2),
                    style: Theme.of(context).textTheme.bodySmall),
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.05),
            SizedBox(
              height: constraints.maxHeight * 0.7,
              width: 18,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  FractionallySizedBox(
                    heightFactor: percentage,
                    child: Container(
                      width: 15,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.05),
            SizedBox(
              height: constraints.maxHeight * 0.10,
              child: FittedBox(
                child: Text(label!),
              ),
            ),
          ],
        );
      },
    );
  }
}
