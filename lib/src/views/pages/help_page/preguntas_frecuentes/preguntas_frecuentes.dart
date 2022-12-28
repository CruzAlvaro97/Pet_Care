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
    List<Map<String, String>> questions2 = [
      {
        'question': '¿Como puedo adoptar una mascota?',
        'answer':
            'Eliges a la que quieres que sea tu mascota, clicas en el botón de adoptar y ya puedes conversar con su protectora. Le responderá con la mayor brevedad posible. Debes ser  paciente y ten en cuenta que son voluntarios que dedican su tiempo libre a la protección animal.'
      },
      {
        'question': '¿Hay algún filtro para poder adoptar?',
        'answer':
            'Dependerá exclusivamente de la Protectora que realiza la gestion, Te podrá realizar unas preguntas para saber si eres apto, cada protector(a) tiene su política de adopción y condiciones diferentes..'
      },
      {
        'question':
            'He realizado los pasos para la adopción y no tengo respuesta',
        'answer':
            'Si ha pasado mas de un día, escríbenos e intentaremos averiguar que sucede, recuerda que son voluntarios, por favor comunicate a consultas@petcare.org.'
      },
      {
        'question':
            'La mascota que quería adoptar ya no me aparece en la lista de adopción',
        'answer':
            'Todas las mascotas a adoptar se encuentran publicados en la app.'
      },
      {
        'question': '¿Quiénes somos?',
        'answer':
            'Si ya no encuentras a la mascota que habias deseado, ya ha logrado ser adoptado.'
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (Map<String, String> question in questions2)
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

class Seccion3Preguntas extends StatelessWidget {
  const Seccion3Preguntas({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> questions3 = [
      {
        'question': '¿Como puedo ayudar?',
        'answer':
            'Nos ayudas compartiendo la app, para que todos esten informados de que tienen un lugar donde podemos conseguir un hogar a la mascota.'
      },
      {
        'question': '¿Ya tengo mascotas, ¿puedo ayudar de otra manera?',
        'answer':
            'Con cuidarlas y considerar en esterilizarlas o castrar a su mascota ayudas a evitar animales no deseados.'
      },
      {
        'question': '¿Puedo ayudar como voluntario?',
        'answer':
            'Si, por supuesto, comunicate a este correo voluntario@petcare.org.'
      },
      {
        'question': '¿Puedo apoyar económicamente?',
        'answer':
            'Toda ayuda es bienvenida, tenemos transparencia en lo que se done, mantenemos un registro.'
      },
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (Map<String, String> question in questions3)
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

class Seccion4Preguntas extends StatelessWidget {
  const Seccion4Preguntas({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> questions4 = [
      {
        'question': '¿Ya lei todo esto ¿Ahora que sigue?',
        'answer':
            'Ahora ya sabes, si decides adoptar una mascota, nuestro aplicativo cuenta con voluntarios que quieren encontrarle un hogar a los animales refugiados y darle una mejor calidad de vida.'
      },
      {
        'question': '¿Alguna reflexión final?',
        'answer':
            'My CarePet esta orgulloso de los logros que hemos obtenido con la ayuda de la comunidad y por supuesto de nuestros compañeros amantes de los animales que cada dia estan comprometidos en buscarle un hogar a los animales refugiados.'
      },
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (Map<String, String> question in questions4)
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
