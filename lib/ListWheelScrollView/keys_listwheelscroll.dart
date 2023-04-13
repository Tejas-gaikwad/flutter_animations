import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'customChoiceChips.dart';

class KeysListScroll extends StatefulWidget {
  const KeysListScroll({super.key});

  @override
  State<KeysListScroll> createState() => _KeysListScrollState();
}

class _KeysListScrollState extends State<KeysListScroll> {
  final List<String> _suggestionsForHealthIssues = [
    'Lossing weight',
    'Healthier diet',
  ];

  late TextfieldTagsController _lifeGoalsController;
  @override
  void initState() {
    super.initState();
    _lifeGoalsController = TextfieldTagsController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 4,
                padding: const EdgeInsets.only(left: 11.5),
                child: CustomChoiceChipSelectorWithSuggestion(
                  controller: _lifeGoalsController,
                  suggestions: _suggestionsForHealthIssues,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
