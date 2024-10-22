import 'package:diva/core/di/dependency_injection.dart';
import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/themes/colors.dart';
import 'package:diva/core/themes/text_styles.dart';
import 'package:diva/core/widgets/app_text_button.dart';
import 'package:diva/features/cart/data/models/cart_model.dart';
import 'package:diva/features/cart/logic/cart_cubit.dart';
import 'package:diva/features/cart/logic/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key, this.hasScaffold = false});

  final bool hasScaffold;

  @override
  Widget build(BuildContext context) {
    return hasScaffold
        ? Scaffold(
            appBar: AppBar(
              title: const Text('Cart'),
            ),
            body: const CartTabBody(),
          )
        : const CartTabBody();
  }
}

class CartTabBody extends StatelessWidget {
  const CartTabBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>(
      create: (context) => getIt<CartCubit>()..getCartData(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        child: BlocBuilder<CartCubit, CartState<CartModel>>(
          builder: (context, state) {
            return state.when(
              cartLoading: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
              cartSuccess: (cartModel) => Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: cartModel.cartProducts.length,
                      separatorBuilder: (context, index) => verticalSpace(10),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(
                              width: 2,
                              color: ColorsManager.mainDeepPink,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          height: 112,
                          child: Row(
                            children: [
                              Container(
                                height: 87,
                                width: 77,
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(11),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        cartModel.cartProducts[index].image ??
                                            ''),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              horizontalSpace(12),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        cartModel.cartProducts[index].title ??
                                            '',
                                        style: TextStyles.font16BlackW400,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        '${cartModel.cartProducts[index].price} '
                                        'L.E',
                                        style: TextStyles.font16BlackW600,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          QuantityManipulationButton(
                                            cartModel: cartModel,
                                            index: index,
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Text(
                                              'Edit',
                                              style: TextStyles
                                                  .font12BlackHalfOpacityW400
                                                  .copyWith(
                                                decorationStyle:
                                                    TextDecorationStyle.solid,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  verticalSpace(24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyles.font16BlackW600,
                      ),
                      const Spacer(),
                      Text(
                        '${cartModel.totalAmount} L.E',
                        style: TextStyles.font16BlackW400,
                      ),
                    ],
                  ),
                  verticalSpace(24),
                  AppTextButton(
                    buttonText: 'Place order',
                    textStyle: TextStyles.font20WhiteW600,
                    onPressed: () {},
                  ),
                ],
              ),
              cartError: Text.new,
            );
          },
        ),
      ),
    );
  }
}

class QuantityManipulationButton extends StatelessWidget {
  const QuantityManipulationButton({
    required this.cartModel,
    required this.index,
    super.key,
  });

  final CartModel cartModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: ColorsManager.mainDeepPink,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      child: Row(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                final cartSummarizedProduct =
                    cartModel.cartBasicData.products[index].copyWith(
                  quantity:
                      cartModel.cartBasicData.products[index].quantity - 1,
                );
                if (cartSummarizedProduct.quantity > 0) {
                  context.read<CartCubit>().updateCartData(
                        cartModel.cartBasicData.copyWith(
                          products: [
                            ...cartModel.cartBasicData.products
                              ..removeAt(index)
                              ..insert(index, cartSummarizedProduct),
                          ],
                        ),
                      );
                } else {
                  context.read<CartCubit>().updateCartData(
                        cartModel.cartBasicData.copyWith(
                          products: [
                            ...cartModel.cartBasicData.products
                              ..removeAt(index),
                          ],
                        ),
                      );
                }
              },
              child: const Icon(
                Icons.remove,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            cartModel.cartProducts[index].qty.toString(),
            style: TextStyles.font14WhiteW600,
          ),
          const SizedBox(width: 8),
          Center(
            child: GestureDetector(
              onTap: () {
                final cartSummarizedProduct =
                    cartModel.cartBasicData.products[index].copyWith(
                  quantity:
                      cartModel.cartBasicData.products[index].quantity + 1,
                );

                context.read<CartCubit>().updateCartData(
                      cartModel.cartBasicData.copyWith(
                        products: [
                          ...cartModel.cartBasicData.products
                            ..removeAt(index)
                            ..insert(index, cartSummarizedProduct),
                        ],
                      ),
                    );
              },
              child: const Icon(
                Icons.add,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
