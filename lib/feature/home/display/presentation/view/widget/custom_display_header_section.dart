import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_list_app/core/utils/styles.dart';
import 'package:to_do_list_app/core/widgets/custom_elevated_button.dart';
import 'package:to_do_list_app/feature/home/display/presentation/view/widget/ts_clip_path.dart';

class CustomDisplayHeaderSection extends StatefulWidget {
  const CustomDisplayHeaderSection({super.key});

  @override
  State<CustomDisplayHeaderSection> createState() =>
      _CustomDisplayHeaderSectionState();
}

class _CustomDisplayHeaderSectionState
    extends State<CustomDisplayHeaderSection> {
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TsClip2(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        height: MediaQuery.sizeOf(context).height * .32,
        width: double.infinity,
        color: const Color.fromRGBO(88, 122, 110, .90),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 28,
                ),
              ),
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              backgroundImage:
                  image != null ? FileImage(File(image!.path)) : null,
              child:
                  image == null
                      ? const Icon(Icons.person, size: 50, color: Colors.grey)
                      : null,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomElevatedButton(
                  text: 'Choose Your Image',
                  onPressed: () async {
                    await pickImage();
                  },

                  padding: const EdgeInsets.symmetric(horizontal: 10),
                ),
                const SizedBox(width: 20),
                CustomElevatedButton(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  text: 'Delete Image',
                  onPressed: removeImage,
                ),
              ],
            ),

            const SizedBox(height: 16),
            Text(
              'Welcome ${FirebaseAuth.instance.currentUser!.displayName ?? ''}',
              style: Styles.textMedium20,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  void removeImage() {
    setState(() {
      image = null;
    });
  }
}
