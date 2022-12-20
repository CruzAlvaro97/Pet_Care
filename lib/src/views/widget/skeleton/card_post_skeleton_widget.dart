import 'package:flutter/material.dart';
import 'package:pet_society/src/views/widget/decoration_widget/container_decoration_widget.dart';
import 'package:skeletons/skeletons.dart';

class CardPostSkeletonWidget extends StatelessWidget {
  const CardPostSkeletonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          decoration: containerDecoration(),
          child: SkeletonItem(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _HeaderCardSkeleton(),
                const SizedBox(height: 5.0),
                SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                    lines: 3,
                    spacing: 6,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                    lineStyle: SkeletonLineStyle(
                      randomLength: true,
                      height: 10,
                      borderRadius: BorderRadius.circular(8),
                      minLength: MediaQuery.of(context).size.width / 2,
                      maxLength: MediaQuery.of(context).size.width / 1,
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                const SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    height: 180,
                    width: double.infinity,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _HeaderCardSkeleton extends StatelessWidget {
  const _HeaderCardSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SkeletonAvatar(
          style: SkeletonAvatarStyle(
            shape: BoxShape.circle,
            width: 60,
            height: 60,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SkeletonParagraph(
              style: SkeletonParagraphStyle(
                lines: 1,
                lineStyle: SkeletonLineStyle(
                  randomLength: false,
                  height: 10,
                  width: MediaQuery.of(context).size.width / 4,
                  borderRadius: BorderRadius.circular(8),
                  //minLength: MediaQuery.of(context).size.width / 9,
                ),
              ),
            ),
            SkeletonParagraph(
              style: SkeletonParagraphStyle(
                lines: 1,
                padding: const EdgeInsets.only(left: 8, top: 0),
                lineStyle: SkeletonLineStyle(
                  randomLength: false,
                  height: 10,
                  width: MediaQuery.of(context).size.width / 6,
                  borderRadius: BorderRadius.circular(8),
                  //minLength: MediaQuery.of(context).size.width / 9,
                ),
              ),
            ),
            SkeletonParagraph(
              style: SkeletonParagraphStyle(
                lines: 1,
                lineStyle: SkeletonLineStyle(
                  randomLength: false,
                  height: 10,
                  width: MediaQuery.of(context).size.width / 6,
                  borderRadius: BorderRadius.circular(8),
                  //minLength: MediaQuery.of(context).size.width / 9,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
