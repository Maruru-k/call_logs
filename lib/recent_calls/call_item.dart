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
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8,left: 14),
      child: Row(
        children: [
          SizedBox(
            child: widget.call.unmissed
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
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    widget.call.person +
                        (widget.call.count > 1 ? "(${widget.call.count})" : ""),
                    style: AppTextStyle.bold17(
                      color: !widget.call.unmissed ? Colors.red[400] : null,
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
      ),
    );
  }
}
