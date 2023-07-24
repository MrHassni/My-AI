import 'package:eleven_ai/screens/content/chat.dart';
import 'package:eleven_ai/utils/color_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eleven_ai/models/data/home_topic_data.dart';
import 'package:line_icons/line_icons.dart';

import '../../utils/metrics.dart';
import '../../utils/text_theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgPrimary(context),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: w(context),
                height: hh(context, 170),
                padding: EdgeInsets.all(w20(context)),
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Chat(
                          chatPath:'',
                          title: homeTopics[0].title,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                      w20(context),
                      w20(context),
                      w20(context),
                      hh(context, 10),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(ww(context, 10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          offset: Offset(0, hh(context, 4)),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: bigBody(context, AppColors.white),
                            children: [
                               TextSpan(
                                text: '${homeTopics[0].title}\n',
                              ),
                              TextSpan(
                                text: homeTopics[0].subtitle,
                                style: body(context, AppColors.dark),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            homeTopics[0].icon,
                            color: AppColors.white,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: hh(context, 5)),
              Row(
                children: [
                  SizedBox(
                    width: (w(context) / 2),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Chat(
                              chatPath:'',
                              title: homeTopics[1].title,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: hh(context, 150),
                        margin: EdgeInsets.only(left: w20(context), right: 10),
                        padding: EdgeInsets.fromLTRB(
                          w20(context),
                          w20(context),
                          w20(context),
                          hh(context, 10),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(ww(context, 10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              offset: Offset(0, hh(context, 4)),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: titleMedium14(context, AppColors.primary),
                                children: [
                                   TextSpan(
                                    text: "${homeTopics[1].title}\n",
                                  ),
                                  TextSpan(
                                    text: homeTopics[1].subtitle,
                                    style: titleMedium(context, AppColors.dark),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Icon(
                                homeTopics[1].icon,
                                color: AppColors.primary,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: (w(context) / 2),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Chat(
                              chatPath:'',
                              title: homeTopics[2].title,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: hh(context,150),
                        margin: EdgeInsets.only(right: w20(context), left: 10),
                        padding: EdgeInsets.fromLTRB(
                          w20(context),
                          w20(context),
                          w20(context),
                          hh(context, 10),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(ww(context, 10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.15),
                              offset: Offset(0, hh(context, 4)),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: titleMedium14(context, AppColors.white),
                                children: [
                                  TextSpan(
                                    text: "${homeTopics[2].title}\n",
                                  ),
                                  TextSpan(
                                    text: homeTopics[2].subtitle,
                                    style: titleMedium(context, AppColors.primary),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Icon(
                                homeTopics[2].icon,
                                color: AppColors.primary,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: hh(context, 25)),
              Row(
                children: [
                  SizedBox(
                    width: (w(context) / 2),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Chat(
                              chatPath:'',
                              title: homeTopics[3].title,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: hh(context, 150),
                        margin: EdgeInsets.only(left: w20(context), right: 10),
                        padding: EdgeInsets.fromLTRB(
                          w20(context),
                          w20(context),
                          w20(context),
                          hh(context, 10),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(ww(context, 10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              offset: Offset(0, hh(context, 4)),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: titleMedium14(context, AppColors.white),
                                children: [
                                  TextSpan(
                                    text: "${homeTopics[3].title}\n",
                                  ),
                                  TextSpan(
                                    text: homeTopics[3].subtitle,
                                    style: titleMedium(context, AppColors.dark),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Icon(
                                homeTopics[3].icon,
                                color: AppColors.white,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: (w(context) / 2),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Chat(
                              chatPath:'',
                              title: homeTopics[4].title,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: hh(context, 150),
                        margin: EdgeInsets.only(right: w20(context), left: 10),
                        padding: EdgeInsets.fromLTRB(
                          w20(context),
                          w20(context),
                          w20(context),
                          hh(context, 10),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(ww(context, 10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              offset: Offset(0, hh(context, 4)),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: titleMedium14(context, AppColors.dark),
                                children: [
                                   TextSpan(
                                    text: "${homeTopics[4].title}\n",
                                  ),
                                  TextSpan(
                                    text: homeTopics[4].subtitle,
                                    style: titleMedium(context, AppColors.primary),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Icon(
                                homeTopics[4].icon,
                                color: Colors.black,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: w(context),
                height: hh(context, 170),
                padding: EdgeInsets.all(w20(context)),
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Chat(
                          chatPath:'',
                          title: homeTopics[5].title,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                      w20(context),
                      w20(context),
                      w20(context),
                      hh(context, 10),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(ww(context, 10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.15),
                          offset: Offset(0, hh(context, 4)),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: bigBody(context, AppColors.primary),
                            children: [
                               TextSpan(
                                text: "${homeTopics[5].title}\n",
                              ),
                              TextSpan(
                                text: homeTopics[5].subtitle,
                                style: body(context, AppColors.white),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            homeTopics[5].icon,
                            color: AppColors.primary,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: (w(context) / 2),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Chat(
                              chatPath:'',
                              title: homeTopics[6].title,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: hh(context, 150),
                        margin: EdgeInsets.only(left: w20(context), right: 10),
                        padding: EdgeInsets.fromLTRB(
                          w20(context),
                          w20(context),
                          w20(context),
                          hh(context, 10),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(ww(context, 10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              offset: Offset(0, hh(context, 4)),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: titleMedium14(context, AppColors.dark),
                                children: [
                                  TextSpan(
                                    text: "${homeTopics[6].title}\n",
                                  ),
                                  TextSpan(
                                    text: homeTopics[6].subtitle,
                                    style: titleMedium(context, AppColors.primary),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Icon(
                                homeTopics[6].icon,
                                color: Colors.black,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: (w(context) / 2),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Chat(
                              chatPath:'',
                              title: homeTopics[7].title,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: hh(context, 150),
                        margin: EdgeInsets.only(right: w20(context), left: 10),
                        padding: EdgeInsets.fromLTRB(
                          w20(context),
                          w20(context),
                          w20(context),
                          hh(context, 10),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(ww(context, 10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              offset: Offset(0, hh(context, 4)),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: titleMedium14(context, AppColors.dark),
                                children: [
                                   TextSpan(
                                    text: "${homeTopics[7].title}\n",
                                  ),
                                  TextSpan(
                                    text: homeTopics[7].subtitle,
                                    style: titleMedium(context, AppColors.white),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Icon(
                                homeTopics[7].icon,
                                color: AppColors.white,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: hh(context, 25)),
              Row(
                children: [
                  SizedBox(
                    width: (w(context) / 2),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Chat(
                              chatPath:'',
                              title: homeTopics[8].title,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: hh(context, 150),
                        margin: EdgeInsets.only(left: w20(context), right: 10),
                        padding: EdgeInsets.fromLTRB(
                          w20(context),
                          w20(context),
                          w20(context),
                          hh(context, 10),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(ww(context, 10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              offset: Offset(0, hh(context, 4)),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: titleMedium14(context, AppColors.white),
                                children: [
                                  TextSpan(
                                    text: "${homeTopics[8].title}\n",
                                  ),
                                  TextSpan(
                                    text: homeTopics[8].subtitle,
                                    style: titleMedium(context, AppColors.dark),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Icon(
                                homeTopics[8].icon,
                                color: AppColors.white,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: (w(context) / 2),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Chat(
                              chatPath:'',
                              title: homeTopics[9].title,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: hh(context, 150),
                        margin: EdgeInsets.only(right: w20(context), left: 10),
                        padding: EdgeInsets.fromLTRB(
                          w20(context),
                          w20(context),
                          w20(context),
                          hh(context, 10),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(ww(context, 10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.15),
                              offset: Offset(0, hh(context, 4)),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: titleMedium14(context, AppColors.primary),
                                children: [
                                  TextSpan(
                                    text: "${homeTopics[9].title}\n",
                                  ),
                                  TextSpan(
                                    text: homeTopics[9].subtitle,
                                    style: titleMedium(context, AppColors.white),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Icon(
                                homeTopics[9].icon,
                                color: AppColors.primary,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: hh(context, 25)),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: homeTopics.length,
              //     padding:   const EdgeInsets.symmetric(
              // vertical: 10, horizontal: 20),
              //     itemBuilder: (context, index) {
              //       final topic = homeTopics[index];
              //       return Card(
              //         margin: const EdgeInsets.symmetric(vertical: 7),
              //         color: topic.clr,
              //         elevation: 0,
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(12.0),
              //         ),
              //         child: ListTile(
              //           leading: Icon(
              //             topic.icon,
              //             color: Theme.of(context).primaryColor,
              //           ),
              //           title: Text(
              //             topic.title,
              //             style: TextStyle(
              //               fontWeight: FontWeight.w600,
              //               fontSize: 18.0,
              //               color: Theme.of(context).primaryColor,
              //             ),
              //           ),
              //           subtitle: Text(
              //             topic.subtitle,
              //             style: TextStyle(
              //               fontWeight: FontWeight.w400,
              //               fontSize: 14.0,
              //               color: Theme.of(context).textTheme.bodyText1!.color,
              //             ),
              //           ),
              //           trailing: Icon(
              //             LineIcons.arrowRight,
              //             color: Theme.of(context).primaryColor,
              //           ),
              //           onTap: () async {
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => Chat(
              //                   chatPath:'',
              //                       // 'topics/${homeTopics[index].databaseTitle}/${FirebaseAuth.instance.currentUser!.uid}',
              //                   title: homeTopics[index].title,
              //                 ),
              //               ),
              //             );
              //           },
              //         ),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
