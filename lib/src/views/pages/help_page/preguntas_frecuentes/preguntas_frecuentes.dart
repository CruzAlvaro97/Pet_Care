import 'package:flutter/material.dart';
import 'package:pet_society/routes/routes.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:pet_society/src/views/widget/index_widgets.dart';

class PreguntasFrecuentes extends StatelessWidget {
  const PreguntasFrecuentes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainHome();
  }
}

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  List<String> items = ["Sobre nosotros", "Adopciones", "Apoyo", "Otros"];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// APPBAR
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CustomColor.white,
        title: Text(
          "Preguntas frecuentes",
          style: CustomTextStyle.titleSlider.copyWith(
            color: CustomColor.dark,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          color: CustomColor.dark,
          onPressed: () {
            Navigator.pop(context, const PreguntasFrecuentes());
          },
        ),
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              /// CUSTOM TABBAR
              SizedBox(
                width: double.infinity,
                height: 75,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              current = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            margin: const EdgeInsets.all(5),
                            width: 180,
                            height: 55,
                            decoration: BoxDecoration(
                              color: current == index
                                  ? CustomColor.secondary
                                  : CustomColor.white,
                              borderRadius: current == index
                                  ? BorderRadius.circular(20)
                                  : BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.04),
                                  offset: const Offset(0.0, 4.0),
                                  blurRadius: 20.0,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                items[index],
                                style: CustomTextStyle.text.copyWith(
                                  color: current == index
                                      ? CustomColor.primary
                                      : CustomColor.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              (current == 0)
                  ? const Seccion1Preguntas()
                  : (current == 1)
                      ? const Seccion2Preguntas()
                      : (current == 2)
                          ? const Seccion3Preguntas()
                          : const Seccion4Preguntas(),
            ],
          ),
        ),
      ),
    );
  }
}

