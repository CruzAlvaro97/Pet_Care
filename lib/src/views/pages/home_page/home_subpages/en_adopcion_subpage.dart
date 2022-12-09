import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_society/src/models/pets_filter_model.dart';
import 'package:pet_society/src/utils/color/custom_color.dart';
import 'package:pet_society/src/utils/style/custom_text_style.dart';
import 'package:pet_society/src/views/widget/index_widgets.dart';

class EnAdopcionSubPage extends StatelessWidget {
  const EnAdopcionSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
        backgroundColor: CustomColor.white2,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Row(
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

            const SizedBox(height: 8),

            // Search form
            TextFormField(
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
            //

            // Filtro Animales
            // const _CarrouselPetsFilter(),
            //
          ],
        ),
      ),
    );
  }
}

// class _CarrouselPetsFilter extends StatelessWidget {
//   const _CarrouselPetsFilter({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 106,
//       child: ListView.builder(
//         itemCount: petsFilter.length,
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.only(left: 20.0, right: 10.0),
//         itemBuilder: (context, index) {
//           final PetsFilter = petsFilter[index];

//           return Container(
//             width: 80,
//             height: 106,
//             margin: const EdgeInsets.only(right: 10.0, bottom: 10.0),
//             decoration:
//                 containerDecoration().copyWith(color: CustomColor.white2),
//             child: Column(
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadius.all(Radius.circular(20)),
//                   child: MaterialButton(
//                     height: 80,
//                     minWidth: 80,
//                     color: CustomColor.secondary,
//                     disabledColor: CustomColor.white,
//                     onPressed: () {},
//                     child: SizedBox(
//                       width: 50,
//                       height: 50,
//                       child: Image(
//                         image: AssetImage(PetsFilter.iconPet),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     alignment: Alignment.center,
//                     child: Text(
//                       PetsFilter.typePet,
//                       style: CustomTextStyle.text,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
