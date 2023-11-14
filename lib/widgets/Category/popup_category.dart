import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

import '../../db/category/category_db.dart';
import '../../models/category/category_model.dart';

ValueNotifier<CategoryType> selectedCategoryNotifier =
    ValueNotifier(CategoryType.income);

Future<void> showCategoryAddPopup(BuildContext context) async {
  final nameEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  showDialog(
    context: context,
    builder: (ctx) {
      return Form(
        key: formKey,
        child: SimpleDialog(
          title: const Text("Add Category"),
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: nameEditingController,
                decoration: const InputDecoration(
                  hintText: 'Category Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name is Requierd";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Radiobutton(title: 'income', type: CategoryType.income),
                  Radiobutton(title: 'Expense', type: CategoryType.expense),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      'SAVE THE DATA';
                    }
                    final name = nameEditingController.text;
                    if (name.isEmpty) {
                      return;
                    }
                    final type = selectedCategoryNotifier.value;

                    final category = CategoryModel(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        name: name,
                        type: type);

                    AnimatedSnackBar.rectangle(
                      'Success',
                      'Category Added Successfully',
                      type: AnimatedSnackBarType.success,
                      brightness: Brightness.light,
                      duration: const Duration(seconds: 4),
                    ).show(context);
                    CategoryDB.instance.insertCategory(category);
                    Navigator.of(ctx).pop();
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      color: Color.fromARGB(255, 5, 67, 96),
                    ),
                  )),
            )
          ],
        ),
      );
    },
  );
}

class Radiobutton extends StatelessWidget {
  final String title;
  final CategoryType type;

  const Radiobutton({required this.title, required this.type, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: selectedCategoryNotifier,
          builder: (BuildContext ctx, CategoryType newCategory, Widget? _) {
            return Radio<CategoryType>(
                activeColor: Color.fromARGB(255, 5, 67, 96),
                value: type,
                groupValue: selectedCategoryNotifier.value,
                onChanged: (value) {
                  if (value == null) return;
                  selectedCategoryNotifier.value = value;
                  selectedCategoryNotifier.notifyListeners();
                });
          },
        ),
        Text(title),
      ],
    );
  }
}
