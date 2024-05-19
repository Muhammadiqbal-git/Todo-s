import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:todos_porto_2/app_resources.dart';
import 'package:todos_porto_2/cubits/profile_cubit.dart';
import 'package:todos_porto_2/cubits/todo_cubit.dart';
import 'package:todos_porto_2/widgets/clock_view.dart';
import 'package:todos_porto_2/widgets/custom_button.dart';
import 'package:todos_porto_2/widgets/custom_form.dart';
import 'package:todos_porto_2/widgets/custom_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _todoText;

  @override
  void initState() {
    _todoText = TextEditingController();
    context.read<ProfileCubit>().getProfile();
    super.initState();
  }

  @override
  void dispose() {
    _todoText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      leafColor: colors(context).secondaryCr.withOpacity(0.45),
      backgroundColor: colors(context).primaryCr,
      body: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileDoneState) {
            context.read<TodoCubit>().getTodoList(state.profileData.id);
          }
        },
        child: Column(
          children: [
            SizedBox(
              height: getHeight(context, 12),
            ),
            profileSection(context),
            const SizedBox(
              height: 20,
            ),
            Expanded(child: todoSection(context)),
          ],
        ),
      ),
    );
  }

  Widget profileSection(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileDoneState) {
          return Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50,
                backgroundImage: NetworkImage(
                  state.profileData.image,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Welcome ${state.profileData.lastName}",
                style: boldText.copyWith(
                    fontSize: 22, color: colors(context).backgroundCr),
              ),
            ],
          );
        } else {
          return Column(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50,
                backgroundImage: AssetImage(
                  "assets/imgs/dummy_photo.png",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Lorem ipsum blabla",
                style:
                    boldText.copyWith(fontSize: 22, color: Colors.transparent),
              ),
            ],
          );
        }
      },
    );
  }

  Widget todoSection(BuildContext context) {
    return Container(
      color: colors(context).backgroundCr,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: getHeight(context, 5),
            ),
            ClockView(
              size: getWidth(context, 30),
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
            Flexible(
              child: Container(
                constraints: const BoxConstraints(minHeight: 150),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 4,
                          offset: const Offset(0, 4))
                    ]),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Daily Task",
                          style: boldText.copyWith(fontSize: 16),
                        ),
                        BlocBuilder<ProfileCubit, ProfileState>(
                          builder: (context, state) {
                            if (state is ProfileDoneState) {
                              return InkWell(
                                onTap: () {
                                  //
                                  showDialog(
                                    context: context,
                                    builder: (dialogContext) => AlertDialog(
                                      backgroundColor:
                                          colors(context).secondaryCr,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      title: const Text(
                                        "Create todo",
                                      ),
                                      titleTextStyle:
                                          boldText.copyWith(fontSize: 16),
                                      content: CustomForm(
                                          height: 48,
                                          width: getWidth(context, 45),
                                          textEditingController: _todoText,
                                          hintText: "Do something!!",
                                          ),
                                      contentPadding:
                                          EdgeInsets.fromLTRB(24, 20, 24, 0),
                                      actionsPadding: EdgeInsets.symmetric(
                                          vertical: 9, horizontal: 24),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              context
                                                  .read<TodoCubit>()
                                                  .addTodoList(_todoText.text,
                                                      state.profileData.id);
                                              _todoText.clear();
                                              Navigator.pop(dialogContext);
                                            },
                                            child: Text("Create",
                                                style: normalText)),
                                      ],
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.add_circle_outline_outlined,
                                  color: colors(context).primaryCr,
                                ),
                              );
                            } else {
                              return const InkWell(
                                child: const Icon(
                                  Icons.add_circle_outline_outlined,
                                  color: Colors.black45,
                                ),
                              );
                            }
                          },
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Scrollbar(
                      child: BlocBuilder<TodoCubit, TodoState>(
                        builder: (context, state) {
                          if (state is TodoLoadingState) {
                            return Skeletonizer(
                                child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 4,
                              itemBuilder: (context, index) => const Padding(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Row(
                                    children: [
                                      Icon(Icons.square),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "lorem ipsum dolor sit amet",
                                        style: normalText,
                                      )
                                    ],
                                  )),
                            ));
                          } else if (state is TodoDoneState) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.todoList.todoList.length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<TodoCubit>()
                                            .updateTodoList(state
                                                .todoList.todoList[index].id);
                                      },
                                      child: Container(
                                        width: 17,
                                        height: 17,
                                        decoration: BoxDecoration(
                                            color: state.todoList
                                                    .todoList[index].completed
                                                ? colors(context).primaryCr
                                                : colors(context).whiteCr,
                                            border: Border.all(width: 2)),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Text(
                                        state.todoList.todoList[index].todo,
                                        style: boldText,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return const Center(
                              child: Text(
                                "Terjadi kesalahan",
                                style: normalText,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
