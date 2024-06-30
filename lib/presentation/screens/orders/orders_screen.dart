import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ultimate_solutions_task/config/theme/color_manager.dart';
import 'package:ultimate_solutions_task/core/base/widget/base_stateful_widget.dart';
import 'package:ultimate_solutions_task/core/resources/image_manager.dart';
import 'package:ultimate_solutions_task/core/utils/dialogs/show_language_dialog.dart';
import 'package:ultimate_solutions_task/core/utils/show_snack_bar.dart';
import 'package:ultimate_solutions_task/di/injector.dart';
import 'package:ultimate_solutions_task/domain/entities/login/user.dart';
import 'package:ultimate_solutions_task/domain/entities/orders/order.dart';
import 'package:ultimate_solutions_task/domain/entities/orders/status_type.dart';
import 'package:ultimate_solutions_task/domain/usecases/get_language_use_case.dart';
import 'package:ultimate_solutions_task/generated/l10n.dart';
import 'package:ultimate_solutions_task/presentation/blocs/orders/orders_bloc.dart';
import 'package:ultimate_solutions_task/presentation/screens/orders/widgets/orders_widget.dart';
import 'package:ultimate_solutions_task/presentation/widgets/restart_widget.dart';

class OrdersScreen extends BaseStatefulWidget {
  const OrdersScreen({super.key});

  @override
  BaseState<OrdersScreen> baseCreateState() => _OrdersScreenState();
}

class _OrdersScreenState extends BaseState<OrdersScreen> {
  OrdersBloc get _bloc => BlocProvider.of<OrdersBloc>(context);

  User _user = User();
  List<StatusType> _statusTypes = [];
  List<Order> _orders = [];
  List<Order> _filterdOrders = [];
  String _orderType = "new";

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _init();
  }

  void _init() {
    _bloc.add(GetUserInfoEvent());
    _bloc.add(GetStatusTypesEvent());
    _bloc.add(GetOrdersEvent());
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<OrdersBloc, OrdersState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetUserInfoState) {
          _user = state.user;
        } else if (state is GetStatusTypesSuccessState) {
          _statusTypes = state.statusTypes;
        } else if (state is GetStatusTypesErrorState) {
          showSnackBar(
              context: context,
              message: state.message,
              color: ColorManager.snackBarError,
              icon: ImageManager.error
          );
        } else if (state is GetOrdersSuccessState) {
          _orders = state.orders;
          _filterdOrders = getOrdersBasedOnType(_orderType);
        } else if (state is GetOrdersErrorState) {
          showSnackBar(
              context: context,
              message: state.message,
              color: ColorManager.snackBarError,
              icon: ImageManager.error
          );
        } else if (state is ChangeOrderTypeState) {
          _orderType = state.orderType;
          _filterdOrders = getOrdersBasedOnType(_orderType);
        } else if (state is ChangeLanguageState) {
          _restartApp();
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  height: 160,
                  color: ColorManager.red,
                  child: Stack(
                    fit: StackFit.expand,
                    alignment: AlignmentDirectional.centerStart,
                    children: [
                      Positioned.directional(
                        textDirection: Directionality.of(context),
                        end: 0,
                        top: 0,
                        child: SvgPicture.asset(
                          matchTextDirection: true,
                          ImageManager.ordersCurve,
                          height: 160,
                        ),
                      ),
                      Positioned.directional(
                        textDirection: Directionality.of(context),
                        end: 24,
                        top: 64,
                        child: InkWell(
                          onTap: () {
                            String language = GetLanguageUseCase(injector())();

                            showLanguageDialog(
                              context: context,
                              languageCode: language,
                              onLanguageSelected: (String languageCode) {
                                if(language == languageCode) return;
                                _bloc.add(ChangeLanguageEvent(
                                    languageCode: languageCode));
                              },
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: ColorManager.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x00000029),
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: SvgPicture.asset(
                              matchTextDirection: true,
                              ImageManager.language,
                              colorFilter: const ColorFilter.mode(
                                ColorManager.primary,
                                BlendMode.srcIn,
                              ),
                              width: 18,
                              height: 18,
                            ),
                          ),
                        ),
                      ),
                      Positioned.directional(
                        textDirection: Directionality.of(context),
                        end: 48,
                        bottom: 0,
                        child: Image.asset(
                          matchTextDirection: true,
                          ImageManager.deliveryMan,
                          height: 140,
                        ),
                      ),
                      Positioned.directional(
                        textDirection: Directionality.of(context),
                        start: 16,
                        child: Text(
                          formatStringToLines(_user.name),
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 32,
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    _buildStoreButton(
                      text: S.of(context).neww,
                      buttonSelected: _orderType == "new",
                      onTap: () {
                        _bloc.add(ChangeOrderTypeEvent(orderType: "new"));
                      },
                    ),
                    _buildStoreButton(
                      text: S.of(context).others,
                      buttonSelected: _orderType == "others",
                      onTap: () {
                        _bloc.add(ChangeOrderTypeEvent(orderType: "others"));
                      },
                    ),
                    const Expanded(child: SizedBox()),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              OrdersWidget(
                orders: _filterdOrders,
                statusTypes: _statusTypes,
                orderType: _orderType,
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 24,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Order> getOrdersBasedOnType(String orderType) {
    if (orderType == "new") {
      return _orders.where((e) => e.deliveryStatusFlag == "0").toList();
    } else {
      return _orders.where((e) => e.deliveryStatusFlag != "0").toList();
    }
  }

  String formatStringToLines(String input) {
    List<String> words = input.split(' ');

    if (words.length <= 1) {
      // If there's only one word or none, return the original input
      return input;
    }

    List<String> lines = [];
    int wordsPerLine = 2; // Adjust this based on your requirement

    for (int i = 0; i < words.length; i += wordsPerLine) {
      int end = (i + wordsPerLine < words.length) ? i + wordsPerLine : words.length;
      lines.add(words.sublist(i, end).join(' '));
    }

    return lines.join('\n');
  }

  void _restartApp() {
    RestartWidget.restartApp(context);
  }

  Widget _buildStoreButton({
    required String text,
    required bool buttonSelected,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 40,
        ),
        decoration: BoxDecoration(
          color: buttonSelected ? ColorManager.primary : ColorManager.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: ColorManager.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: buttonSelected ? ColorManager.white : ColorManager.primary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
