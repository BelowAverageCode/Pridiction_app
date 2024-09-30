import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Premium Reports',
      theme: ThemeData.dark(),
      home: const Screen(),
    );
  }
}

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> with TickerProviderStateMixin {
  late ScrollController _scrollController;
  BuildContext? tabContext;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(animateToTab);
    super.initState();
  }

  void animateToTab() {
    late RenderBox box;
    for (int i = 0; i < keys.length; i++) {
      box = keys[i].currentContext!.findRenderObject() as RenderBox;
      Offset position = box.localToGlobal(Offset.zero);

      if (_scrollController.offset >= position.dy) {
        DefaultTabController.of(tabContext!)
            ?.animateTo(i, duration: const Duration(milliseconds: 100));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 24, 24, 36),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 24, 24, 36),
          toolbarHeight: 100,
          leading: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Icons.keyboard_backspace_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
          title: Text(
            "Premium Reports",
            style: GoogleFonts.duruSans(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.notifications_none_outlined,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {},
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: DefaultTabController(
          length: tabs.length,
          child: Builder(builder: (context) {
            tabContext = context;
            return SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Browse Our Premium Reports",
                      style: GoogleFonts.duruSans(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromRGBO(31, 32, 51, 1),
                      ),
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 26,
                            color: Color.fromRGBO(100, 101, 138, 1),
                          ),
                          border: InputBorder.none,
                          hintText: "Search Marriage, career, etc.",
                          hintStyle: GoogleFonts.duruSans(
                            color: const Color.fromRGBO(100, 101, 138, 1),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TabBar(
                      isScrollable: true,
                      indicatorColor: Colors.blue.shade700,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 20),
                      tabs: tabs,
                      labelStyle: GoogleFonts.duruSans(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      unselectedLabelColor:
                      const Color.fromRGBO(100, 101, 138, 1),
                    ),
                    const SizedBox(height: 10),
                    _buildCategoryContent("Marriage", marriagePlans),
                    _buildCategoryContent("Career", careerPlans),
                    _buildCategoryContent("Family", familyPlans),
                    _buildCategoryContent("Health", healthPlans),
                    _buildCategoryContent("Business", businessPlans),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

// List of tabs
List<Tab> tabs = [
  const Tab(text: "Marriage"),
  const Tab(text: "Career"),
  const Tab(text: "Family"),
  const Tab(text: "Health"),
  const Tab(text: "Business")
];

// List of GlobalKeys for scrolling animation
final List<GlobalKey> keys = [
  GlobalKey(),
  GlobalKey(),
  GlobalKey(),
  GlobalKey(),
  GlobalKey(),
];

// Dummy data for the plans
List<Map<String, dynamic>> marriagePlans = [
  {
    'image': 'assets/marriage.png',
    'title': 'Marriage Timing Prediction',
    'description': 'Discover the perfect timing for your marriage.',
    'price': 999.00,
    'rating': 4.7,
  },
  {
    'image': 'assets/marriage.png',
    'title': 'Marriage Timing Prediction',
    'description': 'Discover the perfect timing for your marriage.',
    'price': 1999.00,
    'rating': 4.8,
  },
  {
    'image': 'assets/marriage.png',
    'title': 'Marriage Timing Prediction',
    'description': 'Discover the perfect timing for your marriage.',
    'price': 2999.00,
    'rating': 4.9,
  },
  // Add more plans
];

List<Map<String, dynamic>> careerPlans = [
  {
    'image': 'assets/career.png',
    'title': 'Career Growth Prediction',
    'description': 'Insights for career growth and opportunities.',
    'price': 1299.00,
    'rating': 4.6,
  },
  {
    'image': 'assets/career.png',
    'title': 'Career Growth Prediction',
    'description': 'Insights for career growth and opportunities.',
    'price': 2299.00,
    'rating': 4.9,
  },
  {
    'image': 'assets/career.png',
    'title': 'Career Growth Prediction',
    'description': 'Insights for career growth and opportunities.',
    'price': 3299.00,
    'rating': 4.7,
  },
  // Add more plans
];

List<Map<String, dynamic>> familyPlans = [
  {
    'image': 'assets/family.png',
    'title': 'Family Wellness Report',
    'description': 'Plan for family health and wellness.',
    'price': 899.00,
    'rating': 4.7,
  },
  {
    'image': 'assets/family.png',
    'title': 'Family Wellness Report',
    'description': 'Plan for family health and wellness.',
    'price': 1899.00,
    'rating': 4.9,
  },
  {
    'image': 'assets/family.png',
    'title': 'Family Wellness Report',
    'description': 'Plan for family health and wellness.',
    'price': 2899.00,
    'rating': 4.5,
  },
  // Add more plans
];

List<Map<String, dynamic>> healthPlans = [
  {
    'image': 'assets/health.png',
    'title': 'Health Prediction Report',
    'description': 'Get a detailed health and wellness prediction.',
    'price': 1199.00,
    'rating': 4.6,
  },
  {
    'image': 'assets/health.png',
    'title': 'Health Prediction Report',
    'description': 'Get a detailed health and wellness prediction.',
    'price': 2199.00,
    'rating': 4.9,
  },
  {
    'image': 'assets/health.png',
    'title': 'Health Prediction Report',
    'description': 'Get a detailed health and wellness prediction.',
    'price': 3199.00,
    'rating': 4.7,
  },
  // Add more plans
];

List<Map<String, dynamic>> businessPlans = [
  {
    'image': 'assets/business.png',
    'title': 'Business Success Prediction',
    'description': 'Predict your business success using AI.',
    'price': 1999.00,
    'rating': 4.9,
  },
  {
    'image': 'assets/business.png',
    'title': 'Business Success Prediction',
    'description': 'Predict your business success using AI.',
    'price': 2999.00,
    'rating': 4.7,
  },
  {
    'image': 'assets/business.png',
    'title': 'Business Success Prediction',
    'description': 'Predict your business success using AI.',
    'price': 3999.00,
    'rating': 4.7,
  },
  // Add more plans
];

// Build content for each category
Widget _buildCategoryContent(String title, List<Map<String, dynamic>> plans) {
  return Column(
    key: keys[tabs.indexWhere((tab) => tab.text == title)],
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Text(
          title,
          style: GoogleFonts.duruSans(
            color: const Color.fromRGBO(100, 101, 138, 1),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: plans.length,
        itemBuilder: (context, index) {
          var plan = plans[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromRGBO(31, 32, 51, 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          plan['image'],
                          width: 80,
                          height: 80,
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "₹${plan['price'].toStringAsFixed(2)}",
                                style: GoogleFonts.duruSans(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    plan['rating'].toString(),
                                    style: GoogleFonts.duruSans(
                                      color: Colors.yellow.shade700,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 14,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "/ 5",
                                    style: GoogleFonts.duruSans(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                plan['title'],
                                style: GoogleFonts.duruSans(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                plan['description'],
                                style: GoogleFonts.duruSans(
                                  color:
                                  const Color.fromRGBO(100, 101, 138, 1),
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // Handle purchase action
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 8),
                                    ),
                                    child: Text(
                                      'Purchase',
                                      style: GoogleFonts.duruSans(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  OutlinedButton(
                                    onPressed: () {
                                      // Handle view action
                                    },
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                          color: Colors.white),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 8),
                                    ),
                                    child: Text(
                                      'View',
                                      style: GoogleFonts.duruSans(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ],
  );
}
