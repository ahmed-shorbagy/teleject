import 'package:auth_api/app/modules/auth/views/widgets/custome_button.dart';
import 'package:auth_api/app/modules/home/controllers/home_controller.dart';
import 'package:auth_api/app/modules/home/views/widgets/comments_section.dart';
import 'package:auth_api/app/modules/home/views/widgets/current_projects_section.dart';
import 'package:auth_api/app/modules/home/views/widgets/todo_section.dart';
import 'package:auth_api/core/utils/app_styles.dart';
import 'package:auth_api/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CurrentProjectsSection(),
        SizedBox(height: 12),
        Expanded(
          child: ToDoAndCommentsPageViewSection(),
        ),
      ],
    );
  }
}

class ToDoAndCommentsPageViewSection extends StatefulWidget {
  const ToDoAndCommentsPageViewSection({
    super.key,
  });

  @override
  State<ToDoAndCommentsPageViewSection> createState() =>
      _ToDoAndCommentsPageViewSectionState();
}

final PageController pageController = PageController();

class _ToDoAndCommentsPageViewSectionState
    extends State<ToDoAndCommentsPageViewSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          const PageViewOptionButtons(),
          Expanded(
            child: PageView(
              controller: pageController,
              children: const [ToDoSection(), CeommentsSection()],
            ),
          )
        ],
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(Assets.imagesAppBarBackGround), fit: BoxFit.fill),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Padding(
          padding: const EdgeInsets.only(top: 42),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  homeController.user.user?.imageUrl == null
                      ? Image.asset(
                          Assets.imagesProfileAvatarpng,
                          fit: BoxFit.cover,
                          scale: 0.9,
                        )
                      : Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    homeController.user.user!.imageUrl ?? ""),
                              ),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                              )),
                        ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome",
                        style: AppStyles.regular12,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        homeController.user.user!.username ?? "",
                        textAlign: TextAlign.start,
                        style: AppStyles.medium18.copyWith(color: Colors.white),
                      ),
                      Text(
                        homeController.user.user!.email ?? "",
                        textAlign: TextAlign.start,
                        style: AppStyles.medium18.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
              CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.12),
                  child: SvgPicture.asset(Assets.imagesNotifications)),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: EdgeInsetsDirectional.zero,
      height: 60,
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 0.01,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: kBottomNavigationBarHeight * 0.98,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 24,
            elevation: 0,
            onTap: onItemSelected,
            backgroundColor: Colors.white,
            unselectedItemColor:
                Theme.of(context).textSelectionTheme.selectionColor,
            currentIndex: selectedIndex,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(Assets.imagesHome),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(Assets.imagesProfile),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeFloatinButton extends StatelessWidget {
  const HomeFloatinButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FloatingActionButton(
        elevation: 10,
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        onPressed: () {},
        child: Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Color(0xff465C65),
                Color(0xff4B859F),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class PageViewOptionButtons extends StatefulWidget {
  const PageViewOptionButtons({super.key});

  @override
  State<PageViewOptionButtons> createState() => _PageViewOptionButtonsState();
}

class _PageViewOptionButtonsState extends State<PageViewOptionButtons> {
  bool isToDoSelected = true;

  void _onButtonPressed(bool toDoSelected, int pageIndex) {
    setState(() {
      isToDoSelected = toDoSelected;
    });
    pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 3,
      color: Colors.grey.shade200,
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              sideColor: const Color(0xffDADADA),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              text: 'To Do (12)',
              isSelected: isToDoSelected,
              onPressed: () => _onButtonPressed(true, 0),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                bottomLeft: Radius.circular(4),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              sideColor: const Color(0xffDADADA),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              text: 'Comments (11)',
              isSelected: !isToDoSelected,
              onPressed: () => _onButtonPressed(false, 2),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
