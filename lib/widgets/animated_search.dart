import 'package:flikk/model/provider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimatedSearchBar extends StatefulWidget {
  const AnimatedSearchBar({Key? key}) : super(key: key);

  @override
  _AnimatedSearchBarState createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  bool _folded = true;
  final searchCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var providerInstance = Provider.of<MoviesProvider>(context, listen: false);
    final width = MediaQuery.of(context).size.width * 0.92;
    return AnimatedContainer(
      curve: Curves.easeIn,
      alignment: Alignment.centerLeft,
      height: 56,
      width: _folded ? 56 : width,
      duration: Duration(milliseconds: 400),
      decoration: BoxDecoration(
        boxShadow: kElevationToShadow[6],
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 18),
              child: !_folded
                  ? TextField(
                      controller: searchCtrl,
                      cursorColor: Colors.black38,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                      ),
                      onChanged: (_) => providerInstance
                          .filter(searchCtrl.text.toLowerCase()),
                    )
                  : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    _folded = !_folded;
                    searchCtrl.clear();
                    providerInstance.filter("");
                  });
                },
                icon: Icon(
                  _folded ? Icons.search_rounded : Icons.close,
                  size: 30,
                )),
          ),
        ],
      ),
    );
  }
}
