import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int selectedWeightIndex = 2;

  final List<String> weights = ['0.5kg', '1kg', '1.5kg', '2kg', '2.5kg'];

  Widget buildWeightBox(int index) {
    bool isSelected = selectedWeightIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedWeightIndex = index;
        });
      },
      child: Container(
        height: 40,
        width: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.brown : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.brown : Colors.grey,
            width: 2,
          ),
        ),
        child: Text(
          weights[index],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(300),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Stack(
            children: [
              Image.asset(
                'assets/cake3.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 60),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0, top: 60),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Icon(Icons.favorite_border,
                            color: Colors.black),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Icon(Icons.share, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 50,
                    width: 285,
                    margin:
                        const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset('assets/cake1.jpg')),
                          const SizedBox(width: 8),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset('assets/cake2.jpg')),
                          const SizedBox(width: 8),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset('assets/cake4.jpg')),
                          const SizedBox(width: 8),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset('assets/cake5.jpg')),
                          const SizedBox(width: 8),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset('assets/cake6.jpg')),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                  left: 18.0, right: 18.0, top: 18.0, bottom: 10),
              child: Row(
                children: [
                  Text('Cake'),
                  Spacer(),
                  Icon(Icons.star, color: Colors.yellow),
                  Text('4.9'),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 18.0, right: 12.0),
              child: Row(
                children: [
                  Text(
                    'Chocolate Cake',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.fromBorderSide(
                            BorderSide(color: Colors.green)),
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: Center(
                        child: CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  Text(
                    'Seller',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/people.jpg'),
                  ),
                ),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Jenny Wilson',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Text('Cook')
                  ],
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.message, color: Color(0xFF6c4718)),
                      SizedBox(width: 25),
                      Icon(Icons.call, color: Color(0xFF6c4718)),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.only(left: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 8),
                  Text('This is a great cake for eating',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12)),
                  Text(
                      'This is a great cake for eating and it was made by by very ',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12)),
                  Text(
                      'This is a great cake for eating and it was made by by very .',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                'Select Weight',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildWeightBox(0),
                  buildWeightBox(1),
                  buildWeightBox(2),
                  buildWeightBox(3),
                  buildWeightBox(4),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Price'),
                      Text(
                        '\$25.00',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
            Spacer(),
                  Container(
                    height: 50,
                    width: 200,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFF6c4718),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:18.0),
                          child: Icon(Icons.lock, color: Colors.white),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Add to Cart',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
