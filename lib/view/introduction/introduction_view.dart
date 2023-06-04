import 'package:flutter/material.dart';
import 'package:introduction_ui/view/home/home_view.dart';

class IntroductionView extends StatefulWidget {
  const IntroductionView({super.key});

  @override
  State<IntroductionView> createState() => _IntroductionViewState();
}

class _IntroductionViewState extends State<IntroductionView> {
  int selectPage = 0;
  PageController? controller = PageController();

  Color textColor = const Color(0xffFC671E);

  List infoArr = [
    {
      "title": "Create on Account",
      "title_2": "Eat Healthy Food",
      "info":
          "Food is any substance consumed to\nprovide nutritional support for an\norganism. Food is usually",
      "img": "assets/img/1.png"
    },
    {
      "title": "Log in to your account",
      "title_2": "30 Mint Delivery",
      "info":
          "Food is any substance consumed to\nprovide nutritional support for an\norganism. Food is usually",
      "img": "assets/img/2.png"
    },
    {
      "title": "Enjoy our Service",
      "title_2": "Easy Payment",
      "info":
          "Food is any substance consumed to\nprovide nutritional support for an\norganism. Food is usually",
      "img": "assets/img/1.png"
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller?.addListener(() {
      var page = controller?.page?.round() ?? 0;

      setState(() {
        selectPage = page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          PageView.builder(
              controller: controller,
              physics: const BouncingScrollPhysics(),
              itemCount: infoArr.length,
              itemBuilder: (context, index) {
                var infoObj = infoArr[index] as Map? ?? {};

                return Container(
                  width: media.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        infoObj["title"].toString(),
                        style: TextStyle(
                            color: textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        infoObj["title_2"].toString(),
                        style: const TextStyle(
                            color: Color(0xff3F3F3F),
                            fontSize: 32,
                            fontWeight: FontWeight.w700),
                      ),
                      Spacer(),
                      SizedBox.square(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 30),
                          child: Image.asset(
                            infoObj["img"].toString(),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            infoObj["info"].toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Color(0xff939393), fontSize: 18),
                          ),
                        ],
                      ),
                     const Spacer(),
                    ],
                  ),
                );
              }),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {

                         Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeView()));

                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontSize: 17),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: infoArr.map((infoObj) {
                        var index = infoArr.indexOf(infoObj);
                        return Container(
                          margin: const EdgeInsets.all(4),
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              color: selectPage == index ? textColor : textColor.withOpacity(0.5) ,
                              borderRadius: BorderRadius.circular(5)),
                        );
                      }).toList(),
                    ),
                    TextButton(
                      onPressed: () {

                          if(selectPage < 2 ) {
                              selectPage = selectPage + 1;
                              controller?.jumpToPage(selectPage);
                          }else{
                            // Next Screen;

                              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeView() ));
                          }

                          

                      },
                      child: Text(
                        "Next",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: textColor,
                            fontSize: 17),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
