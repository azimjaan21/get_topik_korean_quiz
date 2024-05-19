import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String title;
  final String imagePath;

  const CustomSliverAppBar({super.key, 
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.gettopikColor,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 19.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        background: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
