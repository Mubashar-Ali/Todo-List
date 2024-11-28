import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade300,
      body: ListView(
        children: const [
          MyCard(title: "Title 1"),
          MyCard(title: "Title 2", color: Colors.green, category: "Personal"),
          MyCard(
            title: "Title 3",
            color: Colors.blue,
            category: "Work",
            description:
                'This is my description, and it is a bit longer to test the dynamic height adjustment of the container.',
          ),
          MyCard(
            title: "Title 3",
            color: Colors.blue,
            category: "Work",
            description:
                'This is my description, and it is a bit longer to test the dynamic height adjustment of the container. This is my description, and it is a bit longer to test the dynamic height adjustment of the container.',
          ),
          MyCard(
            title: "Title 3",
            color: Colors.blue,
            category: "Work",
            description: 'This is my description',
          ),
        ],
      ),
    );
  }
}

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
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
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
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      value: false,
                      onChanged: (val) {},
                    ),
                    // Divider
                    Divider(color: Colors.grey.shade300),
                    // Description
                    if (description != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          description!,
                          maxLines: 1,
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
    );
  }
}
