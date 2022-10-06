import 'package:flutter/material.dart';
import 'package:task/presentation/resources/color_manager.dart';
import 'package:task/presentation/resources/styles_manager.dart';


class ExpandableText extends StatefulWidget {
  ExpandableText(this.text);

  final String text;
  bool isExpanded = false;

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText>
    with TickerProviderStateMixin<ExpandableText> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AnimatedSize(
              vsync: this,

              duration: const Duration(milliseconds: 500),
              child: ConstrainedBox(
                  constraints: widget.isExpanded
                      ?const  BoxConstraints()
                      : const BoxConstraints(maxHeight: 50.0),
                  child: Text(
                    widget.text,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    style: getRegularStyle(color: ColorManager.textColor)
                  ))),
          widget.isExpanded
              ? InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Read Less',
                        style: getRegularStyle(color: ColorManager.primary)
                      ),
                      //  Icon(Icons.keyboard_arrow_up,
                      //     size: AppSize.s20, color:ColorManager.primary)
                    ],
                  ),
                  onTap: () =>
                      setState(() => widget.isExpanded = !widget.isExpanded))
              : InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Read More',
                          style: getRegularStyle(color: ColorManager.primary)
                      ),
                      //  Icon(Icons.keyboard_arrow_down,
                      //     size: AppSize.s20, color:ColorManager.primary)
                    ],
                  ),
                  onTap: () =>
                      setState(() => widget.isExpanded = !widget.isExpanded))
        ]);
  }
}
