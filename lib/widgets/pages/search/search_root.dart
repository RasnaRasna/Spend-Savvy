import 'package:flutter/material.dart';

import 'package:spend_savvy/widgets/pages/search/search.dart';
import 'package:spend_savvy/widgets/pages/search/search_tile.dart';

import '../../../models/transactions/transaction_model.dart';

ValueNotifier<List<transactionModel>> searchResult = ValueNotifier([]);

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SearchField(),
            const Expanded(
              child: SearchTiles(),
            ),
          ],
        ),
      ),
    );
  }
}
