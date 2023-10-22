import 'package:flutter/material.dart';
import 'package:medical_app/app_consts/app_color.dart';
import 'package:medical_app/view/auth/login_screen.dart';
import 'package:medical_app/view/inner_screens/favorite_doctors.dart';
import 'package:medical_app/view/inner_screens/reservation_screen.dart';
import 'package:medical_app/view/inner_screens/viewed_recently.dart';
import 'package:medical_app/view_model/theme_provider.dart';
import 'package:medical_app/widgets/title_text_widget.dart';
import 'package:provider/provider.dart';

import '../../app_consts/assets_manager.dart';
import '../../widgets/subtitle_widget.dart';
import 'custom_profile_list.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static String id = ' profile-screen';
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightPrimary,
        title: const TitleTextWidget(title: 'Profile',fontSize: 25,color:Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Visibility(
            visible: false,
            child: TitleTextWidget(
              title: 'Login to have unlimited access',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Theme.of(context).colorScheme.background,
                          width: 3),
                      image: const DecorationImage(
                          image: NetworkImage('https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                          fit: BoxFit.fill)),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleTextWidget(title:'Hi user'),
                    SubtitleTextWidget(subTitle:'example@email.com' )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleTextWidget(
                  title: 'Generals',
                  fontSize: 22,
                ),
                Visibility(
                  visible:  true,
                  child: CustomProfileList(
                      imagePath: AssetsManager.order2,
                      title: 'Reservation',
                      fun: () async {
                        await Navigator.pushNamed(context, ReservationScreen.id);
                      }),
                ),
                Visibility(
                  visible: true,
                  child: CustomProfileList(
                      imagePath: AssetsManager.wishList,
                      title: 'Favorite Doctors',
                      fun: () async {
                        await Navigator.pushNamed(context, FavoriteDoctor.id);
                      }),
                ),
                CustomProfileList(
                    imagePath: AssetsManager.recent,
                    title: 'Recently viewed',
                    fun: () async {
                      await Navigator.pushNamed(context, ViewedRecently.id);
                    }),
                CustomProfileList(
                    imagePath: AssetsManager.address,
                    title: 'Address',
                    fun: () {}),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleTextWidget(
                  title: 'Settings',
                  fontSize: 22,
                ),
                SwitchListTile(
                    title: SubtitleTextWidget(
                        subTitle: themeProvider.getDarkTheme
                            ? 'dark theme'
                            : 'light theme'),
                    secondary: Icon(
                      themeProvider.getDarkTheme
                          ? Icons.dark_mode_outlined
                          : Icons.light_mode_outlined,
                      size: 30,
                    ),
                    value: themeProvider.getDarkTheme,
                    onChanged: (value) {
                      themeProvider.setDarkTheme(value);
                    }),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () async {
                  Navigator.pushReplacementNamed(context, LoginScreen.id);
                },
                icon: const Icon(Icons.logout),
                label:
                const TitleTextWidget(title:'Log out')),
          )
        ],
      ),
    );
  }
}