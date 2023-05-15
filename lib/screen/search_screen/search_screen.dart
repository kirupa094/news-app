import 'package:flutter/material.dart';
import 'package:news_app/bloc/provider.dart';
import 'package:news_app/custom_widget/custom_text.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/screen/home_screen/top_head_lines/top_head_line_card_widget.dart';
import 'package:news_app/screen/search_screen/search_card_widget.dart';
import 'package:news_app/util/constant.dart';

class SearchScreen extends StatelessWidget {
  final String query;
  final TextEditingController _searchTextController = TextEditingController();

  SearchScreen({Key? key, required this.query}) : super(key: key) {
    _searchTextController.text = query;
  }

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final homeBloc = Provider.of(context).homeBloc;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Form(
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
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                  hintText: 'Enter word to search',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      if (_form.currentState!.validate()) {
                        homeBloc.fetchSearchNews(
                            _searchTextController.text, 'popularity');
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
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Column(
            children: [
              StreamBuilder<List<NewsModel>>(
                stream: homeBloc.searchNews,
                builder: (BuildContext context,
                    AsyncSnapshot<List<NewsModel>> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isNotEmpty) {
                      return _buildList(snapshot.data, context);
                    }
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return CustomText(
                      text: snapshot.error.toString(),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      fontFamily: 'nunito',
                      color: textWarning,
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildList(List<NewsModel>? lst, BuildContext context) {
    return Flexible(
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: lst!.length,
        itemBuilder: (BuildContext context, int index) {
          return SearchCardWidget(
            author: lst[index].author,
            title: lst[index].title,
            url: lst[index].urlToImage,
            publishAt: lst[index].publishedAt,
          );
        },
      ),
    );
  }
}
