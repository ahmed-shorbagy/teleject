import 'package:auth_api/app/data/models/search_results_item_model.dart';
import 'package:auth_api/app/data/models/todo_projects_item_model.dart';
import 'package:auth_api/app/modules/auth/views/widgets/custome_button.dart';
import 'package:auth_api/app/modules/home/views/all_projects_view.dart';
import 'package:auth_api/core/utils/app_styles.dart';
import 'package:auth_api/core/utils/assets.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AllProjectsAppBar extends StatelessWidget {
  final String selectedLocation;
  final String sortOption;
  final Function(String, String) onFilterApply;

  const AllProjectsAppBar({
    super.key,
    required this.selectedLocation,
    required this.sortOption,
    required this.onFilterApply,
  });

  @override
  Widget build(BuildContext context) {
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
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Projects",
                    textAlign: TextAlign.start,
                    style: AppStyles.medium18.copyWith(color: Colors.white),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.bottomSheet(
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 30, right: 20, left: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      "Sort and filter",
                                      style: AppStyles.medium18,
                                    ),
                                    const Spacer(),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(Icons.close))
                                  ],
                                ),
                              ),
                              const Divider(),
                              const SortAndFilterDialog(),
                            ],
                          ),
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.filter_list,
                        color: Colors.white,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
// class SearchReultList extends StatelessWidget {
//   const SearchReultList({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     List<SearchResultsITemModel> searchResultItemList = [
//       SearchResultsITemModel(
//           progress: 10, title: "Saturday", status: ToDoStatus.Inprogress),
//       SearchResultsITemModel(
//           progress: 73, title: "Saturday", status: ToDoStatus.NotComplated),
//       SearchResultsITemModel(
//           progress: 0, title: "Saturday", status: ToDoStatus.NeedToRieview),
//       SearchResultsITemModel(
//           progress: 100, title: "Saturday", status: ToDoStatus.Approved),
//       SearchResultsITemModel(
//           progress: 100, title: "Saturday", status: ToDoStatus.Approved),
//       SearchResultsITemModel(
//           progress: 100, title: "Saturday", status: ToDoStatus.Approved),
//       SearchResultsITemModel(
//           progress: 100, title: "Saturday", status: ToDoStatus.Approved),
//       SearchResultsITemModel(
//           progress: 100, title: "Saturday", status: ToDoStatus.Approved),
//     ];
//     return Column(
//       children: [
//         const SizedBox(
//           height: 16,
//         ),
//         ...searchResultItemList
//             .map((e) => SearchResultsItem(searchResultsITemModel: e)),
//       ],
//     );
//   }
// }

// class SearchOptions extends StatefulWidget {
//   const SearchOptions({super.key});

//   @override
//   State<SearchOptions> createState() => _SearchOptionsState();
// }

// class _SearchOptionsState extends State<SearchOptions> {
//   int selectedIndex = 0;

//   void _onButtonPressed(int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: CustomButton(
//             sideColor: const Color(0xffDADADA),
//             text: 'Daily',
//             isSelected: selectedIndex == 0,
//             onPressed: () => _onButtonPressed(0),
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(4),
//               bottomLeft: Radius.circular(4),
//             ),
//           ),
//         ),
//         Expanded(
//           child: CustomButton(
//             sideColor: const Color(0xffDADADA),
//             text: 'Weekly',
//             isSelected: selectedIndex == 1,
//             onPressed: () => _onButtonPressed(1),
//             borderRadius: BorderRadius.zero,
//           ),
//         ),
//         Expanded(
//           child: CustomButton(
//             sideColor: const Color(0xffDADADA),
//             text: 'Monthly',
//             isSelected: selectedIndex == 2,
//             onPressed: () => _onButtonPressed(2),
//             borderRadius: const BorderRadius.only(
//               topRight: Radius.circular(4),
//               bottomRight: Radius.circular(4),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class SearchResultsItem extends StatelessWidget {
//   const SearchResultsItem({
//     super.key,
//     required this.searchResultsITemModel,
//   });
//   final SearchResultsITemModel searchResultsITemModel;
//   Color _getColor(ToDoStatus status) {
//     switch (status) {
//       case ToDoStatus.NeedToRieview:
//         return const Color(0xffA70000);
//       case ToDoStatus.Approved:
//         return Colors.white;
//       case ToDoStatus.NotComplated:
//         return const Color(0xffFC9700);
//       default:
//         return Colors.white;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card.outlined(
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(4),
//           side: BorderSide(
//               color: _getColor(searchResultsITemModel.status), width: 1)),
//       color: Colors.white,
//       elevation: 4,
//       child: Container(
//         height: 72,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(4),
//             color: _getColor(searchResultsITemModel.status).withOpacity(0.03),
//             border: Border.all(
//               color: _getColor(searchResultsITemModel.status),
//             )),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 14),
//                 child: DateContainer(
//                   color:
//                       searchResultsITemModel.status == ToDoStatus.NeedToRieview
//                           ? const Color(0xffA70000)
//                           : const Color(0xff3D5058),
//                 ),
//               ),
//               const SizedBox(
//                 width: 13,
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     searchResultsITemModel.title,
//                     style: AppStyles.regular14,
//                   ),
//                   Text(
//                     "Status : ${searchResultsITemModel.status.toString().split('.').last}",
//                     style: AppStyles.regular12
//                         .copyWith(color: const Color(0xff757575)),
//                   ),
//                 ],
//               ),
//               const Spacer(),
//               searchResultsITemModel.status == ToDoStatus.NeedToRieview
//                   ? const NeedReviewStatusContainer()
//                   : searchResultsITemModel.status == ToDoStatus.Approved
//                       ? const ApprovedStatusContainer()
//                       : CircularPercentageChart(
//                           percentage: searchResultsITemModel.progress,
//                           color: searchResultsITemModel.status ==
//                                   ToDoStatus.NotComplated
//                               ? Colors.red
//                               : Colors.green,
//                         ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class ApprovedStatusContainer extends StatelessWidget {
  const ApprovedStatusContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green,
      ),
      child: const Icon(
        Icons.done,
        size: 18,
        color: Colors.white,
      ),
    );
  }
}

class NeedReviewStatusContainer extends StatelessWidget {
  const NeedReviewStatusContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
      child: const Icon(
        Icons.close,
        size: 18,
        color: Colors.white,
      ),
    );
  }
}

class CircularPercentageChart extends StatelessWidget {
  const CircularPercentageChart(
      {super.key, required this.percentage, required this.color});
  final double percentage;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(
            PieChartData(
              startDegreeOffset: 270,
              sectionsSpace: 0,
              centerSpaceRadius: 15,
              sections: [
                PieChartSectionData(
                  color: color,
                  value: percentage,
                  radius: 5,
                  title: '',
                ),
                PieChartSectionData(
                  color: Colors.grey[300]!,
                  value: 100 - percentage,
                  radius: 5,
                  title: '',
                ),
              ],
            ),
          ),
          Text('${percentage.toStringAsFixed(0)}%', style: AppStyles.regular10),
        ],
      ),
    );
  }
}

class DateContainer extends StatelessWidget {
  const DateContainer({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    // Get the current date
    DateTime now = DateTime.now();
    // Format the date to "11 Nov"
    String formattedDate = DateFormat('d MMM').format(now);

    return AspectRatio(
      aspectRatio: 1,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.only(top: 2, left: 4, right: 4, bottom: 2),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(formattedDate.split(' ')[0], // Display the day
                  style: AppStyles.medium14.copyWith(color: Colors.white)),
              Text(formattedDate.split(' ')[1], // Display the month
                  style: AppStyles.regular10.copyWith(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
