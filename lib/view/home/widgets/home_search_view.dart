import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/Repository/home_ui_repostory.dart';
import 'package:nanny_fairy/ViewModel/search_view_model.dart';
import 'package:nanny_fairy/res/components/colors.dart';
import 'package:nanny_fairy/res/components/widgets/ui_enums.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/view/booked/widgets/booking_widget.dart';
import 'package:nanny_fairy/view/job/family_detail_provider.dart';
import 'package:provider/provider.dart';

class HomeSearchView extends StatefulWidget {
  const HomeSearchView({super.key});

  @override
  State<HomeSearchView> createState() => _HomeSearchViewState();
}

class _HomeSearchViewState extends State<HomeSearchView> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch users when the widget initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SearchViewModel>(context, listen: false).fetchUsers();
    });

    // Add listener to search controller
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final viewModel = Provider.of<SearchViewModel>(context, listen: false);
    if (searchController.text.isNotEmpty) {
      viewModel.searchUsersByPassion(searchController.text);
      Provider.of<HomeUiSwithchRepository>(context, listen: false)
          .switchToType(UIType.SearchSection);
    } else {
      Provider.of<HomeUiSwithchRepository>(context, listen: false)
          .switchToType(UIType.DefaultSection);
    }
    // Notify listeners to rebuild UI with filtered results
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Jobs',
                style: GoogleFonts.getFont(
                  "Poppins",
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  searchController.clear();
                  _onSearchChanged();
                },
                child: Text(
                  'Clear Search',
                  style: GoogleFonts.getFont(
                    "Poppins",
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const VerticalSpeacing(16.0),
          Consumer<SearchViewModel>(
            builder: (context, viewModel, child) {
              return SizedBox(
                height: MediaQuery.of(context).size.height / 1.6,
                child: viewModel.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : viewModel.users.isEmpty
                        ? const Center(child: Text('No results found'))
                        : ListView.builder(
                            itemCount: viewModel.users.length,
                            itemBuilder: (context, index) {
                              final user = viewModel.users[index];
                              List<String> passions = user.passions;

                              return BookingCartWidget(
                                primaryButtonTxt: 'View',
                                ontapView: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (c) => FamilyDetailProvider(
                                        name:
                                            "${user.firstName} ${user.lastName}",
                                        bio: user.bio,
                                        profile: user.profile,
                                      ),
                                    ),
                                  );
                                },
                                name: "${user.firstName} ${user.lastName}",
                                profilePic:
                                    "https://firebasestorage.googleapis.com/v0/b/nanny-fairy.appspot.com/o/Id%2F1e3c98d0-53f7-11ef-8244-ff8013a36bbf%2B1?alt=media&token=890c9b2c-9389-4432-85fd-17a8743aa10a",
                                passion: passions,
                              );
                            },
                          ),
              );
            },
          ),
        ],
      ),
    );
  }
}
