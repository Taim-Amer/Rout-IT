import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/router/app_router.dart';
import 'package:route_it27/core/utils/styles/app_styles.dart';
import 'package:route_it27/core/widgets/custom_back_button2.dart';
import 'package:route_it27/features/search/presentation/view_models/general_search_cubit/general_search_cubit.dart';
import 'package:route_it27/features/search/data/models/general_search_model.dart';
import 'package:route_it27/features/user/presentation/view_model/toggle_follow_company_cubit/toggle_follow_company_cubit.dart';
import 'package:route_it27/features/user/presentation/view_model/toggle_follow_company_cubit/toggle_follow_company_state.dart';
import 'package:route_it27/features/user/presentation/view_model/toggle_follow_expert_cubit/toggle_follow_expert_cubit.dart';
import 'package:route_it27/features/user/presentation/view_model/toggle_follow_expert_cubit/toggle_follow_expert_state.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton2(),
          title: const Text('Search Results', style: MyTextStyles.titleStyle),
          bottom: const TabBar(
            indicatorColor: AppColors.whiteColor,
            tabs: [
              Tab(text: 'Students'),
              Tab(text: 'Experts'),
              Tab(text: 'Companies'),
            ],
          ),
        ),
        body: BlocBuilder<GeneralSearchCubit, GeneralSearchState>(
          builder: (context, state) {
            if (state is GeneralSearchLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GeneralSearchLoaded) {
              return TabBarView(
                children: [
                  _buildStudentList(
                      state.generalSearchModel.result!.students!, context),
                  _buildExpertList(
                      state.generalSearchModel.result!.experts!, context),
                  _buildCompanyList(
                      state.generalSearchModel.result!.companies!, context),
                ],
              );
            } else if (state is GeneralSearchFailure) {
              return Center(child: Text(state.errMessage));
            } else {
              return const Center(child: Text("No data found."));
            }
          },
        ),
      ),
    );
  }

  Widget _buildStudentList(List<Students> students, BuildContext context) {
    if (students.isEmpty) {
      return _buildNoResultsCard();
    }
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        final student = students[index];
        return _buildStudentCard(student, context);
      },
    );
  }

  Widget _buildExpertList(List<Experts> experts, BuildContext context) {
    if (experts.isEmpty) {
      return _buildNoResultsCard();
    }
    return ListView.builder(
      itemCount: experts.length,
      itemBuilder: (context, index) {
        final expert = experts[index];
        return _buildExpertCard(expert, context);
      },
    );
  }

  Widget _buildCompanyList(List<Companies> companies, BuildContext context) {
    if (companies.isEmpty) {
      return _buildNoResultsCard();
    }
    return ListView.builder(
      itemCount: companies.length,
      itemBuilder: (context, index) {
        final company = companies[index];
        return _buildCompanyCard(company, context);
      },
    );
  }

  Widget _buildNoResultsCard() {
    return Center(
      child: Card(
        elevation: 0,
        color: AppColors.darkPrimaryColor,
        margin: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.search_off,
                color: AppColors.secondaryColor,
                size: 48,
              ),
              SizedBox(height: 10),
              Text(
                "No results found",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Try searching with different keywords.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStudentCard(Students student, BuildContext context) {
  return Card(
    elevation: 0,
    color: AppColors.darkPrimaryColor,
    margin: const EdgeInsets.all(10),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              if (student.id != null) {
                GoRouter.of(context).push(AppRouter.kStudentProfile, extra: student.id!);
              }
            },
            child: CircleAvatar(
              radius: 30,
              backgroundImage: student.image != null 
                  ? NetworkImage(imageUrl + student.image!)
                  : null,
              child: student.image == null ? Icon(Icons.person) : null,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  student.name ?? "No Name",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  student.university ?? "No University",
                  style: const TextStyle(),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: student.id != null ? () {
              // Action to see profile, ensure the student ID is not null
            } : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            ),
            child: const Text('See Profile'),
          ),
        ],
      ),
    ),
  );
}

  Widget _buildExpertCard(Experts expert, BuildContext context) {
    return BlocBuilder<ToggleFollowExpertCubit, ToggleFollowExpertState>(
      builder: (context, state) {
        final isFollowing =
            context.read<ToggleFollowExpertCubit>().isFollowing(expert.id!);
        final buttonText = isFollowing ? 'Followed' : 'Follow';

        return Card(
          elevation: 0,
          color: AppColors.darkPrimaryColor,
          margin: const EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context)
                        .push(AppRouter.kExpertProfile, extra: expert.id);
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(imageUrl+expert.image!),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        expert.name!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        expert.email!,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<ToggleFollowExpertCubit>()
                        .toggleFollowExpert(id: expert.id!);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isFollowing ? Colors.green : AppColors.secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  ),
                  child: Text(buttonText),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCompanyCard(Companies company, BuildContext context) {
    return BlocBuilder<ToggleFollowCompanyCubit, ToggleFollowCompanyState>(
      builder: (context, state) {
        final isFollowing =
            context.read<ToggleFollowCompanyCubit>().isFollowing(company.id!);
        final buttonText = isFollowing ? 'Followed' : 'Follow';

        return Card(
          elevation: 0,
          color: AppColors.darkPrimaryColor,
          margin: const EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context)
                        .push(AppRouter.kCompanyProfile, extra: company.id);
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(imageUrl+company.image!),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        company.name!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        company.location!,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<ToggleFollowCompanyCubit>()
                        .toggleFollowCompany(id: company.id!);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isFollowing ? Colors.green : AppColors.secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  ),
                  child: Text(buttonText),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
