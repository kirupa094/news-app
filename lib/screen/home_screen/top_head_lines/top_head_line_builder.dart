import 'package:flutter/material.dart';
import 'package:news_app/bloc/provider.dart';
import 'package:news_app/custom_widget/custom_text.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/screen/home_screen/top_head_lines/top_head_line_card_widget.dart';
import 'package:news_app/util/constant.dart';

class TopHeadLineBuilder extends StatelessWidget {
  const TopHeadLineBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeBloc = Provider.of(context).homeBloc;
    return StreamBuilder<List<NewsModel>>(
      stream: homeBloc.topNewsHeadLines,
      builder: (BuildContext context, AsyncSnapshot<List<NewsModel>> snapshot) {
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
    );
  }

  _buildList(List<NewsModel>? lst, BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        width: 8,
      ),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: lst!.length,
      itemBuilder: (BuildContext context, int index) {
        return TopHeadLineCardWidget(
          author: lst[index].author,
          description: lst[index].description,
          title: lst[index].title,
          url: lst[index].urlToImage,
          publishAt: lst[index].publishedAt,
          content: lst[index].content,
        );
      },
    );
  }
}
