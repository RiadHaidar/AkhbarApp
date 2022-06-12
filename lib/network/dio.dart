import 'package:dio/dio.dart';


class DioHelper{
 
 static late  Dio dio;

 static init(){
   dio = Dio(
     BaseOptions(baseUrl: 'https://newsapi.org/', 
     receiveDataWhenStatusError:true,
     ),
   );
 }

 static Future<Response> getData  ({
  required String url, 
 required  Map<String,dynamic> query, 


 })async{

   return await dio.get(url ,queryParameters: query );
 }
// static void getData(
//   {
//     String? url, 
//     Map<String,dynamic> ? qureyResult,
//   }

// ){

//   dio.get();
// }

}














// POST
// UPDATE
// DELETE

// GET

// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// queries : country=eg&category=business&apiKey=ec9a0887e1b048f1bcbb5ba5da9bfc07
// apiKey=ec9a0887e1b048f1bcbb5ba5da9bfc07
// https://newsapi.org/v2/top-headlines?q=
//https://newsapi.org/v2/everything?q=tesla&apiKey=ec9a0887e1b048f1bcbb5ba5da9bfc07




  // void getBusiness() {
  //   emit(NewsLoadingBusinessState());
  //   DioHelper.getData(url: 'v2/top-headlines', query: {
  //     'country': 'us',
  //     'category': 'business',
  //     'apiKey': 'ec9a0887e1b048f1bcbb5ba5da9bfc07'
  //   }).then((value) {
  //           business = value.data['articles'];
  //     print(business[0]['title']);
  //     emit(NewsGetBusinessState());
  //   }).catchError((error) {
  //     emit(NewsErrorBusinessState(error.toString()));
  //   });
  // }