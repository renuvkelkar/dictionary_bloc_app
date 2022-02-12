import 'dart:convert';

import 'package:dicstionary_bloc_app/Models/word_response.dart';
import 'package:dicstionary_bloc_app/Services/http_service.dart';

class WordRepository{
  Future<List<WordResponse>>getWordsFromDictionary(String query)async{
   final response = await HttpService.getRequest("en/$query");
   if(response.statusCode == 200){
   List<WordResponse> wordResponseData = [];
   var TempList = jsonDecode(response.body);
   TempList.forEach((element) {
     wordResponseData.add(WordResponse.fromJson(element));
   });
   return wordResponseData;
   }
   else{

     return [];
   }

  }
}