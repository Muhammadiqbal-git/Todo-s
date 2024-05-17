import 'package:flutter/material.dart';
import 'package:todos_porto_2/app_resources.dart';
import 'package:todos_porto_2/widgets/custom_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      leafColor: colors(context).secondaryCr.withOpacity(0.35),
      backgroundColor: colors(context).primaryCr,
      body: Column(
        children: [
          SizedBox(
            height: getHeight(context, 17),
          ),
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
              "assets/imgs/foto.png",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Welcome Iqbal!",
            style: boldText.copyWith(
                fontSize: 22, color: colors(context).backgroundCr),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: colors(context).backgroundCr,
              child: Column(
                children: [
                  SizedBox(
                    height: getHeight(context, 5),
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    color: colors(context).primaryCr,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Task List",
                        style: boldText.copyWith(fontSize: 22),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    constraints: BoxConstraints(maxHeight: 250),
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Daily Task",
                              style: boldText.copyWith(fontSize: 16),
                            ),
                            Icon(
                              Icons.add_circle_outline_outlined,
                              color: colors(context).primaryCr,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Flexible(
                          child: Scrollbar(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      children: [
                                        Icon(Icons.square),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Learn programmy by 12am",
                                          style: semiBoldText,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      children: [
                                        Icon(Icons.square),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Learn programmy by 12am",
                                          style: semiBoldText,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      children: [
                                        Icon(Icons.square),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Learn programmy by 12am",
                                          style: semiBoldText,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      children: [
                                        Icon(Icons.square),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Learn programmy by 12am",
                                          style: semiBoldText,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      children: [
                                        Icon(Icons.square),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Learn programmy by 12am",
                                          style: semiBoldText,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      children: [
                                        Icon(Icons.square),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Learn programmy by 12am",
                                          style: semiBoldText,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
