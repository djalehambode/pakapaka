import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/home_view_model.dart';
import '../../../core/services/api_service.dart';
import 'home_page_components/home_app_bar.dart';
import 'home_page_components/product_grid.dart';
import 'home_page_components/home_header.dart';

class HomePage extends StatelessWidget {
  final ApiService api;
  const HomePage({super.key, required this.api});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(api: api),
      child: Scaffold(
        body: Consumer<HomeViewModel>(
          builder: (context, vm, child) {
            if (vm.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (vm.error != null) {
              return Center(child: Text(vm.error!));
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeAppBar(),
                const HomeHeader(),
                Expanded(child: ProductGrid(products: vm.products)),
              ],
            );
          },
        ),
      ),
    );
  }
}
