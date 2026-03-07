import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_user_ecomm_app/core/theme/color_manager.dart';

import 'package:flutter_user_ecomm_app/core/theme/style_manager.dart';
import 'package:flutter_user_ecomm_app/core/theme/values_manager.dart';
import 'package:flutter_user_ecomm_app/domain/bloc/product/product_bloc.dart';
import 'package:go_router/go_router.dart';

import '../core/routers/route_name.dart';
import '../domain/bloc/product/product_event.dart';
import '../domain/bloc/product/product_state.dart';
import 'cart/widgets/cart_icon_button.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
        switch (state.status) {
          case ProductStatus.onLoading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ProductStatus.onLoaded:
            // return ListView.separated(
            //   itemCount: state.products.length,
            //   separatorBuilder: (_, __) => const Divider(height: 1),
            //   itemBuilder: (context, index) {
            //     final p = state.products[index];
            return Container(
                decoration: BoxDecoration(
                    color: ColorManager.backgroundColor.withOpacity(0.1)),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 83, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'Find our best products',
                              style: StyleManager.headingSemiMedium(),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 20, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Ink(
                                    // width: 60,
                                    decoration: const ShapeDecoration(
                                      color: ColorManager.border,
                                      shape: CircleBorder(),
                                    ),
                                    child: IconButton(
                                      icon: const Icon(
                                          Icons.shopping_bag_outlined),
                                      color: ColorManager.primary,
                                      onPressed: () {},
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Ink(
                                    // width: 60,
                                    decoration: const ShapeDecoration(
                                      color: ColorManager.border,
                                      shape: CircleBorder(),
                                    ),
                                    child: IconButton(
                                      icon: const Icon(
                                          Icons.notifications_outlined),
                                      color: ColorManager.primary,
                                      onPressed: () =>
                                          context.push(RouteNames.cart),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 24, 20, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20, 0, 0, 0),
                              child: Container(
                                width: double.infinity,
                                height: 56,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: ColorManager.surface,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16, 0, 0, 0),
                                      child: IconButton(
                                        icon: const Icon(Icons.search),
                                        color: ColorManager.primary,
                                        onPressed: () =>
                                            context.push(RouteNames.cart),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16, 0, 0, 0),
                                      child: Text(
                                        'Search',
                                        style: StyleManager.button(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          final p = state.products[index];
                          return ListTile(
                            title: Text(p.name),
                            subtitle: Text('RM ${p.price.toStringAsFixed(2)}'),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () {
                              context
                                  .push('${RouteNames.productDetails}/${p.id}');
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ));

          // ListTile(
          //   title: Text(p.name),
          //   subtitle: Text('RM ${p.price.toStringAsFixed(2)}'),
          //   trailing: const Icon(Icons.chevron_right),
          //   onTap: () {
          //     context.push('${RouteNames.productDetails}/${p.id}');
          //   },
          // );

          case ProductStatus.error:
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.errorMessage ?? 'Something went wrong'),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () => context
                        .read<ProductBloc>()
                        .add(const ProductRequested()),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          case ProductStatus.initial:
          default:
            return const SizedBox.shrink();
        }
      }),
    );
  }
}
