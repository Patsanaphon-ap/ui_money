import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ui_money/src/ui/widget/my_text.dart';

class MyAppbar extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const MyAppbar({super.key, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        children: [
          Flexible(
              flex: 1,
              child: CircleAvatar(
                child: SvgPicture.asset('assets/icons/avatar.svg'),
              )),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text16Normal(
                  title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                text18Bold(
                  subtitle ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                    width: .5,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: const Icon(Icons.notifications_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyAppbarDefault extends StatelessWidget {
  final String? title;
  const MyAppbarDefault({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        iconSize: 24,
        icon: const Icon(
          Icons.arrow_back_ios_new_outlined,
        ),
        onPressed: () {
          Get.back();
        },
      ),
      title: text24Bold(
        title ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
