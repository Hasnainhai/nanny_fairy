import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/rounded_button.dart';
import 'package:nanny_fairy/res/components/widgets/custom_text_field.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import '../../../res/components/colors.dart';
import '../../Repository/community_repo_family.dart';

class CommunityDetailViewFamily extends StatefulWidget {
  const CommunityDetailViewFamily({
    super.key,
    required this.img,
    required this.title,
    required this.subtitle,
    required this.postId,
    required this.userId,
  });

  final String img;
  final String title;
  final String subtitle;
  final String postId;
  final String userId;

  @override
  State<CommunityDetailViewFamily> createState() =>
      _CommunityDetailViewFamilyState();
}

class _CommunityDetailViewFamilyState extends State<CommunityDetailViewFamily> {
  final TextEditingController _commentController = TextEditingController();
  final CommunityRepoFamily _communityRepoFamily = CommunityRepoFamily();

  void _addComment() async {
    if (_commentController.text.isNotEmpty) {
      String comment = _commentController.text;

      try {
        await _communityRepoFamily.addComment(
            widget.postId, comment, widget.userId);
        _commentController.clear();
        setState(() {});
      } catch (e) {
        debugPrint('Error adding comment: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(
        '.......................Post Id: ${widget.postId}................');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          'Blogs',
          style: TextStyle(
            fontFamily: 'CenturyGothic',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColor.blackColor,
          ),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppColor.blackColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.img),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const VerticalSpeacing(20.0),
              Text(
                widget.title,
                style: const TextStyle(
                  fontFamily: 'CenturyGothic',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColor.blackColor,
                ),
              ),
              Text(
                widget.subtitle,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColor.grayColor,
                  ),
                ),
              ),
              const VerticalSpeacing(16),
              const Text(
                'Leave a comment',
                style: TextStyle(
                  fontFamily: 'CenturyGothic',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColor.blackColor,
                ),
              ),
              TextFieldCustom(
                maxLines: 1,
                hintText: 'Type comment',
                controller: _commentController,
              ),
              const VerticalSpeacing(16),
              RoundedButton(
                title: 'Post',
                onpress: _addComment,
              ),
              const VerticalSpeacing(16),
            ],
          ),
        ),
      ),
    );
  }
}
