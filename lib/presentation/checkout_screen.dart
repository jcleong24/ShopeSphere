import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_user_ecomm_app/core/routers/route_name.dart';
import 'package:flutter_user_ecomm_app/domain/bloc/cart/cart_event.dart';
import 'package:go_router/go_router.dart';

import '../domain/bloc/cart/cart_bloc.dart';
import '../domain/bloc/order/order_bloc.dart';
import '../domain/bloc/order/order_state.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderBloc, OrderState>(
      listener: (context, state) {
        if (state.status == OrderSubmitStatus.success) {
          context.read<CartBloc>().add(const CartClearedEvent());

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Order placed! Order ID: ${state.orderId}')),
          );

          // Navigate back to payment screen
          context.go(RouteNames.home);
        }

        if (state.status == OrderSubmitStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage ?? 'Order failed!')),
          );
        }
      },
    );
  }
}
