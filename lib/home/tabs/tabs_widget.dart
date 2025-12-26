import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newnews_app/home/news/news_widget.dart';
import 'package:newnews_app/home/tabs/tab_item.dart';
import 'package:newnews_app/model/SourceResponse.dart';



class TabsWidget extends StatefulWidget {
List<Sources> sourcesList ;

TabsWidget({required this.sourcesList});

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
              onTap:(index){
                selectedIndex=index;
                setState(() {

                });
              },
              indicatorColor: Colors.transparent,
              isScrollable:true,
                tabs: widget.sourcesList.map((sources) => TabItem(
                  source: sources,
                  isSelected: selectedIndex == widget.sourcesList.indexOf(sources) ,
                )).toList()
            ),
            Expanded(child: NewsWidget(source: widget.sourcesList[selectedIndex]))
          ],
        )
    );

  }
}

