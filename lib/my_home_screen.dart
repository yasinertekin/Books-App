import 'package:flutter/material.dart';
import 'package:flutter_book_store/books_info.dart';

import 'books_detail.dart';

class MyHomePage extends StatefulWidget with _MyColors, _MyPaddingUtility {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    const String firstTabTitle = 'New';
    const String secondTabTitle = 'Trending';
    const String thirdTabTitle = 'Best Seller';
    const String userName = 'Hi, Yasin';
    const String title = 'Discover Latest Book';

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: const _MyBottomNavigationBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 70,
              ),
              const Text(userName),
              const SizedBox(
                height: 10,
              ),
              const Text(
                title,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              _MySearchBar(),
              const SizedBox(
                height: 10,
              ),
              TabBar(
                isScrollable: true,
                indicatorColor: _MyColors().myBlackColor,
                indicatorWeight: 3,
                indicatorPadding: _MyPaddingUtility().myIndicatorPadding,
                labelColor: _MyColors().myBlackColor,
                unselectedLabelColor: _MyColors().myGreyColor,
                tabs: const [
                  Tab(icon: Text(firstTabTitle)),
                  Tab(icon: Text(secondTabTitle)),
                  Tab(icon: Text(thirdTabTitle)),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // New Sayfası
                    _myPageView(),

                    // Trending
                    _myPageView(),

                    // Best Seller
                    _myPageView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MyBottomNavigationBar extends StatefulWidget {
  const _MyBottomNavigationBar();

  @override
  State<_MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<_MyBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        _currentIndex = index;
        setState(() {
          _currentIndex = index;
        });
      },
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedIconTheme: const IconThemeData(color: Colors.red, shadows: [
        BoxShadow(
          color: Colors.red,
          blurRadius: 8,
          blurStyle: BlurStyle.solid,
        ),
      ]),
      currentIndex: _currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark_add_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
      ],
    );
  }
}

// ignore: camel_case_types, must_be_immutable
class _myPageView extends StatelessWidget with _NavigatorManager, _MyPaddingUtility {
  _myPageView();

