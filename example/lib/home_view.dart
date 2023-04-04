import 'package:flutter/material.dart';

class Home_Dash_Screen extends StatefulWidget {
  const Home_Dash_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Dash_Screen> createState() => _Home_Dash_ScreenState();
}

class _Home_Dash_ScreenState extends State<Home_Dash_Screen> {
  String pageName = 'home';

  Widget getExpenseText() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          "This month spend",
          style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "\$1,200.11",
          style: TextStyle(
              color: Colors.black, fontSize: 32, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }

  Widget getDashBoardTicket(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        height: 220,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white.withOpacity(0.4),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 0), blurRadius: 32)
            ]),
        child: Stack(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.only(right: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "View More",
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                )),
            Align(
                alignment: Alignment.centerLeft,
                child: Image.asset("assets/sales.png"))
          ],
        ));
  }

  AppBar _getAppbar(context, onSearchText(text)) {
    return AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.white24),
          child: TextFormField(
            onChanged: onSearchText,
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '   Search...',
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                )),
          ),
        ));
  }

  Widget listTile() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
              color: Colors.white60, borderRadius: BorderRadius.circular(12)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 42,
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.pink, width: 0.2)),
                child: const Center(
                  child: Text(
                    'HR',
                    style: TextStyle(color: Colors.pink),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Home Rent',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text('\$2000'),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 12,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        )
      ],
    );
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          _getAppbar(context, (text) {
            _scrollController.animateTo(430,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
          }),
          getExpenseText(),
          getDashBoardTicket(context),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 18.0),
                child: Text('Upcoming Plans'),
              ),
              Padding(
                padding: EdgeInsets.only(right: 18.0),
                child: Icon(Icons.sort_rounded),
              )
            ],
          ),
          ListView.builder(
            padding: const EdgeInsets.only(top: 20),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return listTile();
            },
            itemCount: 10,
          )
        ],
      ),
    );
  }
}
