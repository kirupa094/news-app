import 'package:flutter/material.dart';
import 'package:news_app/bloc/provider.dart';
import 'package:news_app/screen/search_screen/search_screen.dart';
import 'package:news_app/util/constant.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final _searchTextController = TextEditingController();

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeBloc = Provider.of(context).homeBloc;
    return Form(
      key: _form,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: TextFormField(
          controller: _searchTextController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Field is not empty';
            }
            return null;
          },
          cursorColor: Colors.black,
          cursorWidth: 1.5,
          cursorRadius: const Radius.circular(2.0),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(15.0),
            filled: true,
            fillColor: const Color.fromRGBO(241, 246, 246, 1),
            hintStyle: const TextStyle(
                fontFamily: 'nunito',
                color: labelTextColor,
                fontWeight: FontWeight.w600,
                fontSize: 12),
            hintText: 'Enter word to search',
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                if (_form.currentState!.validate()) {
                  homeBloc.fetchSearchNews(
                      _searchTextController.text, 'popularity');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SearchScreen(query: _searchTextController.text),
                    ),
                  );
                }
              },
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 238, 238, 238), width: 2),
              borderRadius: BorderRadius.circular(50),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 238, 238, 238), width: 2),
              borderRadius: BorderRadius.circular(50),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: textWarning, width: 2),
              borderRadius: BorderRadius.circular(50),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: textWarning, width: 2),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
    );
  }
}
