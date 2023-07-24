import 'package:eleven_ai/controllers/custom_getx_controller.dart';
import 'package:eleven_ai/core/firebase/store/image_picker.dart';
import 'package:eleven_ai/utils/color_constants.dart';
import 'package:eleven_ai/utils/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';

class CustomModalBottomSheet extends StatefulWidget {
  const CustomModalBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomModalBottomSheet> createState() => _CustomModalBottomSheetState();
}

class _CustomModalBottomSheetState extends State<CustomModalBottomSheet> {
  dynamic imageFile;
  CustomGetXController customGetXController = Get.find<CustomGetXController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            'Choose Profile Picture',
            style: head36(context, AppColors.primary),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                icon: const Icon(LineIcons.camera, color: AppColors.primary,),
                onPressed: () async {
                  imageFile = await PickImage().pickImage(context: context);
                  customGetXController.updateImageFile(imageFile);
                },
                label: const Text("Camera", style: TextStyle(color: AppColors.primary),),
              ),
              const Spacer(),
              TextButton.icon(
                icon: const Icon(LineIcons.image, color: AppColors.primary,),
                onPressed: () async {
                  imageFile = await PickImage().pickImage(
                    context: context,
                    source: ImageSource.gallery,
                  );
                  customGetXController.updateImageFile(imageFile);
                },
                label: const Text("Gallery", style: TextStyle(color: AppColors.primary),),
              ),
            ],
          )
        ],
      ),
    );
  }
}
