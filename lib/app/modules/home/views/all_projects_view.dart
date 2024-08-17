import 'package:auth_api/app/data/models/current_projects_listItem_model.dart';
import 'package:auth_api/app/modules/auth/views/widgets/custome_button.dart';
import 'package:auth_api/app/modules/home/views/widgets/all_projects_view_widgets.dart';
import 'package:auth_api/app/modules/home/views/widgets/current_projects_section.dart';
import 'package:auth_api/app/modules/home/views/widgets/custom_text_feild.dart';
import 'package:auth_api/core/utils/app_colors.dart';
import 'package:auth_api/core/utils/app_styles.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:auth_api/app/modules/home/controllers/home_controller.dart';

class AllProjectsView extends StatelessWidget {
  const AllProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: const Color(0xffF3F3F3),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AllProjectsAppBar(
          selectedLocation: controller.selectedLocation.value,
          sortOption: controller.sortOption.value,
          onFilterApply: (selectedLoc, selectedSort) {
            controller.updateFilter(selectedLoc, selectedSort);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 3,
              child: CustomTextFeild(
                hintText: "Search",
                fillColor: const Color(0xffffffff),
                prefixicon: const Icon(Icons.search),
                onChanged: (value) {
                  controller.updateSearchQuery(value);
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            // Sort and filter UI here
            Expanded(
              child: Obx(
                () => GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.filteredProjectsList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    return CurrentProjectsListItem(
                      currentProjectsListITemMOdel:
                          controller.filteredProjectsList[index],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SortAndFilterDialog extends StatelessWidget {
  const SortAndFilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Select location", style: AppStyles.medium14),
          Obx(() => DropdownButton<String>(
                value: controller.selectedLocation.value,
                onChanged: (value) {
                  if (value != null) controller.selectedLocation.value = value;
                },
                items: ['All locations', 'Location 1', 'Location 2']
                    .map((location) => DropdownMenuItem(
                          value: location,
                          child: Text(location),
                        ))
                    .toList(),
              )),
          const SizedBox(height: 16),
          Text("Sort by", style: AppStyles.medium14),
          Obx(() => Column(
                children: [
                  RadioListTile<String>(
                    title: const Text('A to Z'),
                    value: 'A to Z',
                    groupValue: controller.sortOption.value,
                    activeColor: AppColors.primaryColor,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (value) {
                      if (value != null) controller.sortOption.value = value;
                      controller.filterProjects();
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Z to A'),
                    value: 'Z to A',
                    groupValue: controller.sortOption.value,
                    activeColor: AppColors.primaryColor,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (value) {
                      if (value != null) controller.sortOption.value = value;
                      controller.filterProjects();
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Last modified'),
                    value: 'Last modified',
                    groupValue: controller.sortOption.value,
                    activeColor: AppColors.primaryColor,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (value) {
                      if (value != null) controller.sortOption.value = value;
                      controller.filterProjects();
                    },
                  ),
                ],
              )),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 8,
                child: CustomButton(
                  onPressed: () {
                    controller.resetFilters();
                    Navigator.pop(context);
                  },
                  borderRadius: BorderRadius.circular(8),
                  sideColor: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    child: Text("Reset",
                        style: AppStyles.medium14
                            .copyWith(color: const Color(0xff757575))),
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 8,
                child: CustomButton(
                  onPressed: () {
                    controller.filterProjects();
                    Navigator.pop(context);
                  },
                  borderRadius: BorderRadius.circular(8),
                  sideColor: Colors.transparent,
                  gradientColor: const LinearGradient(
                    colors: [
                      Color(0xff465C65),
                      Color(0xff4B859F),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      child: Text(
                        "Apply",
                        style: AppStyles.medium14.copyWith(color: Colors.white),
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
