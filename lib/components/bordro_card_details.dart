import 'package:flutter/material.dart';
import 'package:bordro_page/model/bordro_details_list_response_model.dart';
import 'package:bordro_page/service/details_mock_service.dart';

class BordroCardDetails extends StatefulWidget {
  final String startDate;
  final String endDate;
  final List<BordroDetailsListResponseModel>? bordroDetailsList;

  BordroCardDetails({
    Key? key,
    required this.startDate,
    required this.endDate,
    this.bordroDetailsList,
  }) : super(key: key);

  @override
  State<BordroCardDetails> createState() => _BordroCardDetailsState();
}

class _BordroCardDetailsState extends State<BordroCardDetails> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 3, vsync: this);
  }

  BordroDetailsListResponseModelService service =
      BordroDetailsListResponseModelService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tarihlerin geleceği yer",
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          title: Text('${widget.endDate}'),
        ),
        body: Column(
                children: <Widget>[
                  buildIcon(),
                  Flexible(
                    child: buildTabBar())
                ],
              ),
      ),
    );
  }

  Widget buildIcon() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 15),
          child: Container(
            child: const Icon(
              Icons.person_sharp,
              size: 60,
              color: Colors.black38,
            ),
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(150)),
          ),
        ),
        Text("Damla Altıntaş"),
        Text("123456789"),
      ]),
    );
  }

  List<Widget> buildCategories() {
    List<Widget> categoryWidgets = [];
    for (var category in service.fetchBordroDetails()) {
      categoryWidgets.add(buildTypeDayTotalList(
        type: category.type,
        day: category.day,
        total: category.total,
      ));
    }
    return categoryWidgets;
  }


  Widget buildTypeDayTotal() {
    return Container(
      padding: const EdgeInsets.only(left: 35, right: 35),
      height: 45,
      child: Row(
        children: const [
          Text(
            'Tür          ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Text(
            'Gün',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Text(
            'Tutar',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget buildTypeDayTotalList<BordroDetailsListResponseModel>(
      {required type, required day, required total}) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          const Divider(),
          Row(
            children: [
              Container(width: 125, child: Text(type)),
              // Spacer(),
              Container(
                  width: 65,
                  child: Text(
                    day.toString(),
                    textWidthBasis: TextWidthBasis.longestLine,
                    textAlign: TextAlign.right,
                  )),
              // Spacer(),
              Container(
                  width: 140,
                  child: Text(
                    total.toStringAsFixed(2),
                    textAlign: TextAlign.right,
                  ))
            ],
          ),
        ],
      ),
    );
  }


Widget buildTabBar() {
  List<Widget> categoryWidgets = [];
  final List<String> tabs = <String>
  ['Kazançlar', 
  'İş Veren Kesintileri', 
  'Ek Kazançlar', 
  'Yasal Kesintiler',
  'Ek Kesintiler'];

  return  DefaultTabController(
      length: tabs.length, // This is the number of tabs.
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              // These are the slivers that show up in the "outer" scroll view.
              return <Widget>[
                SliverOverlapAbsorber(
                  // This widget takes the overlapping behavior of the SliverAppBar,
                  // and redirects it to the SliverOverlapInjector below. If it is
                  // missing, then it is possible for the nested "inner" scroll view
                  // below to end up under the SliverAppBar even when the inner
                  // scroll view thinks it has not been scrolled.
                  // This is not necessary if the "headerSliverBuilder" only builds
                  // widgets that do not overlap the next sliver.
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(// This is the title in the app bar.
                    pinned: true,
                    toolbarHeight: 2,
                    // The "forceElevated" property causes the SliverAppBar to show
                    // a shadow. The "innerBoxIsScrolled" parameter is true when the
                    // inner scroll view is scrolled beyond its "zero" point, i.e.
                    // when it appears to be scrolled below the SliverAppBar.
                    // Without this, there are cases where the shadow would appear
                    // or not appear inappropriately, because the SliverAppBar is
                    // not actually aware of the precise position of the inner
                    // scroll views.
                    forceElevated: innerBoxIsScrolled,
                    bottom: TabBar(
                      unselectedLabelStyle: TextStyle(fontSize: 13),
                      labelStyle: TextStyle(fontSize: 15),
                      unselectedLabelColor: Colors.white.withOpacity(0.7),
                      isScrollable: true,
                      // These are the widgets to put in each tab in the tab bar.
                      tabs: tabs.map((String name) => Tab(text: name)).toList(),
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              // These are the contents of the tab views, below the tabs.
              children: tabs.map((String name) {
                return SafeArea(
                  top: false,
                  bottom: false,
                  child: Builder(
                    // This Builder is needed to provide a BuildContext that is
                    // "inside" the NestedScrollView, so that
                    // sliverOverlapAbsorberHandleFor() can find the
                    // NestedScrollView.
                    builder: (BuildContext context) {
                      return CustomScrollView(
                        // The "controller" and "primary" members should be left
                        // unset, so that the NestedScrollView can control this
                        // inner scroll view.
                        // If the "controller" property is set, then this scroll
                        // view will not be associated with the NestedScrollView.
                        // The PageStorageKey should be unique to this ScrollView;
                        // it allows the list to remember its scroll position when
                        // the tab view is not on the screen.
                        key: PageStorageKey<String>(name),
                        slivers: <Widget>[
                          SliverOverlapInjector(
                            // This is the flip side of the SliverOverlapAbsorber
                            // above.
                            handle:
                                NestedScrollView.sliverOverlapAbsorberHandleFor(
                                    context),
                          ),
                          SliverPadding(
                            padding: const EdgeInsets.all(8.0),
                            // In this example, the inner scroll view has
                            // fixed-height list items, hence the use of
                            // SliverFixedExtentList. However, one could use any
                            // sliver widget here, e.g. SliverList or SliverGrid.
                            sliver: SliverFixedExtentList(
                              itemExtent: 1000,
                              delegate: SliverChildBuilderDelegate(
                                
                                (BuildContext context, int index) {
                                  // This builder is called for each child.
                                  // In this example, we just number each list item.
                                  return Column(
                                      children: [
                                      Container(
                                          padding: const EdgeInsets.only(top: 10, left: 35, right: 35),
                                          child: Row(
                                            children: const [
                                              Text(
                                                'Tür          ',
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                              Spacer(),
                                              Text(
                                                'Gün',
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                              Spacer(),
                                              Text(
                                                'Tutar',
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                        ListView(
                                          primary: false,
                                          shrinkWrap: true,
                                          children: 
                                          buildCategories(),
                                          ),
                                          const SizedBox(
                                            
                                        )
                                      ]
                                  );
                                },
                                childCount: 1
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              }).toList(),
            ),
          ),
      ),
    );
}
}