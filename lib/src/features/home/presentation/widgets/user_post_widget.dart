import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/app/theme/colors.dart';
import '../screens/home_screen.dart';



class UserPost extends StatefulWidget {
  const UserPost({super.key});

  @override
  State<UserPost> createState() => _UserPostState();
}

class _UserPostState extends State<UserPost> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  10.horizontalSpace,
                  CircleAvatar(
                    backgroundImage: Image.network(imageUrl).image,
                  ),
                  5.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "jafarjalali128",
                        style: textTheme.bodyMedium!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "A moment ago",
                        style: textTheme.labelSmall!.copyWith(fontSize: 10),
                      )
                    ],
                  ),
                ],
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  10.horizontalSpace,
                 Container(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                   decoration: BoxDecoration(
                     border: Border.all(color: deepBlue,width: 0.5),
                     borderRadius: BorderRadius.circular(10)
                   ),
                   child: Row(
                     children: [
                       SizedBox(
                         height: 20.h,
                         child: Image.asset(
                           'assets/images/upvote_filled.png',
                           color: greenYellow,
                         ),
                       ),
                       Text("1.2 K")
                     ],
                   ),
                 ),
                  IconButton(
                    onPressed: () {},
                    icon: SizedBox(
                      height: 20.h,
                      child: Image.asset(
                        'assets/images/downvote_filled.png',
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(FontAwesomeIcons.commentDots)),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.paperPlane))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: RichText(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: "markRober12",
                          style: textTheme.bodySmall!
                              .copyWith(fontWeight: FontWeight.w600),
                          children: [
                            const TextSpan(text: " "),
                            TextSpan(
                              text:
                              "That was super amazing work you did out there love to collaborate!",
                              style: textTheme.bodySmall,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                5.verticalSpace,
                InkWell(
                  onTap: () {},
                  child: Text(
                    "view all comments",
                    style: textTheme.titleSmall!
                        .copyWith(fontSize: 12, fontStyle: FontStyle.italic),
                  ),
                ),
                5.verticalSpace,
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15.h,
                      backgroundImage: Image.network(imageUrl).image,
                    ),
                    5.horizontalSpace,
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Add a comment...",
                        style: textTheme.titleSmall!.copyWith(
                            fontSize: 12, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}