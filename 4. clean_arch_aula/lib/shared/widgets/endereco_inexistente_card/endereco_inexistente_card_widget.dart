import 'package:clean_arch_aula/shared/utils/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class EnderecoInexistenteCardWidget extends StatelessWidget {
  const EnderecoInexistenteCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Não encontramos nenhum entedereço neste CEP, por favor busque outro.",
              style: AppTextStyles.listTileTitle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
