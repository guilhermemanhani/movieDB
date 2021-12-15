import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moviedb/application/ui/theme_extensions.dart';
import 'package:moviedb/modules/detail/widgets/rounded_button_with_icon.dart';
import 'package:transparent_image/transparent_image.dart';
import './detail_controller.dart';

class DetailPage extends GetView<DetailController> {
  DetailPage({Key? key}) : super(key: key);
  final f = DateFormat('yyyy');
  final h = DateFormat('hh:mm');
  @override
  Widget build(BuildContext context) {
    final movie = controller.movie.value;
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () {
            return Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 48,
                      left: 4,
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: RoundedButtonWithIcon(
                        color: Colors.grey,
                        icon: Icons.arrow_back_ios,
                        title: 'Voltar',
                        onTap: () => Get.back(),
                        width: 80,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 56, left: 46, right: 46),
                    height: 260,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: movie?.backdropPath ??
                            'https://images.tcdn.com.br/img/img_prod/886766/tecido_fast_patch_termodinamico_24x35cm_cor_l209v_branco_696312354_1_20201127160703.jpg',
                        fit: BoxFit.fill,
                        width: Get.width,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: movie?.voteAverage.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: context.darkBlue)),
                        TextSpan(
                          text: '/10',
                          style:
                              TextStyle(fontSize: 10, color: context.lightGrey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(movie?.title ?? ''),
                  Text(
                    'Titulo original: ${movie?.originalTitle}',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        constraints: const BoxConstraints(
                          minWidth: 68,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: context.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Ano: ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: context.lightGrey),
                                ),
                                TextSpan(
                                  text: movie?.releaseDate != null
                                      ? f.format(movie!.releaseDate)
                                      : '',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: context.darkBlue),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Container(
                        constraints: const BoxConstraints(
                          minWidth: 68,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: context.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Duração: ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: context.lightGrey),
                                ),
                                TextSpan(
                                  text: movie?.runtime != null
                                      ? movie!.runtime.toString()
                                      : '',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: context.darkBlue),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    children: [
                      Container(
                        constraints: const BoxConstraints(
                          minWidth: 68,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: context.grey)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('a'),
                        ),
                      ),
                    ],
                  ),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Text('Descrição')),
                  Text(movie?.overview ?? ''),
                  Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: context.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'ORÇAMENTO: \$',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: context.lightGrey),
                            ),
                            TextSpan(
                              text: movie?.budget.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: context.darkBlue),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: context.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'PRODUTORAS: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: context.lightGrey),
                            ),
                            TextSpan(
                              text: movie?.runtime != null
                                  ? movie!.runtime.toString()
                                  : '',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: context.darkBlue),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
