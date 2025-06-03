import 'dart:async';
import 'package:flutter/material.dart';
import 'package:otieon/model%20_class/get_home_area_model.dart';
import '../api_call/api_service,.dart';
import '../product_card_widget.dart';

class HomeScreenOne extends StatefulWidget {
  const HomeScreenOne({super.key});

  @override
  State<HomeScreenOne> createState() => _HomeScreenOneState();
}

class _HomeScreenOneState extends State<HomeScreenOne> {
  GetHomeAreaModel? data;
  bool isLoading = true;
  late PageController _pageController;
  Timer? _timer;
  int _currentPage = 0; 
  int _visiblePage = 0; 

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 1);

    _pageController.addListener(() {
      final page = _pageController.page?.round() ?? 0;
      if (page != _visiblePage &&
          page < (data?.results?.mobileSlider?.length ?? 0)) {
        setState(() {
          _visiblePage = page;
        });
      }
    });

    _getHome();
  }

  Future<void> _getHome() async {
    data = await ApiService.viewHomePage();
    setState(() {
      isLoading = false;
    });

    if (data?.results?.mobileSlider != null &&
        data!.results!.mobileSlider!.isNotEmpty) {
      data!.results!.mobileSlider!.add(data!.results!.mobileSlider!.first);
      _startAutoScroll();
    }
  }

  void _startAutoScroll() {
    final totalPages = data!.results!.mobileSlider!.length;

    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      _currentPage++;

      if (_currentPage == totalPages) {
        _pageController.jumpToPage(0);
        _currentPage = 0;
      } else {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  if (isLoading) {
    return const Center(child: CircularProgressIndicator());
  }

  final result = data!.results;
  final originalList = data?.results?.mobileSlider;

  if (originalList == null || originalList.isEmpty) {
    return const Center(child: Text('No slider data found.'));

  }

  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 180,
          child: PageView.builder(
            controller: _pageController,
            itemCount: originalList.length,
            itemBuilder: (context, index) {
              final slider = originalList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    slider.image ??
                        'https://via.placeholder.com/300x180.png?text=No+Image',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 180,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              originalList.length - 1,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _visiblePage == index
                      ? const Color(0xffA1CB39)
                      : Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(child: Divider(color: Colors.black)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text('Best Deals', style: TextStyle(fontSize: 18)),
              ),
               Expanded(child: Divider(color: Colors.black,)),
            ],
          ),
        ),


        SizedBox(height: 10,),
       GridView.builder(
  physics: const NeverScrollableScrollPhysics(),
  shrinkWrap: true,
  itemCount: result?.deals.length ?? 0,
  padding: const EdgeInsets.symmetric(horizontal: 10),
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 0.72, 
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
  ),
  itemBuilder: (context, index) {
    final deals = result!.deals[index];
    return productCard(context,deals);
  },
 ),

       
      ],
    ),
  );
 }
}