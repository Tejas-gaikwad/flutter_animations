import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:textfield_tags/textfield_tags.dart';

class CustomChoiceChipSelectorWithSuggestion extends StatefulWidget {
  const CustomChoiceChipSelectorWithSuggestion({
    super.key,
    required TextfieldTagsController controller,
    required this.suggestions,
  }) : _controller = controller;

  final TextfieldTagsController _controller;
  final List<String> suggestions;

  @override
  State<CustomChoiceChipSelectorWithSuggestion> createState() =>
      _CustomChoiceChipSelectorWithSuggestionState();
}

class _CustomChoiceChipSelectorWithSuggestionState
    extends State<CustomChoiceChipSelectorWithSuggestion> {
  List<String> suggestionsList = [
    'apple',
    'banana',
    'cherry',
    'date',
    'USA',
    'UK',
    'Uganda',
    'Uruguay',
    'United Arab Emirates'
  ];
  var addedTags = <String>[];

  OverlayEntry? entry;
  final layerlink = LayerLink();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    // suggestions = widget.suggestions;
    addedTags = [];

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   return showOverlay();
    // });
    // if (focusNode.hasFocus) {
    //   showOverlay();
    // } else {
    //   hideOverlay();
    // }
  }

  List<String> _suggestions = [];

  void _updateSuggestions(String queryText) {
    final query = queryText.toLowerCase();
    final suggetions = suggestionsList
        .where((item) => item.toLowerCase().contains(query))
        .toList();

    setState(() {
      _suggestions = suggetions;
    });
  }

  void showOverlay(TextEditingController controller) {
    hideOverlay();
    // Create an OverlayEntry and add it to the Overlay
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    entry = OverlayEntry(
      builder: (context) {
        return Positioned(
          width: size.width,
          child: CompositedTransformFollower(
            link: layerlink,
            showWhenUnlinked: false,
            offset: Offset(0, size.height - 220),
            child: buildOverlay(controller),
          ),
        );
      },
    );

    overlay.insert(entry!);
  }

  void hideOverlay() async {
    entry?.remove();
    entry?.dispose();
    entry = null;
  }

  @override
  void dispose() {
    hideOverlay();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    hideOverlay();
    super.didChangeDependencies();
  }

  MediaQuery? _findRootMediaQuery() {
    MediaQuery? rootMediaQuery;
    context.visitAncestorElements((element) {
      if (element.widget is MediaQuery) {
        rootMediaQuery = element.widget as MediaQuery;
      }
      return true;
    });

    return rootMediaQuery;
  }

  late double directionUpOffset;

  double _calculateMaxHeightUp(
      RenderBox box,
      TypeAheadField widget,
      double windowHeight,
      MediaQuery rootMediaQuery,
      double keyboardHeight,
      double textBoxAbsY) {
    // recalculate keyboard absolute y value
    double keyboardAbsY = windowHeight - keyboardHeight;

    directionUpOffset = textBoxAbsY > keyboardAbsY
        ? keyboardAbsY - textBoxAbsY - widget.suggestionsBoxVerticalOffset
        : -widget.suggestionsBoxVerticalOffset;

    // unsafe area, ie: iPhone X notch
    double unsafeAreaHeight = rootMediaQuery.data.padding.top;

    return textBoxAbsY > keyboardAbsY
        ? keyboardAbsY -
            unsafeAreaHeight -
            2 * widget.suggestionsBoxVerticalOffset
        : textBoxAbsY -
            unsafeAreaHeight -
            2 * widget.suggestionsBoxVerticalOffset;
  }

  double _calculateMaxHeight(
      AxisDirection direction,
      RenderBox box,
      TypeAheadField widget,
      double windowHeight,
      MediaQuery rootMediaQuery,
      double keyboardHeight,
      double textBoxAbsY) {
    return direction == AxisDirection.down
        ? _calculateMaxHeightDown(box, widget, windowHeight, rootMediaQuery,
            keyboardHeight, textBoxAbsY)
        : _calculateMaxHeightUp(box, widget, windowHeight, rootMediaQuery,
            keyboardHeight, textBoxAbsY);
  }

  double _calculateMaxHeightDown(
      RenderBox box,
      TypeAheadField widget,
      double windowHeight,
      MediaQuery rootMediaQuery,
      double keyboardHeight,
      double textBoxAbsY) {
    // unsafe area, ie: iPhone X 'home button'
    // keyboardHeight includes unsafeAreaHeight, if keyboard is showing, set to 0
    double unsafeAreaHeight =
        keyboardHeight == 0 ? rootMediaQuery.data.padding.bottom : 0;

    return windowHeight -
        keyboardHeight -
        unsafeAreaHeight -
        textBoxHeight -
        textBoxAbsY -
        2 * widget.suggestionsBoxVerticalOffset;
  }

  double textBoxWidth = 100.0;
  double textBoxHeight = 100.0;
  late final AxisDirection desiredDirection;
  static const double minOverlaySpace = 64.0;
  late final bool autoFlipDirection;
  late AxisDirection direction;
  double maxHeight = 300.0;

  void _adjustMaxHeightAndOrientation() {
    TypeAheadField widget = context.widget as TypeAheadField;

    RenderBox? box = context.findRenderObject() as RenderBox?;
    if (box == null || box.hasSize == false) {
      return;
    }

    textBoxWidth = box.size.width;
    textBoxHeight = box.size.height;

    // top of text box
    double textBoxAbsY = box.localToGlobal(Offset.zero).dy;

    // height of window
    double windowHeight = MediaQuery.of(context).size.height;

    // we need to find the root MediaQuery for the unsafe area height
    // we cannot use BuildContext.ancestorWidgetOfExactType because
    // widgets like SafeArea creates a new MediaQuery with the padding removed
    MediaQuery rootMediaQuery = _findRootMediaQuery()!;

    // height of keyboard
    double keyboardHeight = rootMediaQuery.data.viewInsets.bottom;

    double maxHDesired = _calculateMaxHeight(desiredDirection, box, widget,
        windowHeight, rootMediaQuery, keyboardHeight, textBoxAbsY);

    // if there's enough room in the desired direction, update the direction and the max height
    if (maxHDesired >= minOverlaySpace || !autoFlipDirection) {
      direction = desiredDirection;
      // Sometimes textBoxAbsY is NaN, so we need to check for that
      if (!maxHDesired.isNaN) {
        maxHeight = maxHDesired;
      }
    } else {
      // There's not enough room in the desired direction so see how much room is in the opposite direction
      AxisDirection flipped = flipAxisDirection(desiredDirection);
      double maxHFlipped = _calculateMaxHeight(flipped, box, widget,
          windowHeight, rootMediaQuery, keyboardHeight, textBoxAbsY);

      // if there's more room in this opposite direction, update the direction and maxHeight
      if (maxHFlipped > maxHDesired) {
        direction = flipped;

        // Not sure if this is needed, but it's here just in case
        if (!maxHFlipped.isNaN) {
          maxHeight = maxHFlipped;
        }
      }
    }

    if (maxHeight < 0) maxHeight = 0;
  }

  Widget buildOverlay(TextEditingController controller) {
    return Material(
      child: Container(
        height: _suggestions.length > 4 ? 150 : null,
        color: Colors.grey.withOpacity(0.1),
        child: ListView.builder(
          reverse: true,
          shrinkWrap: _suggestions.length > 4 ? false : true,
          itemCount: _suggestions.isEmpty
              ? suggestionsList.length
              : _suggestions.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                hideOverlay();
                setState(() {
                  _suggestions.isEmpty
                      ? addedTags.add(suggestionsList[index].toString())
                      : addedTags.add(_suggestions[index].toString());
                });
                controller.clear();
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Colors.black.withOpacity(0.2)))),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                child: _suggestions.isEmpty
                    ? Text(
                        suggestionsList[index].toString(),
                        style: TextStyle(color: Colors.green),
                      )
                    : Text(
                        _suggestions[index].toString(),
                        style: TextStyle(color: Colors.red),
                      ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Container(
        //   // margin: const EdgeInsets.only(top: 50),
        //   color: Colors.grey.withOpacity(0.2),
        //   child: ListView.builder(
        //     shrinkWrap: true,
        //     itemCount: _suggestions.length,
        //     itemBuilder: (BuildContext context, int index) {
        //       return InkWell(
        //         onTap: () {
        //           print('TAPPED ----   ');

        //           setState(() {
        //             addedTags.add(_suggestions[index]);
        //           });
        //           _suggestions.clear();
        //         },
        //         child: ListTile(
        //           title: Text(_suggestions[index]),
        //         ),
        //       );
        //     },
        //   ),
        // ),

        CompositedTransformTarget(
          link: layerlink,
          child: TextFieldTags(
            textfieldTagsController: widget._controller,
            // textSeparators: const [','],
            letterCase: LetterCase.normal,
            inputfieldBuilder:
                (context, tec, fn, error, onChanged, onSubmitted) {
              return ((context, sc, tags, onTagDelete) {
                return TextField(
                  controller: tec,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    hintText: 'Click to add',
                    hintStyle: GoogleFonts.montserrat(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xffCCCCCC)),
                    isDense: true,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffCCCCCC),
                      ),
                    ),
                    errorText: error,
                    prefixIcon: tags.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              controller: sc,
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                  children: tags.map((String tag) {
                                return Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),
                                    ),
                                    color: Color(0xff199BE2),
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 5.0,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                    vertical: 5.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        child: Text(
                                          tag,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        onTap: () {},
                                      ),
                                      const SizedBox(width: 4.0),
                                      InkWell(
                                        child: const Icon(
                                          Icons.cancel,
                                          size: 14.0,
                                          color: Color.fromARGB(
                                            255,
                                            233,
                                            233,
                                            233,
                                          ),
                                        ),
                                        onTap: () {
                                          onTagDelete(tag);
                                          if (addedTags.contains(tag)) {
                                            return;
                                          }
                                          setState(() {});
                                        },
                                      )
                                    ],
                                  ),
                                );
                              }).toList()),
                            ),
                          )
                        : null,
                  ),
                  onChanged: (value) {
                    _updateSuggestions(value);
                    tec.text.isEmpty ? hideOverlay() : showOverlay(tec);
                  },
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        addedTags.add(value);
                        tec.clear();
                      });
                    }
                  },
                  // onSubmitted,
                );
              });
            },
          ),
        ),

        const SizedBox(height: 5.0),
        // if (suggestions.isNotEmpty)

        TypeAheadField(
          
          textFieldConfiguration: TextFieldConfiguration(
            autofocus: true,
            style: DefaultTextStyle.of(context)
                .style
                .copyWith(fontStyle: FontStyle.italic),
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          suggestionsCallback: (pattern) async {
            return await BackendService.getSuggestions(pattern);
          },
          itemBuilder: (context, suggestion) {
            return ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text(suggestion['name']!),
              subtitle: Text('\$${suggestion['price']}'),
            );
          },
          onSuggestionSelected: (suggestion) {
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) => ProductPage(product: suggestion)
            // ));
          },
        ),

        const SizedBox(height: 5.0),
        if (addedTags.isNotEmpty)
          Container(
            height: 60,
            width: 300,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xff199BE2).withOpacity(.2),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Wrap(
              children:
                  // suggestions.map((String tag) {
                  addedTags.map((String tag) {
                return SizedBox(
                  child: InkWell(
                    onTap: () {
                      if (widget._controller.getTags!.contains(tag)) {
                        return;
                      }
                      widget._controller.addTag = tag;
                      addedTags.remove(tag);
                      setState(() {});
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(3.0),
                        ),
                        color: Color(0xff199BE2),
                      ),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 3.0,
                        vertical: 2.0,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 5.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            child: Text(
                              tag,
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            onTap: () {
                              // if (widget._controller.getTags!.contains(tag)) {
                              //   return;
                              // }
                            },
                          ),
                          const SizedBox(width: 4.0),
                          InkWell(
                            child: const Icon(
                              Icons.cancel,
                              size: 14.0,
                              color: Color.fromARGB(
                                255,
                                233,
                                233,
                                233,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                addedTags.remove(tag);
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}

class BackendService {
  static Future<List<Map<String, String>>> getSuggestions(String query) async {
    await Future<void>.delayed(Duration(seconds: 1));

    return List.generate(3, (index) {
      return {
        'name': query + index.toString(),
        'price': Random().nextInt(100).toString()
      };
    });
  }
}

/// A fake service to filter cities based on a query.
class CitiesService {
  static final List<String> cities = [
    'Beirut',
    'Damascus',
    'San Fransisco',
    'Rome',
    'Los Angeles',
    'Madrid',
    'Bali',
    'Barcelona',
    'Paris',
    'Bucharest',
    'New York City',
    'Philadelphia',
    'Sydney',
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = <String>[];
    matches.addAll(cities);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}

class FavoriteCitiesPage extends StatefulWidget {
  @override
  _FavoriteCitiesPage createState() => _FavoriteCitiesPage();
}

class _FavoriteCitiesPage extends State<FavoriteCitiesPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();
  CupertinoSuggestionsBoxController _suggestionsBoxController =
      CupertinoSuggestionsBoxController();
  String favoriteCity = 'Unavailable';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _suggestionsBoxController.close(),
      child: Container(
        color: Colors.amber.withOpacity(0),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(32.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                ),
                Text('What is your favorite city?'),
                CupertinoTypeAheadFormField(
                  getImmediateSuggestions: true,
                  suggestionsBoxController: _suggestionsBoxController,
                  suggestionsBoxDecoration: CupertinoSuggestionsBoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  textFieldConfiguration: CupertinoTextFieldConfiguration(
                    controller: _typeAheadController,
                  ),
                  suggestionsCallback: (pattern) {
                    return Future.delayed(
                      Duration(seconds: 1),
                      () => CitiesService.getSuggestions(pattern),
                    );
                  },
                  itemBuilder: (context, String suggestion) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        suggestion,
                      ),
                    );
                  },
                  onSuggestionSelected: (String suggestion) {
                    _typeAheadController.text = suggestion;
                  },
                  validator: (value) =>
                      value!.isEmpty ? 'Please select a city' : null,
                ),
                SizedBox(
                  height: 10.0,
                ),
                CupertinoButton(
                  child: Text('Submit'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      setState(() {
                        favoriteCity = _typeAheadController.text;
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Your favorite city is $favoriteCity!',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
