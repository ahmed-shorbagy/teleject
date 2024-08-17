class ToDoProjectsItemModel {
  String title, image, subtitle;
  ToDoStatus status;
  ToDoProjectsItemModel(
      {required this.title,
      required this.image,
      required this.subtitle,
      required this.status});
}

enum ToDoStatus { NeedToRieview, NotComplated, Approved, Inprogress }
