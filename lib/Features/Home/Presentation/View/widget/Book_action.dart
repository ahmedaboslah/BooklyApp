import 'package:bookly/Features/Home/data/model/book_model/book_model.dart';
import 'package:bookly/core/Util/Function/LaunchUrl.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Custom_Button.dart';

class BookActionButton extends StatelessWidget {
  const BookActionButton({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              text: r'19.99$',
              backgroundColor: Colors.white,
              TextColor: Colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16)),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
               launchCustomurl(context, bookModel.volumeInfo.previewLink!);
              },
              fontsize: 16,
              text: getText(bookModel),
              backgroundColor: Color(0xffEF8262),
              TextColor: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  topRight: Radius.circular(16)),
            ),
          ),
        ],
      ),
    );
  }
}

getText(BookModel bookModel) {
  if(bookModel.volumeInfo.previewLink==null){
    return 'not avaliable';
  }
  else{
    return 'Preview';
  }
}
