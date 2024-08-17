import 'package:auth_api/core/utils/app_styles.dart';
import 'package:auth_api/core/utils/assets.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/todo_projects_item_model.dart';

class ToDoSection extends StatelessWidget {
  const ToDoSection({super.key});

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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: HighPirioritySection(),
          ),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ToDayReportsSection(),
          ),
        ],
      ),
    );
  }
}

class ToDoSectionOptions extends StatelessWidget {
  const ToDoSectionOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
              padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 10, vertical: 2)),
              backgroundColor: const WidgetStatePropertyAll(Color(0xffF4F4F4)),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ))),
          child: Row(
            children: [
              Text(
                "All Projects",
                style: AppStyles.regular14
                    .copyWith(color: const Color(0xff445860)),
              ),
              const SizedBox(
                width: 8,
              ),
              Image.asset(Assets.imagesArrowDown)
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list))
      ],
    );
  }
}

class HighPirioritySection extends StatelessWidget {
  const HighPirioritySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<ToDoProjectsItemModel> toDoProjectsItemModelList = [
      ToDoProjectsItemModel(
          title: "Friday 10 Nov",
          image: Assets.imagesProject1,
          subtitle: "project Name - Reports",
          status: ToDoStatus.NotComplated),
      ToDoProjectsItemModel(
          title: "Friday 10 Nov",
          image: Assets.imagesProject1,
          subtitle: "project Name - Reports",
          status: ToDoStatus.NeedToRieview),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "High Priority",
          style: AppStyles.regular14.copyWith(color: const Color(0xff757575)),
        ),
        ...toDoProjectsItemModelList.map((e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 1),
              child: ToDoProjectsItem(toDoProjectsItemModel: e),
            )),
      ],
    );
  }
}

class ToDayReportsSection extends StatelessWidget {
  const ToDayReportsSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<ToDoProjectsItemModel> toDoProjectsItemModelList = [
      ToDoProjectsItemModel(
          title: "Friday 10 Nov",
          image: Assets.imagesProject1,
          subtitle: "project Name - Reports",
          status: ToDoStatus.Approved),
      ToDoProjectsItemModel(
          title: "Friday 10 Nov",
          image: Assets.imagesProject1,
          subtitle: "project Name - Reports",
          status: ToDoStatus.Approved),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Today Reports",
          style: AppStyles.regular14.copyWith(color: const Color(0xff757575)),
        ),
        ...toDoProjectsItemModelList.map((e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 1),
              child: ToDoProjectsItem(toDoProjectsItemModel: e),
            )),
      ],
    );
  }
}

class ToDoProjectsItem extends StatelessWidget {
  const ToDoProjectsItem({
    super.key,
    required this.toDoProjectsItemModel,
  });
  final ToDoProjectsItemModel toDoProjectsItemModel;
  Color _getColor(ToDoStatus status) {
    switch (status) {
      case ToDoStatus.NeedToRieview:
        return const Color(0xffA70000);
      case ToDoStatus.Approved:
        return Colors.white;
      case ToDoStatus.NotComplated:
        return const Color(0xffFC9700);
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(
              color: _getColor(toDoProjectsItemModel.status), width: 1)),
      color: Colors.white,
      elevation: 4,
      child: Container(
        height: 62,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: _getColor(toDoProjectsItemModel.status).withOpacity(0.03),
            border: Border.all(
              color: _getColor(toDoProjectsItemModel.status),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          toDoProjectsItemModel.image,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 13,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    toDoProjectsItemModel.title,
                    style: AppStyles.regular14,
                  ),
                  Text(
                    toDoProjectsItemModel.subtitle,
                    style: AppStyles.regular12
                        .copyWith(color: const Color(0xff9C9C9C)),
                  )
                ],
              ),
              const Spacer(),
              Text(
                toDoProjectsItemModel.status.toString().split('.').last,
                style: AppStyles.regular12.copyWith(
                  color: _getColor(toDoProjectsItemModel.status),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