  myBookLibrary myBooksDescription1 = myBookLibrary();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _TopImageCard(
                          book1: myBooksDescription1.book1,
                        ),
                        _TopImageCard(
                          book1: myBooksDescription1.book2,
                        ),
                        _TopImageCard(
                          book1: myBooksDescription1.book3,
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Popular',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: _MyColors().myBlackColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                _MyBodyView(book1: myBooksDescription1.book1),
                _MyBodyView(book1: myBooksDescription1.book2),
                _MyBodyView(book1: myBooksDescription1.book3),
                _MyBodyView(book1: myBooksDescription1.book4),
                _MyBodyView(book1: myBooksDescription1.book5),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TopImageCard extends StatelessWidget with _NavigatorManager, _MyPaddingUtility {
  _TopImageCard({
    required this.book1,
  });
  final myBooks book1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: myPadding,
      child: InkWell(
        onTap: () {
          navigatoToWidget(
            context,
            BookDetailView(
              bookTitle: book1.title,
              bookAuthor: book1.author,
              bookPrice: book1.price,
              bookImage: book1.image,
              bookDescription: book1.description,
            ),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              book1.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class _MyBodyView extends StatelessWidget with _NavigatorManager {
  const _MyBodyView({
    required this.book1,
  });

  final myBooks book1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          navigatoToWidget(
              context,
              BookDetailView(
                bookTitle: book1.title,
                bookAuthor: book1.author,
                bookPrice: book1.price,
                bookImage: book1.image,
                bookDescription: book1.description,
              ));
        },
        child: SizedBox(
          height: 150,
          child: Row(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(book1.image),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(book1.title,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: _MyColors().myBlackColor, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(book1.author,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: _MyColors().myGreyColor)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(book1.price,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: _MyColors().myBlackColor, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        ) //Text(book1.title))),

        );
  }
}

// ignore: camel_case_types
class myBookLibrary {
  myBooks book1 = myBooks(
      title: 'Babaya Mektup',
      author: 'Franz Kafka',
      price: '\$20',
      image: 'assets/images/babayamektup.jpg',
      description:
          'Letter to Father is a letter Franz Kafka wrote to his father, Hermann, in November 1919. In this work, Kafka claims that his father psychologically abused him. Kafka gives the 45-page letter to his mother to deliver to his father, but his mother returns the letter to her son.');

  myBooks book2 = myBooks(
    title: 'Fahrenheit 451',
    author: 'Ray Bradbury',
    price: '\$40',
    image: 'assets/images/fahrenheit.jpg',
    description:
        'Letter to Father is a letter that Franz Kafka wrote to his father, Hermann, in November 1919. In this work, Kafka claims that his father psychologically abused him. Kafka gives the 45-page letter to his mother to deliver to his father, but his mother returns the letter to her son.',
  );
  myBooks book3 = myBooks(
    title: '1984',
    author: 'George Orwell',
    price: '\$15',
    image: 'assets/images/georgeorwell.jpg',
    description:
        '1984 is a dystopian novella by George Orwell published in 1949, which follows the life of Winston Smith, a low ranking member of the Party, who is frustrated by the omnipresent eyes of the party, and its ominous ruler Big Brother. Big Brother controls every aspect of peoples lives.',
  );
  myBooks book4 = myBooks(
    title: 'Sherlock Holmes',
    author: 'Arthur Conan Doyle',
    price: '\$20',
    image: 'assets/images/sherlockholmes.jpg',
    description:
        'Holmes has essentially an obsessive personality. He works compulsively on all his cases and his deductive powers are phenomenal. He can get engulfed in periods of depression between cases and is known to take cocaine when he cannot stand the lack of activity.',
  );
  myBooks book5 = myBooks(
      title: 'Simyacı',
      author: 'Paulo Coelho',
      price: '\$30',
      image: 'assets/images/simyaciphoto.jpg',
      description:
          'The Alchemist is the philosophical story of the fabled life of the Andalusian shepherd Santiago, who left Spain to seek his treasure at the foot of the Egyptian Pyramids. Perhaps the reason why the Alchemist sells so much around the world is that its quality of guiding and giving advice is at the forefront. Reading The Alchemist is like waking up when everyone else is asleep and waiting for the sun to rise at dawn.');
}

//searchBar

class _MySearchBar extends StatelessWidget with _MyColors {
  _MySearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        textAlignVertical: TextAlignVertical.bottom,
        textInputAction: TextInputAction.search,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: _MyColors().myBlackColor,
          fontSize: 15,
        ),
        decoration: InputDecoration(
          filled: true,
          hintText: 'Search book',
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(80),
            ),
            borderSide: BorderSide.none,
          ),
          suffixIcon: Container(
            decoration: BoxDecoration(
              color: _MyColors().mySearchIconColor,
              borderRadius: BorderRadius.circular(70),
            ),
            child: Icon(
              Icons.search,
              color: _MyColors().myBlackColor,
            ),
          ),
        ),
      ),
    );
  }
}

mixin _NavigatorManager {
  void navigatoToWidget(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          if (widget is BookDetailView) {
            return BookDetailView(
              bookTitle: widget.bookTitle,
              bookAuthor: widget.bookAuthor,
              bookPrice: widget.bookPrice,
              bookImage: widget.bookImage,
              bookDescription: widget.bookDescription,
            );
          }
          return widget;
        },
        settings: const RouteSettings(),
      ),
    );
  }
}

class _MyColors {
  Color mySearchIconColor = const Color(0xffFFAAA5);
  Color myBlackColor = const Color(0xff000000);
  Color myGreyColor = const Color(0xff9E9E9E);
  Color myWhiteColor = const Color(0xffFFFFFF);
}

class _MyPaddingUtility {
  EdgeInsets myPadding = const EdgeInsets.all(8.0);
  EdgeInsets myIndicatorPadding = const EdgeInsets.symmetric(vertical: 13, horizontal: 30);
}
