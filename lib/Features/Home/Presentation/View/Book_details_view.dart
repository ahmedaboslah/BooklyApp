import 'package:bookly/Features/Home/Presentation/Manager/Similar_book_cubi/cubit/similar_book_cubit.dart';
import 'package:bookly/Features/Home/Presentation/View/widget/Book_details_view_item.dart';
import 'package:bookly/Features/Home/data/model/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookmodel});
  final BookModel bookmodel;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<SimilarBookCubit>(context).fetchsimilar(category:widget.bookmodel.volumeInfo.categories![0]);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BookDetailViewItem(bookModel: widget.bookmodel,)),
    );
    ;
  }
}
