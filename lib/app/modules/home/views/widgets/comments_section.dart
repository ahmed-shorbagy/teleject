import 'package:auth_api/app/modules/home/views/widgets/todo_section.dart';
import 'package:auth_api/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CeommentsSection extends StatelessWidget {
  const CeommentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            child: ToDoSectionOptions(),
          ),
          CommentsSectionCard()
        ],
      ),
    );
  }
}

class CommentsSectionCard extends StatelessWidget {
  const CommentsSectionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Color(0xffB7B7B7), width: 1),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [CommentsSectionHeader(), CommentsSectionBody()],
        ),
      ),
    );
  }
}

class CommentsSectionHeader extends StatelessWidget {
  const CommentsSectionHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Friday 10 Nov ",
          style: AppStyles.regular14.copyWith(
            color: const Color(0xff333333),
          ),
        ),
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: const Color(0xffB7B7B7))),
            child: Text(
              "View",
              style:
                  AppStyles.regular12.copyWith(color: const Color(0xff757575)),
            ),
          ),
        )
      ],
    );
  }
}

class CommentsSectionBody extends StatelessWidget {
  const CommentsSectionBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "project Name - Construction Equipment",
          style: AppStyles.regular12.copyWith(color: const Color(0xff9C9C9C)),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Construction Equipment",
          style: AppStyles.regular14.copyWith(color: const Color(0xff5E5E5E)),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: const Color(0xffEDEDED)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Contractor's response",
                style:
                    AppStyles.medium14.copyWith(color: const Color(0xff748489)),
              ),
              const SizedBox(
                height: 9,
              ),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                style: AppStyles.regular14
                    .copyWith(color: const Color(0xff5E5E5E)),
              ),
              const SizedBox(
                height: 9,
              ),
              Text(
                "11Nov 11:55 AM",
                style: AppStyles.regular12
                    .copyWith(color: const Color(0xff757575)),
              ),
            ],
          ),
        )
      ],
    );
  }
}
