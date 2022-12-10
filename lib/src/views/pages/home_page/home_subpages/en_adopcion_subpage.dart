import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_society/providers/switch_provider.dart';
import 'package:pet_society/src/models/pets_adoption_model.dart';
import 'package:pet_society/src/models/pets_filter_model.dart';
import 'package:pet_society/src/utils/color/custom_color.dart';
import 'package:pet_society/src/utils/style/custom_text_style.dart';
import 'package:pet_society/src/views/widget/index_widgets.dart';
import 'package:provider/provider.dart';

class EnAdopcionSubPage extends StatelessWidget {
  const EnAdopcionSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cambio = Provider.of<CambioProviderAdopcion>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
        backgroundColor: CustomColor.white2,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Parte superior izquierda
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Encabezado
                    Text(
                      'Encuentra a tu',
                      style: CustomTextStyle.headline,
                    ),
                    Text(
                      'compañer@',
                      style: CustomTextStyle.headline.copyWith(
                        color: CustomColor.primary,
                        height: 1,
                      ),
                    ),
                    //

                    const SizedBox(height: 5),

                    Row(
                      children: [
                        // Ubicación - ícono
                        const SizedBox(
                          width: 11,
                          height: 13,
                          child: Image(
                            image: AssetImage(
                                'assets/icons/ubicacionIcon_enAdopcion.png'),
                          ),
                        ),
                        //

                        const SizedBox(width: 4),

                        // Ubicación - texto
                        Text(
                          'Ubicación, Perú',
                          style: CustomTextStyle.helperText.copyWith(
                            color: CustomColor.grey,
                          ),
                        ),
                        //
                      ],
                    ),
                  ],
                ),
                //

                // Parte superior derecha - gif
                Container(
                  height: 121,
                  width: 121,
                  color: CustomColor.white2,
                  child: Lottie.asset(
                      'assets/images/enAdopcion2.json'), //doble de velocidad de movimiento
                ),
                //
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Search form
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              style: CustomTextStyle.text,
              autocorrect: true,
              keyboardType: TextInputType.text,
              decoration: formDecorationWidget(
                hintText: 'Buscar',
                hintStyle: CustomTextStyle.helperText
                    .copyWith(color: CustomColor.grey),
                prefixIcon: Icon(
                  Icons.search_rounded,
                  size: 20,
                  color: CustomColor.grey,
                ),
              ).copyWith(fillColor: CustomColor.white),
            ),
          ),
          //

          const SizedBox(height: 25),

          // Filtro Animales
          const _CarrouselPetsFilter(),
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
          const _CarrouselResultsAdoption(),
          //
        ],
      ),
    );
  }
}

// Carrussel de Filtro de Mascotas
class _CarrouselPetsFilter extends StatelessWidget {
  const _CarrouselPetsFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cambio = Provider.of<CambioProviderAdopcion>(context);
    return Container(
      height: 106,
      color: CustomColor.white2,
      child: ListView.builder(
        itemCount: petsFilter.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20.0, right: 10.0),
        itemBuilder: (context, index) {
          final dataPets = petsFilter[index];

          return Container(
            width: 80,
            height: 106,
            margin: const EdgeInsets.only(right: 10.0, bottom: 10.0),
            decoration:
                containerDecoration().copyWith(color: CustomColor.white2),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: MaterialButton(
                    height: 80,
                    minWidth: 80,
                    color: (cambio.especie == dataPets.typePet)
                        ? CustomColor.secondary
                        : CustomColor.white,
                    onPressed: () {
                      cambio.filtroAdopcion(dataPets.typePet);
                    },
                    child: SizedBox(
                      width: 38,
                      height: 38,
                      child: Image(
                        image: (cambio.especie == dataPets.typePet)
                            ? AssetImage(dataPets.selectedIconPet)
                            : AssetImage(dataPets.iconPet),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      dataPets.typePet,
                      style: CustomTextStyle.text,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
//

// Carrusel de resultado de filtro de mascotas
class _CarrouselResultsAdoption extends StatelessWidget {
  const _CarrouselResultsAdoption({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cambio = Provider.of<CambioProviderAdopcion>(context);
    List<PetsAdoption> petsAdoption2 = petsAdoption;

    List<dynamic> filtrados = [];
    for (int i = 0; i < (petsAdoption.length); i++) {
      if (petsAdoption[i].typefilterPet == cambio.especie ||
          cambio.especie == 'Todos') {
        filtrados.add(i);
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
          itemCount: filtrados.length,
          padding: const EdgeInsets.all(13.5),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            final dataPets = petsAdoption2[filtrados[index]];

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