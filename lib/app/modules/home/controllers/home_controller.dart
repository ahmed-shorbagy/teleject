import 'package:auth_api/app/data/models/current_projects_listItem_model.dart';
import 'package:auth_api/app/data/models/user_model/user_model.dart';
import 'package:auth_api/app/modules/auth/controllers/user_service.dart';
import 'package:auth_api/core/utils/assets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final UserService userService = UserService.instance;
  UserModel user = Get.find<UserService>().user.value!;
  var currentProjectsList = <CurrentProjectsListITemMOdel>[].obs;
  var filteredProjectsList = <CurrentProjectsListITemMOdel>[].obs;
  var searchQuery = ''.obs;
  var selectedLocation = 'All locations'.obs;
  var sortOption = 'A to Z'.obs;

  @override
  void onInit() {
    super.onInit();
    loadUser();
    loadProjects();
    filterProjects();
  }

  void loadUser() async {
    await userService.loadUser();
  }

  void loadProjects() {
    currentProjectsList.value = [
      CurrentProjectsListITemMOdel(
          title: "Project 1",
          image: Assets.imagesProject1,
          subtitle: "last edit: 19 Nov, 10:23 PM"),
      CurrentProjectsListITemMOdel(
          title: "Project 2",
          image: Assets.imagesProject1,
          subtitle: "last edit: 18 Nov, 10:23 PM"),
      CurrentProjectsListITemMOdel(
          title: "Project 3",
          image: Assets.imagesProject1,
          subtitle: "last edit: 17 Nov, 10:23 PM"),
      CurrentProjectsListITemMOdel(
          title: "Project 4",
          image: Assets.imagesProject1,
          subtitle: "last edit: 20 Nov, 10:23 PM"),
      CurrentProjectsListITemMOdel(
          title: "Project 5",
          image: Assets.imagesProject1,
          subtitle: "last edit: 30 Nov, 10:23 PM"),
      // Add more projects as needed
    ];
    filterProjects();
  }

  void filterProjects() {
    var projects = currentProjectsList.where((project) {
      return project.title
          .toLowerCase()
          .contains(searchQuery.value.toLowerCase());
    }).toList();

    if (sortOption.value == 'A to Z') {
      projects.sort((a, b) => a.title.compareTo(b.title));
    } else if (sortOption.value == 'Z to A') {
      projects.sort((a, b) => b.title.compareTo(a.title));
    } else if (sortOption.value == 'Last modified') {
      projects.sort((a, b) => b.subtitle.compareTo(a.subtitle));
    }

    filteredProjectsList.value = projects;
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
    filterProjects();
  }

  void updateFilter(String location, String sort) {
    selectedLocation.value = location;
    sortOption.value = sort;
    filterProjects();
  }

  void resetFilters() {
    selectedLocation.value = 'All locations';
    sortOption.value = 'A to Z';
    filterProjects();
  }
}
