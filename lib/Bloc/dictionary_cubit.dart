import 'package:bloc/bloc.dart';
import 'package:dicstionary_bloc_app/Models/word_response.dart';
import 'package:dicstionary_bloc_app/Repositiory/word_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'dictionary_state.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  final WordRepository _repository;
  DictionaryCubit(this._repository) : super(NoWordSearchedState());
  final queryController = TextEditingController();
  Future getWordSearch()async{
   try {
     emit(WordSearchingState());
     final words = await _repository.getWordsFromDictionary(queryController.text.toString());

     if(words == null){
       emit(ErrorState("there is some issue"));
     }else{
       print(words.toString());
       emit (WordSearchedState(words));
       emit (NoWordSearchedState());

     }
   } on Exception catch (e) {
     print(e);
     emit(ErrorState(e.toString()));
   }
  }

}
