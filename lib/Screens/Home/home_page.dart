import 'package:dicstionary_bloc_app/Bloc/dictionary_cubit.dart';
import 'package:dicstionary_bloc_app/Screens/List/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  getDictionaryFormWidget(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();


    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Spacer(),
          Text(
            "Dictionary App",
            style: TextStyle(
              color: Colors.deepOrangeAccent,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Search any word you want quickly",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          TextField(
            controller: cubit.queryController,

            decoration: InputDecoration(
              hintText: "Search a word",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              fillColor: Colors.grey[100],
              filled: true,
              prefixIcon: Icon(Icons.search),
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
          Spacer(),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                cubit.getWordSearch();
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrangeAccent,
                  padding: const EdgeInsets.all(16)),
              child: Text("SEARCH"),
            ),
          ),
        ],
      ),
    );
  }

  getLoadingWidget() {
    return Center(child: CircularProgressIndicator());
  }

  getErrorWidget(message) {
    return Center(child: Text(message, style: TextStyle(color: Colors.white),));
  }


  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();


    return BlocListener<DictionaryCubit, DictionaryState>(
      listener: (context, state) {
        if (state is WordSearchedState && state.words != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListPage(words: state.words,),
            ),
          );
        }

        // TODO: implement listener
      },
      bloc: cubit,
      child: Scaffold(
          backgroundColor: Colors.blueGrey.shade900,
          appBar: AppBar(
            title: Text("Dictionary App"),
          ),
          body: cubit.state is WordSearchingState ? getLoadingWidget() :
          cubit.state is ErrorState ? getErrorWidget("there is error") :
          cubit.state is NoWordSearchedState ?
          getDictionaryFormWidget(context) : Container(
            child: Text("There is no data"),
          )
      ),
    );
  }
}