class Seccion1Preguntas extends StatelessWidget {
  const Seccion1Preguntas({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> questions = [
      {
        'question': '¿Por qué se creó PetCare?',
        'answer':
            'Pet Care se creo con la finalidad de ayudar a los animales en estado vulnerable, brindandoles una segunda oportunidad y una familia. Promoviendo la adopción y lucha contra el abandono'
      },
      {
        'question': '¿A quiénes va dirigido PetCare?',
        'answer':
            'Para todas las personas que esten buscando un mejor amigo, que le puedan dar el amor y cuidado que necesita.'
      },
      {
        'question': '¿Cómo nos financiamos?',
        'answer': 'Nos financiamos gracias a una ONG que apoya nuestras ideas.'
      },
      {
        'question': '¿De dónde provienen los animales publicados en PetCare?',
        'answer':
            'Vienen de cualquier lado donde encontremos a un animal en una situacion de abandono.'
      },
      {
        'question': '¿Quiénes somos?',
        'answer':
            'Somos un grupo de desarrolladores, que llegamos a la conclusion de la fata de apoyo que se tiene para los animales en abandono.'
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (Map<String, String> question in questions)
              Column(
                children: [
                  QuestionItemWidget(
                    question: question['question'].toString(),
                    answer: question['answer'].toString(),
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class Seccion2Preguntas extends StatelessWidget {
  const Seccion2Preguntas({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(children: [
        /// ADOPCIONES
        Container(
          decoration: BoxDecoration(
              color: CustomColor.white,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Column(
            children: <Widget>[
              ExpansionTile(
                childrenPadding: const EdgeInsets.all(10),
                textColor: CustomColor.primary,
                iconColor: CustomColor.primary,
                title: Text(
                  '¿Cómo puedo adoptar una mascota?',
                  style: CustomTextStyle.text2,
                ),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Eliges a la que quieres que sea tu mascota, clicas en el botón de adoptar y ya puedes conversar con su protectora. Le responderá con la mayor brevedad posible. Debes ser  paciente y ten en cuenta que son voluntarios que dedican su tiempo libre a la protección animal.',
                      style: CustomTextStyle.questionText,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
              color: CustomColor.white,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Column(
            children: <Widget>[
              ExpansionTile(
                childrenPadding: const EdgeInsets.all(10),
                textColor: CustomColor.primary,
                iconColor: CustomColor.primary,
                title: Text(
                  '¿Hay algún filtro para poder adoptar?',
                  style: CustomTextStyle.text2,
                ),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Dependera exclusivamente de la Protectora que realiza la gestion, Te podra realizar unas preguntas para saber si eres apto, cada protector(a) tiene su política de adopción y condiciones diferentes.',
                      style: CustomTextStyle.questionText,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
              color: CustomColor.white,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Column(
            children: <Widget>[
              ExpansionTile(
                childrenPadding: const EdgeInsets.all(10),
                textColor: CustomColor.primary,
                iconColor: CustomColor.primary,
                title: Text(
                  'He realizado los pasos para la adopcion y no tengo respuesta',
                  style: CustomTextStyle.text2,
                ),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Si ha pasado mas de un dia, escríbenos e intentaremos averiguar que sucede, recuerda que son voluntarios, porfavor comunicate a consultas@petcare.org',
                      style: CustomTextStyle.questionText,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
              color: CustomColor.white,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Column(
            children: <Widget>[
              ExpansionTile(
                childrenPadding: const EdgeInsets.all(10),
                textColor: CustomColor.primary,
                iconColor: CustomColor.primary,
                title: Text(
                  '¿Cómo saber si una mascota sigue en adopción?',
                  style: CustomTextStyle.text2,
                ),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Todas las mascotas a adoptar se encuentran publicados en la app',
                      style: CustomTextStyle.questionText,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
              color: CustomColor.white,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Column(
            children: <Widget>[
              ExpansionTile(
                childrenPadding: const EdgeInsets.all(10),
                textColor: CustomColor.primary,
                iconColor: CustomColor.primary,
                title: Text(
                  'La mascota que queria adoptar ya no me aparece en la lista de adopción',
                  style: CustomTextStyle.text2,
                ),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Si ya no encuentras a la mascota que habias deseado, ya ha logrado ser adoptado',
                      style: CustomTextStyle.questionText,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class Seccion3Preguntas extends StatelessWidget {
  const Seccion3Preguntas({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          /// DONACIONES
          Container(
            decoration: BoxDecoration(
                color: CustomColor.white,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  childrenPadding: const EdgeInsets.all(10),
                  textColor: CustomColor.primary,
                  iconColor: CustomColor.primary,
                  title: Text(
                    '¿Cómo puedo ayudar?',
                    style: CustomTextStyle.text2,
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Nos ayudas compartiendo la app, para que todos esten informados de que tienen un lugar donde podemos conseguir un hogar a la mascota',
                        style: CustomTextStyle.questionText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                color: CustomColor.white,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  childrenPadding: const EdgeInsets.all(10),
                  textColor: CustomColor.primary,
                  iconColor: CustomColor.primary,
                  title: Text(
                    'Ya tengo mascotas, ¿puedo ayudar de otra manera?',
                    style: CustomTextStyle.text2,
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Con cuidarlas y considerar en esterilizarlas o castrar a su mascota ayudas a evitar animales no deseados',
                        style: CustomTextStyle.questionText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                color: CustomColor.white,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  childrenPadding: const EdgeInsets.all(10),
                  textColor: CustomColor.primary,
                  iconColor: CustomColor.primary,
                  title: Text(
                    '¿Puedo ayudar como voluntario?',
                    style: CustomTextStyle.text2,
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Si, por supuesto, comunicate a este correo voluntario@petcare.org',
                        style: CustomTextStyle.questionText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                color: CustomColor.white,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  childrenPadding: const EdgeInsets.all(10),
                  textColor: CustomColor.primary,
                  iconColor: CustomColor.primary,
                  title: Text(
                    '¿Puedo apoyar económicamente?',
                    style: CustomTextStyle.text2,
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Toda ayuda es bienvenida, tenemos transparencia en lo que se done, mantenemos un registro',
                        style: CustomTextStyle.questionText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class Seccion4Preguntas extends StatelessWidget {
  const Seccion4Preguntas({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          /// DONACIONES
          Container(
            decoration: BoxDecoration(
                color: CustomColor.white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.transparent)),
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  childrenPadding: const EdgeInsets.all(10),
                  textColor: CustomColor.primary,
                  iconColor: CustomColor.primary,
                  title: Text(
                    '¿Ahora qué sigue?',
                    style: CustomTextStyle.text2,
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Ahora ya sabes, si decides adoptar una mascota, nuestro aplicativo cuenta con voluntarios que quieren encontrarle un hogar a los animales refugiados y darle una mejor calidad de vida.',
                        style: CustomTextStyle.questionText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  childrenPadding: const EdgeInsets.all(10),
                  textColor: CustomColor.primary,
                  iconColor: CustomColor.primary,
                  title: Text(
                    '¿Alguna reflexión final?',
                    style: CustomTextStyle.text2,
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'My CarePet esta orgulloso de los logros que hemos obtenido con la ayuda de la comunidad y por supuesto de nuestros compañeros amantes de los animales que cada dia estan comprometidos en buscarle un hogas a los animales refugiados',
                        style: CustomTextStyle.questionText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
