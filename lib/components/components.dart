import 'package:akhbarapp/cubit/news_cubit.dart';
import 'package:akhbarapp/network/dio.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../webview_screen/webview_screen.dart';

Widget ItemBuilder(dynamic article, context) {
  return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: ((context) {
          return WebViewScreen(
            article['url'],
          );
        })));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          // mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Container(
                width: 120,
                height: 120,

                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10),
                     image: DecorationImage(
                       image: NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover
                ),
                
                    ),

                // child: CachedNetworkImage(
                //   imageUrl: '${article['urlToImage']}',
                //   placeholder: (context, url) => CircularProgressIndicator(),
                //   errorWidget: (context, url, error) => new Icon(Icons.error),
                // ),

                //Image.network('${article['urlToImage']}', fit: BoxFit.cover,)
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${article['title']}',
                      softWrap: true,
                      //    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      '${article['publishedAt']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      //  softWrap: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ));
}

Widget articleBuilder(articleList, context) => ConditionalBuilder(
      condition: articleList.isNotEmpty,
      builder: (context) => listItemsBuilder(articleList),
      fallback: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );

Widget listItemsBuilder(list) => ListView.separated(
    itemBuilder: (context, index) {
      return ItemBuilder(list[index], context);
    },
    separatorBuilder: (context, index) => Divider(
          height: 2,
          thickness: 3,
          // color: Colors.grey,
        ),
    itemCount: list.length);

TextEditingController textEditingController = TextEditingController();

Widget listSearchBuilder(dynamic list, context) => InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: ((context) {
        return WebViewScreen(list['url']);
      })));
    },
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Form(
            // key: ,
            child: TextFormField(
              controller: textEditingController,
             // textDirection: TextDirection.ltr,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'enter search keyword',
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                //  disabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onChanged: (value) {
                // textEditingController.text = value;
                //   FocusScope.of(context).unfocus();

                NewsCubit.get(context).SerachNews(value);
              },
              onFieldSubmitted: (input) {
                if (input.isEmpty) {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Search Error'),
                      content: const Text('Search Inpput must not be empty'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Container(
              height: 200,
              child: articleBuilder(list, context),
            ),
          ),
        ],
      ),
    ));
