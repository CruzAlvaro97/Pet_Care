import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  /// List of Tab Bar Item
  List<String> items = [
    "Sobre nosotros",
    "Adopciones",
  ];

  /// List of body icon
  List<IconData> icons = [
    Icons.dangerous_outlined,
    Icons.explore,
  ];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),

      /// APPBAR
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Text(
          "Preguntas frecuentes",
          style: GoogleFonts.laila(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            /// CUSTOM TABBAR
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
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
                            height: 45,
                            decoration: BoxDecoration(
                              color: current == index
                                  ? Colors.white70
                                  : Colors.white54,
                              borderRadius: current == index
                                  ? BorderRadius.circular(15)
                                  : BorderRadius.circular(10),
                              border: current == index
                                  ? Border.all(
                                      color: Colors.deepPurpleAccent, width: 2)
                                  : null,
                            ),
                            child: Center(
                              child: Text(
                                items[index],
                                style: GoogleFonts.laila(
                                    fontWeight: FontWeight.w500,
                                    color: current == index
                                        ? Colors.black
                                        : Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                            visible: current == index,
                            child: Container(
                              width: 5,
                              height: 5,
                              decoration: const BoxDecoration(),
                            ))
                      ],
                    );
                  }),
            ),

            /// MAIN BODY
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: <Widget>[
                  const ExpansionTile(
                    childrenPadding: EdgeInsets.all(10),
                    textColor: Color.fromARGB(248, 128, 62, 174),
                    title: Text(
                      '¿Porque se creo PetCare?',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                            'Pet Care se creo con la finalidad de ayudar a los animales en estado vulnerable, brindandoles una segunda oportunidad y una familia. Promoviendo la adopción y lucha contra el abandono',
                            style: TextStyle(color: Colors.black87)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: <Widget>[
                  const ExpansionTile(
                    childrenPadding: EdgeInsets.all(10),
                    textColor: Color.fromARGB(251, 192, 63, 190),
                    title: Text(
                      '¿A quienes va dirigido PetCare?',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                            'Para todas las personas que esten buscando un mejor amigo, que le puedan dar el amor y cuidado que necesita.',
                            style: TextStyle(color: Colors.black87)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: <Widget>[
                  const ExpansionTile(
                    childrenPadding: EdgeInsets.all(10),
                    textColor: Color.fromARGB(251, 192, 63, 190),
                    title: Text(
                      '¿Como nos financiamos?',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                            'Nos financiamos gracias a una ONG que apoya nuestras ideas.',
                            style: TextStyle(color: Colors.black87)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: <Widget>[
                  const ExpansionTile(
                    childrenPadding: EdgeInsets.all(10),
                    textColor: Color.fromARGB(251, 192, 63, 190),
                    title: Text(
                      '¿De donde provienen los animales publicados en PetCare?',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                            'Vienen de cualquier lado donde encontremos a un animal en una situacion de abandono',
                            style: TextStyle(color: Colors.black87)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: <Widget>[
                  const ExpansionTile(
                    childrenPadding: EdgeInsets.all(10),
                    textColor: Color.fromARGB(251, 192, 63, 190),
                    title: Text(
                      '¿Quienes somos?',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                            'Somos un grupo de desarrolladores, que llegamos a la conclusion de la fata de apoyo que se tiene para los animales en abandono',
                            style: TextStyle(color: Colors.black87)),
                      ),
                    ],
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
