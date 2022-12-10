import 'package:flutter/material.dart';
import 'package:pet_society/providers/switch_provider.dart';
import 'package:pet_society/src/models/pets_adoption_model.dart';
import 'package:pet_society/src/models/pets_help_model.dart';
import 'package:pet_society/src/utils/color/custom_color.dart';
import 'package:pet_society/src/utils/style/custom_text_style.dart';
import 'package:pet_society/src/views/widget/index_widgets.dart';
import 'package:provider/provider.dart';

class AyudaSubPage extends StatelessWidget {
  const AyudaSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cambio = Provider.of<CambioProviderHelp>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
        backgroundColor: CustomColor.white2,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 23),

          // Encabezado
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tu apoyo es fundamental',
                      style: CustomTextStyle.headline,
                    ),
                    Text(
                      'ayúdanos a ayudar ❤️',
                      style: CustomTextStyle.headline.copyWith(
                        color: CustomColor.primary,
                        height: 1,
                      ),
                    ),
                    //
                  ],
                ),
              ],
            ),
          ),
          //

          const SizedBox(height: 23),

          // Botones
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                // Botón: Me perdí
                Expanded(
                  flex: 1,
                  child: CustomButtonWidget(
                    text: 'Me perdí',
                    textStyle: CustomTextStyle.text.copyWith(
                        color: (cambio.status == 'Perdido')
                            ? CustomColor.white
                            : CustomColor.grey),
                    colorButton: (cambio.status == 'Perdido')
                        ? CustomColor.secondary
                        : CustomColor.white,
                    onPressed: () {
                      cambio.filtroAyuda('Perdido');
                    },
                  ),
                ),
                //

                const SizedBox(width: 13),

                // Botón: Necesito apoyo
                Expanded(
                  flex: 1,
                  child: CustomButtonWidget(
                    text: 'Necesito apoyo',
                    textStyle: CustomTextStyle.text.copyWith(
                        color: (cambio.status == 'Apoyo')
                            ? CustomColor.white
                            : CustomColor.grey),
                    colorButton: (cambio.status == 'Apoyo')
                        ? CustomColor.secondary
                        : CustomColor.white,
                    onPressed: () {
                      cambio.filtroAyuda('Apoyo');
                    },
                  ),
                ),
                //
              ],
            ),
          ),
          //

          const SizedBox(height: 25),

          // Texto: resultados
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Resultados encontrados ${cambio.resultado}",
                  style: CustomTextStyle.helperText2
                      .copyWith(color: CustomColor.grey),
                ),
              ],
            ),
          ),
          //

          const SizedBox(height: 2.5),

          // Resultados de filtros
          const _CarrouselResultsHelp(),
          //
        ],
      ),
    );
  }
}

// Carrusel de resultado de filtro de mascotas
class _CarrouselResultsHelp extends StatelessWidget {
  const _CarrouselResultsHelp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cambio = Provider.of<CambioProviderHelp>(context);
    List<PetsHelp> petsHelp2 = petsHelp;

    List<dynamic> filtradosH = [];
    for (int i = 0; i < (petsHelp.length); i++) {
      if (petsHelp[i].statusfilterPet == cambio.status) {
        filtradosH.add(i);
      } else {}
    }

    // {
    // cambio.totalAdopcion(filtrados.length);
    // }

    return Expanded(
      child: Container(
        color: CustomColor.white2,
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: filtradosH.length,
          padding: const EdgeInsets.all(13.5),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            final dataPets = petsHelp2[filtradosH[index]];

            return Container(
              margin: const EdgeInsets.only(right: 6.5, left: 6.5, bottom: 13),
              decoration:
                  containerDecoration().copyWith(color: CustomColor.white),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: SizedBox(
                        width: double.infinity,
                        child: Image(
                          image: NetworkImage(dataPets.photoPet),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Descripción
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 11),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Nombre de mascota
                                Text(
                                  dataPets.namePet,
                                  style: CustomTextStyle.text.copyWith(
                                    color: CustomColor.primary,
                                  ),
                                ),
                                //

                                // Genero
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5)),
                                    color: (dataPets.genderPet == 'Macho'
                                        ? CustomColor.male
                                        : CustomColor.female),
                                  ),
                                  width: 18,
                                  height: 18,
                                  child: Icon(
                                    dataPets.genderPet == 'Macho'
                                        ? Icons.male
                                        : Icons.female,
                                    size: 15,
                                    color: CustomColor.white,
                                  ),
                                ),
                                //
                              ],
                            ),
                            Text(
                              dataPets.typePet,
                              style: CustomTextStyle.helperText,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
//