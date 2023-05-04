import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/data/app_data.dart';
import 'details.dart';
import 'package:ecommerce_app/model/categories_model.dart';
import 'package:ecommerce_app/utils/constants.dart';
import 'package:ecommerce_app/model/base_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _pageController;
  final int _currentIndex = 2;

  @override
  void initState() {
    _pageController =
        PageController(initialPage: _currentIndex, viewportFraction: 0.7);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Top Text
              FadeInUp(
                delay: const Duration(milliseconds: 300),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Encontre o seu",
                          style: textTheme.headlineSmall,
                          children: [
                            TextSpan(
                              text: " Estilo",
                              style: textTheme.headlineSmall?.copyWith(
                                color: Colors.orange,
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: const TextSpan(
                          text: "Fique mais linda com nossos",
                          style: TextStyle(
                            color: Color.fromARGB(186, 0, 0, 0),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: "sugestões :)",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// Categorias
              FadeInUp(
                delay: const Duration(milliseconds: 450),
                child: Container(
                  margin: const EdgeInsets.only(top: 7),
                  width: size.width,
                  height: size.height * 0.14,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (ctx, index) {
                        CategoriesModel current = categories[index];
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(current.imageUrl),
                              ),
                              SizedBox(
                                height: size.height * 0.006,
                              ),
                              Text(
                                current.title,
                                style: textTheme.titleSmall,
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ),

              /// Controle deslizante do corpo
              FadeInUp(
                delay: const Duration(milliseconds: 550),
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: size.width,
                  height: size.height * 0.40,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: mainList.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Details(
                                  data: mainList[index],
                                  isCameFromMostPopularPart: false,
                                ),
                              ),
                            );
                          },
                          child: view(index, textTheme, size));
                    },
                  ),
                ),
              ),

              /// Texto mais popular
              FadeInUp(
                delay: const Duration(milliseconds: 650),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Mais popular", style: textTheme.headlineSmall),
                      Text("ver tudo", style: textTheme.headlineSmall),
                    ],
                  ),
                ),
              ),

              /// Conteúdo mais popular
              FadeInUp(
                delay: const Duration(milliseconds: 750),
                child: Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  width: size.width,
                  height: size.height * 0.44,
                  child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: mainList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.63),
                      itemBuilder: (context, index) {
                        BaseModel current = mainList[index];
                        return GestureDetector(
                          onTap: (() => Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  return Details(
                                    data: current,
                                    isCameFromMostPopularPart: true,
                                  );
                                }),
                              )),
                          child: Hero(
                            tag: current.imageUrl,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: size.width * 0.4,
                                  height: size.height * 0.2,
                                  margin: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    image: DecorationImage(
                                      image: AssetImage(current.imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(0, 4),
                                        blurRadius: 4,
                                        color: Color.fromARGB(61, 0, 0, 0),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    current.name,
                                    style: textTheme.headlineSmall,
                                  ),
                                ),
                                RichText(
                                    text: TextSpan(
                                        text: "RS",
                                        style: textTheme.titleSmall?.copyWith(
                                          color: primaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        children: [
                                      TextSpan(
                                        text: current.price.toString(),
                                        style: textTheme.titleSmall?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ])),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Visualização de página
  Widget view(int index, TextTheme theme, Size size) {
    return AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 0.0;
          if (_pageController.position.haveDimensions) {
            value = index.toDouble() - (_pageController.page ?? 0);
            value = (value * 0.04).clamp(-1, 1);
          }
          return Transform.rotate(
            angle: 3.14 * value,
            child: card(mainList[index], theme, size),
          );
        });
  }

  /// Cartões de exibição de página
  Widget card(BaseModel data, TextTheme theme, Size size) {
    return Padding(
      padding: const EdgeInsets.only(top: 13.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Hero(
            tag: data.id,
            child: Container(
              width: size.width * 0.3,
              height: size.height * 0.28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                image: DecorationImage(
                  image: AssetImage(data.imageUrl),
                  fit: BoxFit.cover,
                ),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      color: Color.fromARGB(61, 0, 0, 0))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              data.name,
              style: theme.headlineSmall,
            ),
          ),
          RichText(
            text: TextSpan(
              text: "RS",
              style: theme.titleSmall?.copyWith(
                color: primaryColor,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: data.price.toString(),
                  style: theme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.w600, fontSize: 25),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
