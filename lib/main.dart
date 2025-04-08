import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Tracker App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const CardListScreen(),
    );
  }
}

class CardListScreen extends StatelessWidget {
  const CardListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('The Tracker App'), elevation: 0),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: demoItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: CustomAnimatedCard(item: demoItems[index]),
          );
        },
      ),
    );
  }
}

class CustomAnimatedCard extends StatefulWidget {
  final ItemModel item;

  const CustomAnimatedCard({super.key, required this.item});

  @override
  State<CustomAnimatedCard> createState() => _CustomAnimatedCardState();
}

class _CustomAnimatedCardState extends State<CustomAnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _shadowAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.98,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _shadowAnimation = Tween<double>(
      begin: 8.0,
      end: 2.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    if (!_isPressed) {
      _controller.forward();
      setState(() {
        _isPressed = true;
      });
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (_isPressed) {
      _controller.reverse();
      setState(() {
        _isPressed = false;
      });
    }
  }

  void _onTapCancel() {
    if (_isPressed) {
      _controller.reverse();
      setState(() {
        _isPressed = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('You tapped on ${widget.item.title}'),
            duration: const Duration(seconds: 1),
          ),
        );
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: _shadowAnimation.value,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image section
                    Hero(
                      tag: 'image-${widget.item.id}',
                      child: Image.network(
                        widget.item.imageUrl,
                        height: 180.0,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 180.0,
                            color: Colors.grey[300],
                            child: const Center(
                              child: Icon(Icons.error, size: 50.0),
                            ),
                          );
                        },
                      ),
                    ),
                    // Content section
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.item.title,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            widget.item.subtitle,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 12.0),
                          Text(
                            widget.item.description,
                            style: const TextStyle(fontSize: 16.0),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Model for card items
class ItemModel {
  final String id;
  final String imageUrl;
  final String title;
  final String subtitle;
  final String description;

  const ItemModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.description,
  });
}

// Sample data for the ListView
final List<ItemModel> demoItems = [
  const ItemModel(
    id: '1',
    imageUrl: 'https://i.ytimg.com/vi/VTiVHgp-YuM/maxresdefault.jpg',
    title: 'Daffodil International University',
    subtitle: 'A Green Campus',
    description:
        'Explore excellence at Daffodil International University (DIU), Bangladeshs top university for innovative education, world-class research, and career success',
  ),
  const ItemModel(
    id: '2',
    imageUrl:
        'https://cdc.daffodilvarsity.edu.bd/images/2023/03/23/cover2.png',
    title: 'DIU CDC',
    subtitle: 'The Career Development Center',
    description:
        'The Career Development Center (CDC) of Daffodil International University (DIU) was established in 2005 with the aim of providing essential technical assistance and academic support to DIU students.',
  ),
  const ItemModel(
    id: '3',
    imageUrl:
        'https://th.bing.com/th/id/OIP.1xNKZsQhm4_f7nBnRyFkLwHaFH?rs=1&pid=ImgDetMain',
    title: 'Dhaka',
    subtitle: 'The Capital of Bangladesh',
    description:
        'Dhaka is the capital and largest city of Bangladesh. It is located in the geographic center of the country in the great deltaic region of the Ganges and Brahmaputra rivers.',
  ),
  const ItemModel(
    id: '4',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/b/bc/Rangamati1.jpg',
    title: 'Rangamati',
    subtitle: 'A Beautiful Place In Bangladesh',
    description:
        'Rangamati is surrounded by natural features such as mountains, rivers, lakes, and waterfalls. Rangamati is also home to several ethnic groups.',
  ),
  const ItemModel(
    id: '5',
    imageUrl:
        'https://cdn.getyourguide.com/img/tour/a4615d0f5c435401346aba8c763287bd15d03eb0dad41e75d3b50082805d9d11.jpg/132.webp',
    title: 'Taj Mahal',
    subtitle: 'A Tourist Place In India',
    description:
        'It was commissioned in 1631 by the fifth Mughal emperor, Shah Jahan (r. 1628–1658) to house the tomb of his beloved wife, Mumtaz Mahal; it also houses the tomb of Shah Jahan himself',
  ),
];
