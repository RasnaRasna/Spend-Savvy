import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../db/category/category_db.dart';
import '../../models/category/category_model.dart';
import 'categoryy.dart';

class ExpenseCategory extends StatelessWidget {
  const ExpenseCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CategoryDB().expenseCategoryList,
      builder: (BuildContext ctx, List<CategoryModel> newlist, Widget? _) {
        if (newlist.isEmpty) {
          return Center(
            child: Image.asset(
              'lib/assets/images/output-onlinegiftools (2).gif',
              height: 200,
              width: 200,
            ),
          );
        } else {
          return ValueListenableBuilder(
              valueListenable: expense,
              builder: (context, value, child) {
                if (value) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.9,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemBuilder: (ctx, index) {
                      // ignore: non_constant_identifier_names
                      final Category = newlist[index];
                      return Card(
                        elevation: 30,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ListTile(
                          title: Text(
                            Category.name,
                            style: GoogleFonts.acme(),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text(
                                    'alert',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.red),
                                  ),
                                  content: const Text('Do you want to delete '),
                                  actions: [
                                    Row(
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            CategoryDB.instance
                                                .deleteCategory(Category.id);
                                            Navigator.of(ctx).pop();
                                          },
                                          child: const Text(
                                            'Yes',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(ctx).pop();
                                          },
                                          child: const Text('No'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.delete,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: newlist.length,
                  );
                } else {
                  return ListView.separated(
                    itemBuilder: (ctx, index) {
                      // ignore: non_constant_identifier_names
                      final Category = newlist[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 30,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ListTile(
                            title: Text(
                              Category.name,
                              style: GoogleFonts.acme(),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: const Text(
                                      'alert',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.red),
                                    ),
                                    content:
                                        const Text('Do you want to delete '),
                                    actions: [
                                      Row(
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              CategoryDB.instance
                                                  .deleteCategory(Category.id);
                                              Navigator.of(ctx).pop();
                                            },
                                            child: const Text(
                                              'Yes',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(ctx).pop();
                                            },
                                            child: const Text('No'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox();
                    },
                    itemCount: newlist.length,
                  );
                }
              });
        }
      },
    );
  }
}
