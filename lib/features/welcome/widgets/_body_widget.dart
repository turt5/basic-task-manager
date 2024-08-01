import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/features/welcome/provider/_task_provider.dart';

class BodyWidget extends ConsumerWidget {
  const BodyWidget({super.key, required this.theme});

  final ColorScheme theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final read = ref.watch(taskProivder);
    final write = ref.read(taskProivder);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tasks',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
            child: read.getTasksList.length > 0
                ? ListView.builder(
                    itemCount: read.getTasksList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onLongPress: () {
                          final tooltip = GlobalKey<TooltipState>();
                          tooltip.currentState?.ensureTooltipVisible();
                        },
                        child: Tooltip(
                          key: GlobalKey<TooltipState>(),
                          message: read.getTasksList[index]['task'],
                          child: Container(
                            margin: const EdgeInsets.only(
                              bottom: 10,
                            ),
                            height: 80,
                            decoration: BoxDecoration(
                                color: theme.primary.withOpacity(.2),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Container(
                                  height: double.infinity,
                                  width: 75,
                                  decoration: BoxDecoration(
                                      color: theme.primary,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10))),
                                  child: Icon(Icons.task),
                                ),
                                Expanded(
                                    child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              read.getTasksList[index]['task'],
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: theme.primary),
                                            ),
                                            Text(read.getTasksList[index]
                                                    ['created']
                                                .toString()
                                                .split(" ")[0]),
                                          ],
                                        ))),
                                InkWell(
                                  mouseCursor: SystemMouseCursors.click,
                                  splashColor: Colors.grey.withOpacity(.5),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  // highlightColor: Colors.green,
                                  onTap: () {
                                    write.removeTasks(
                                        read.getTasksList[index]['task']);
                                  },
                                  child: Container(
                                    height: double.infinity,
                                    width: 75,
                                    child: Icon(
                                      Icons.delete,
                                      color: theme.error,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Container(
                    child: Center(
                      child: Text('No Tasks available'),
                    ),
                  ))
      ],
    );
  }
}
