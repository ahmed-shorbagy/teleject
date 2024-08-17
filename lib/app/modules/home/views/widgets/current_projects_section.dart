import 'package:auth_api/app/data/models/current_projects_listItem_model.dart';
import 'package:auth_api/app/routes/app_pages.dart';
import 'package:auth_api/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../../../core/utils/assets.dart';

class CurrentProjectsSection extends StatelessWidget {
  const CurrentProjectsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.zero,
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: const Padding(
          padding: EdgeInsets.only(top: 20, left: 20, bottom: 20),
          child: Column(
            children: [
              CurrentProjectsListTitle(),
              SizedBox(
                height: 16,
              ),
              IntrinsicHeight(
                child: CurrentProjectsList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurrentProjectsListTitle extends StatelessWidget {
  const CurrentProjectsListTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Current projects",
          style: AppStyles.regular14,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.AllProjects);
            },
            child: Text(
              "View all",
              style: AppStyles.regular14.copyWith(color: Colors.blue),
            ),
          ),
        ),
      ],
    );
  }
}

class CurrentProjectsList extends StatelessWidget {
  const CurrentProjectsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<CurrentProjectsListITemMOdel> currentProjectsListITemMOdel = [
      CurrentProjectsListITemMOdel(
          title: "Project 1",
          image: Assets.imagesProject1,
          subtitle: "last edit: 22 Nov, 10:23 PM"),
      CurrentProjectsListITemMOdel(
          title: "Project 2",
          image: Assets.imagesProject1,
          subtitle: "last edit: 22 Nov, 10:23 PM"),
      CurrentProjectsListITemMOdel(
          title: "Project 3",
          image: Assets.imagesProject1,
          subtitle: "last edit: 22 Nov, 10:23 PM"),
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...currentProjectsListITemMOdel.map((e) => CurrentProjectsListItem(
                currentProjectsListITemMOdel: e,
              ))
        ],
      ),
    );
  }
}

class CurrentProjectsListItem extends StatelessWidget {
  const CurrentProjectsListItem({
    super.key,
    required this.currentProjectsListITemMOdel,
  });
  final CurrentProjectsListITemMOdel currentProjectsListITemMOdel;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: AspectRatio(
        aspectRatio: 3 / 2.7,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                currentProjectsListITemMOdel.image,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentProjectsListITemMOdel.title,
                      style: AppStyles.medium14
                          .copyWith(color: const Color(0xff5E5E5E)),
                    ),
                    Text(
                      currentProjectsListITemMOdel.subtitle,
                      style: AppStyles.regular10
                          .copyWith(color: const Color(0xff757575)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
