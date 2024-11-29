import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    super.key,
    required this.title,
    this.category = "No Category",
    this.description,
    this.color = Colors.grey,
  });

  final Color color;
  final String title;
  final String category;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: const ActionPane(motion: BehindMotion(), children: [
        Icon(Icons.add),
      ]),
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.1),
          //     blurRadius: 5,
          //     offset: const Offset(0, 3),
          //   ),
          // ],
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Colored bar
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(100),
                  bottomLeft: Radius.circular(100),
                ),
                child: ColoredBox(
                  color: color,
                  child: const SizedBox(height: double.infinity, width: 10),
                ),
              ),
              // Content
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title with Checkbox
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        activeColor: Colors.blue,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        value: true,
                        onChanged: (val) {},
                      ),
                      // Divider
                      Divider(color: Colors.grey.shade300),
                      // Description
                      if (description != null && description!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            description!,
                            maxLines: 2,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      // Category
                      Row(
                        children: [
                          Text(
                            category,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            ' - ',
                            style: TextStyle(fontSize: 30),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
