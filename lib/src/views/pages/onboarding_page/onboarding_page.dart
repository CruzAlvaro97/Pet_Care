import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_society/routes/routes.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController controller = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.white2,
      body: Column(
        children: [
          Flexible(
            child: PageView(
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              controller: controller,
              children: const <Widget>[
                OnboardingModal(
                    titulo: 'Ayudanos a ayudar',
                    descrip:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
                OnboardingModal(
                    titulo: 'Encuentra un compañero',
                    descrip:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
                OnboardingModal(
                    titulo: 'Lorem limpsun',
                    descrip:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
              ],
            ),
          ),
          SmoothPageIndicator(
            effect: WormEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: CustomColor.primary),
            controller: controller,
            count: 3,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: currentIndex != 2
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.end,
              children: [
                Visibility(
                  visible: currentIndex == 2 ? false : true,
                  child: TextButton(
                      onPressed: () {
                        controller.jumpToPage(2);
                      },
                      child: Text(
                        'Saltar',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: CustomColor.grey,
                            fontWeight: FontWeight.w700),
                      )),
                ),
                Visibility(
                  visible: currentIndex == 2 ? true : false,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, MyRoutes.rWELCOME);
                      },
                      child: Text(
                        'Empezar',
                        style: CustomTextStyle.text
                            .copyWith(color: CustomColor.primary),
                      )),
                ),
                Visibility(
                  visible: currentIndex == 2 ? false : true,
                  child: TextButton(
                      onPressed: () {
                        controller.nextPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut);
                      },
                      child: Text(
                        'Siguiente',
                        style: CustomTextStyle.text
                            .copyWith(color: CustomColor.primary),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingModal extends StatelessWidget {
  const OnboardingModal({
    Key? key,
    required this.titulo,
    required this.descrip,
  }) : super(key: key);

  final String titulo;
  final String descrip;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/fondoonboarding.jpeg',
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.6,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  titulo,
                  style: CustomTextStyle.headline,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  descrip,
                  style: CustomTextStyle.text.copyWith(color: CustomColor.grey),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
