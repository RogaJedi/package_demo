import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fullstack_group_ui_kit/fullstack_group_ui_kit.dart';
import 'package:package_demo/navigation_cubit.dart';

import 'api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HubPage(),
      ),
    );
  }
}

List<Product> products = [
  Product(
      productId: "0",
      name: "Салат",
      price: 560,
      image: "https://cdn.loveandlemons.com/wp-content/uploads/2024/12/caesar-salad.jpg",
      reviewScore: 4.9
  ),
  Product(
      productId: "1",
      name: "Суп",
      price: 490,
      image: "https://cdn.loveandlemons.com/wp-content/uploads/2023/01/tomato-soup-recipe.jpg",
      reviewScore: 4.2
  ),
  Product(
      productId: "2",
      name: "Газировка",
      price: 180,
      image: "https://media.istockphoto.com/id/1393991948/ru/фото/кола-с-измельченным-льдом-в-стекле-и-каплями-воды-вокруг-холодный-черный-свежий-напиток.jpg?s=612x612&w=0&k=20&c=zw1iOSozCZ0-PW_mYtJWPDzBBWYUdk-YzeIOF10NDXo=",
      reviewScore: 5.0
  ),
  Product(
      productId: "3",
      name: "Курица",
      price: 670,
      image: "https://static01.nyt.com/images/2024/01/05/multimedia/MC-Peruvian-Roast-Chicken-ztlg/MC-Peruvian-Roast-Chicken-ztlg-mediumSquareAt3X.jpg",
      reviewScore: 4.6
  ),
  Product(
      productId: "4",
      name: "Жареный лосось с овощами",
      price: 890,
      image: "https://mealpractice.b-cdn.net/129286207963271168/grilled-salmon-with-roasted-vegetables-and-quinoa-MRYW9u3TAG.webp",
      reviewScore: 4.7
  ),
];

final apiService = MockApiService();

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            BigCard(
              picture: "https://interiordesign.net/wp-content/uploads/2024/04/InteriorDesign_March2024_Brave-New-World-11.jpg",
              onTap: () => print("card tapped"),
              mainText: "Забронируйте у нас столик",
              subText: "Мы будем рады видеть вас в нашем ресторане в любой удобный день",
            ),

            ProductCarousel(
              products: products,
              apiService: apiService,
              onTap: () => print("card tapped"),
            ),

            ElevatedButton(
              onPressed: () {
                CustomNotification.show(
                    context,
                    message: "Info",
                    type: NotificationType.info,
                    closeTime: 5,
                    showCloseButton: true,
                    onTap: () => print("tapped")
                );
              },
              child: Text('Уведомление информация'),
            ),
            ElevatedButton(
              onPressed: () {
                CustomNotification.show(
                    context,
                    message: "Success",
                    type: NotificationType.success,
                    closeTime: 5,
                    showCloseButton: true,
                    onTap: () => print("tapped")
                );
              },
              child: Text('Уведомление успех'),
            ),
            ElevatedButton(
              onPressed: () {
                CustomNotification.show(
                    context,
                    message: "Error",
                    type: NotificationType.error,
                    closeTime: 5,
                    showCloseButton: true,
                    onTap: () => print("tapped")
                );
              },
              child: Text('Уведомление ошибка'),
            ),
            ElevatedButton(
              onPressed: () {
                CustomNotification.show(
                    context,
                    message: "Warning",
                    type: NotificationType.warning,
                    closeTime: 5,
                    showCloseButton: true,
                    onTap: () => print("tapped")
                );
              },
              child: Text('Уведомление предупреждение'),
            )
          ],
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StatusTrack(
              activeTrackColor: Color(0xFF4B48AC),
              inactiveTrackColor: Colors.grey,
              apiService: apiService,
              orderId: "0",
            ),

            SizedBox(width: 50,),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => apiService.updateStatus("0", 0),
                    child: Text("Статус 0")
                ),
                ElevatedButton(
                    onPressed: () => apiService.updateStatus("0", 1),
                    child: Text("Статус 1")
                ),
                ElevatedButton(
                    onPressed: () => apiService.updateStatus("0", 2),
                    child: Text("Статус 2")
                ),
                ElevatedButton(
                    onPressed: () => apiService.updateStatus("0", 3),
                    child: Text("Статус 3")
                ),

              ],
            )
          ],
        )
      ),
    );
  }
}

class LikePage extends StatelessWidget {
  const LikePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CustomPopUp(
              picture: "https://media.istockphoto.com/id/1371934584/photo/portrait-of-a-confident-mature-businesswoman-working-in-a-modern-office.jpg?s=612x612&w=0&k=20&c=NF_IO6IEXY3HifRIhRqP0KDFJFdlFwaMwo3zfOOvKnQ=",
              mainText: "300 бонусов за регистрацию!",
              subText: "Вы можете потратить накопленные вами бонусы на приобретение любых товаров!",
              onClose: () => print("close"),
              confirmButton: Confirm(
                  color: Color(0xFF6E66FE),
                  text: "Подтвердить",
                  height: 55,
                  width: 400,
                  onTap: () => print("button pressed")
              )
          )
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class HubPage extends StatelessWidget {
  HubPage({super.key});

  final List<Widget> _pages = [
    MyHomePage(),
    SearchPage(),
    LikePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int> (
      builder: (context, currentIndex) {
        return Scaffold(
          body: _pages[currentIndex],
          bottomNavigationBar: CustomBottomBar(
            icons: const [
              Icons.home,
              Icons.search,
              Icons.favorite,
              Icons.person,
            ],
            selectedColor: Color(0xFF4B48AC),
            unselectedColor: Color(0xFFC8CDFF),
            splashColor: Color(0xFF6E66FE),
            onTap: (index) {
              context.read<NavigationCubit>().setPage(index);
            },
          ),
        );
      },
    );
  }
}