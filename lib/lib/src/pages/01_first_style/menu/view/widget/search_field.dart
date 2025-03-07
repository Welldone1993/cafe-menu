// import 'package:flutter/material.dart';
//
// import '../../../../../infrastructure/utils/constants.dart';
//
// class CustomSearchField extends StatefulWidget {
//   const CustomSearchField({
//     super.key,
//     required this.title,
//     required this.textController,
//     this.hint,
//   });
//
//   final String title;
//   final String? hint;
//   final TextEditingController textController;
//
//   @override
//   State<CustomSearchField> createState() => _CustomSearchFieldState();
// }
//
// class _CustomSearchFieldState extends State<CustomSearchField> {
//   @override
//   Widget build(BuildContext context) => Padding(
//         padding: Constants.mediumPadding,
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Text(
//               widget.title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: Constants.largeSpace,
//               ),
//             ),
//             Constants.largeHorizontalSpacer,
//             Expanded(
//               child: DecoratedBox(
//                 decoration: const BoxDecoration(
//                   border: Border(
//                     bottom: BorderSide(
//                       color: Colors.white,
//                       width: 0.5,
//                     ),
//                   ),
//                 ),
//                 child: TextFormField(
//                   controller: widget.textController,
//                   showCursor: true,
//                   style: const TextStyle(color: Colors.white),
//                   decoration: InputDecoration(
//                       fillColor: Color(0xffF5F5F5),
//                       hintText: widget.hint ?? "",
//                       hintStyle: const TextStyle(
//                         color: Colors.white54,
//                         fontWeight: FontWeight.w100,
//                       ),
//                       suffixIcon: const Icon(
//                         Icons.search_outlined,
//                         color: Colors.white54,
//                         size: Constants.largeSpace,
//                       )),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
// }

import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    super.key,
    required this.title,
    required this.textController,
    this.hint,
  });

  final String title;
  final String? hint;
  final TextEditingController textController;

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100], // Background color
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(2, 2),
            ),
            BoxShadow(
              color: Colors.white.withValues(alpha: 0.8),
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(-2, -2),
            ),
          ],
        ),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: "Search Coffee...",
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(Icons.search, color: Colors.brown),
            // Left icon
            suffixIcon: GestureDetector(
              onTap: () {
                // Handle filter button click
                print("Filter button pressed");
              },
              child: Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 3,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
                child: Icon(Icons.tune, color: Colors.white),
              ),
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ),
    );
  }
}
