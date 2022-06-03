import 'package:call_logs/model/call.dart';
import 'package:flutter/material.dart';

import 'package:call_logs/styles/colors.dart';
import 'package:call_logs/styles/text_styles.dart';

class CallCard extends StatefulWidget {
  final Call call;

  const CallCard({Key? key, required this.call}) : super(key: key);

  @override
  State<CallCard> createState() => _CallCardState();
}

class _CallCardState extends State<CallCard> {
  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: EdgeInsets.only(left: 14, top: 15, right: 14, bottom: 31),
    //   child: ListTile(
    //     leading: Icon(
    //       Icons.phone_forwarded,
    //       color: AppColor.tertiary,
    //       size: 24,
    //     ),
    //     title: Text('+0 (000) 000-00-00', style: AppTextStyle.bold17()),
    //     subtitle: Text('Доп. информация', style: AppTextStyle.regular15()),
    //     trailing: Row(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         Text('Дата', style: AppTextStyle.regular15()),
    //         IconButton(
    //             padding: const EdgeInsets.only(left: 8, right: 21),
    //             onPressed: () => Navigator.pushNamed(context, '/info'),
    //             icon: const Icon(
    //               Icons.info_outlined,
    //               color: AppColor.link,
    //               size: 22,
    //             )),
    //       ],
    //     ),
    //   ),
    // );
    return Row(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 14, top: 15, right: 14, bottom: 31),
          child: !widget.call.missed
              ? widget.call.type == "audio" || widget.call.type == "incoming"
                  ? const Icon(
                      Icons.phone_forwarded,
                      color: AppColor.tertiary,
                      size: 14,
                    )
                  : const Icon(
                      Icons.video_call,
                      color: AppColor.tertiary,
                      size: 14,
                    )
              : const SizedBox(height: 14, width: 14),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  widget.call.person +
                      (widget.call.calls > 1 ? "(${widget.call.calls})" : ""),
                  style: AppTextStyle.bold17(
                    color: widget.call.missed ? Colors.red[400] : null,
                  )),
              Text(widget.call.additional, style: AppTextStyle.regular15()),
            ],
          ),
        ),
        Text(widget.call.date, style: AppTextStyle.regular15()),
        IconButton(
            padding: const EdgeInsets.only(left: 8, right: 21),
            onPressed: () => Navigator.pushNamed(context, '/info'),
            icon: const Icon(
              Icons.info_outlined,
              color: AppColor.link,
              size: 22,
            )),
      ],
    );
  }
}
