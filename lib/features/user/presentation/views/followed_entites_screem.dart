import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_it27/features/user/presentation/view_model/followed_companies_cubit/followd_companies_cubit.dart';
import 'package:route_it27/features/user/presentation/view_model/followed_experts_cubit/followed_experts_cubit.dart';
import 'package:route_it27/features/user/presentation/view_model/followed_technologies_cubit/followed_technologies_cubit.dart';

class FollowedEntitiesScreen extends StatelessWidget {
  final int initialIndex;

  const FollowedEntitiesScreen({Key? key, required this.initialIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: initialIndex,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Followed Entities'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Technologies'),
              Tab(text: 'Companies'),
              Tab(text: 'Experts'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildFollowedTechnologiesTab(context),
            _buildFollowedCompaniesTab(context),
            _buildFollowedExpertsTab(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFollowedTechnologiesTab(BuildContext context) {
    return BlocBuilder<FollowedTechnologiesCubit, FollowedTechnologiesState>(
      builder: (context, state) {
        if (state is FollowedTechnologiesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FollowedTechnologiesSuccess) {
          return ListView.builder(
            itemCount: state.info.followedTechnologies?.length ?? 0,
            itemBuilder: (context, index) {
              var technology = state.info.followedTechnologies![index];
              return _buildCard(technology.name!, technology.image!);
            },
          );
        } else {
          return const Center(child: Text('Failed to load followed technologies'));
        }
      },
    );
  }

  Widget _buildFollowedCompaniesTab(BuildContext context) {
    return BlocBuilder<FollowedCompaniesCubit, FollowedCompaniesState>(
      builder: (context, state) {
        if (state is FollowedCompaniesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FollowedCompaniesSuccess) {
          return ListView.builder(
            itemCount: state.followedCompaniesModel.followedCompanies?.length ?? 0,
            itemBuilder: (context, index) {
              var company = state.followedCompaniesModel.followedCompanies![index];
              return _buildCard(company.name!, company.image!);
            },
          );
        } else {
          return const Center(child: Text('Failed to load followed companies'));
        }
      },
    );
  }

  Widget _buildFollowedExpertsTab(BuildContext context) {
    return BlocBuilder<FollowedExpertsCubit, FollowedExpertsState>(
      builder: (context, state) {
        if (state is FollowedExpertsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FollowedExpertsSuccess) {
          return ListView.builder(
            itemCount: state.info.followedExperts?.length ?? 0,
            itemBuilder: (context, index) {
              var expert = state.info.followedExperts![index];
              return _buildCard(expert.name!, expert.image!);
            },
          );
        } else {
          return const Center(child: Text('Failed to load followed experts'));
        }
      },
    );
  }

  Widget _buildCard(String title, String imageUrl) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl+imageUrl),
        ),
        title: Text(title),
      ),
    );
  }
}
