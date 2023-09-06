import 'package:bookly/Features/Home/Presentation/View/widget/Best_Siller_ListView.dart';
import 'package:bookly/Features/Home/Presentation/View/widget/Best_Siller_List_View.dart';
import 'package:bookly/Features/Home/Presentation/View/widget/Custom_List_Item.dart';
import 'package:bookly/Features/Home/Presentation/View/widget/Custom_app_bar.dart';
import 'package:bookly/Features/Home/Presentation/View/widget/Custom_list_view.dart';
import 'package:bookly/core/Util/Assets.dart';
import 'package:bookly/core/Util/Style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CustomApBar(),
              Custom_List_View(),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Best Seller",
                  style: Style.TextStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        const SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: BestSellerListView(),
          ),
        )
      ],
    );
  }
}
