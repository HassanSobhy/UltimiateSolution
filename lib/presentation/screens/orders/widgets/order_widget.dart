import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ultimate_solutions_task/config/theme/color_manager.dart';
import 'package:ultimate_solutions_task/core/resources/image_manager.dart';
import 'package:ultimate_solutions_task/domain/entities/orders/order.dart';
import 'package:ultimate_solutions_task/domain/entities/orders/status_type.dart';
import 'package:ultimate_solutions_task/generated/l10n.dart';

class OrderWidget extends StatelessWidget {
  final Order order;
  final String orderType;
  final List<StatusType> statusTypes;
  const OrderWidget({
    super.key,
    required this.order,
    required this.orderType,
    required this.statusTypes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: ColorManager.darkerGrey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                  child: Text(
                    "#${order.billSerial}",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: ColorManager.darkerGrey,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      _buildOrderItem(
                        context: context,
                        title: S.of(context).status,
                        value: _getStatusNameByFlag(context, statusTypes),
                        changeColor: true
                      ),
                      const Expanded(child: SizedBox()),
                      _buildDevider(),
                      const Expanded(child: SizedBox()),
                      _buildOrderItem(
                        context: context,
                        title: S.of(context).totalPrices,
                        value: "${convertToDouble(order.billAmount)} LE",
                      ),
                      const Expanded(child: SizedBox()),
                      _buildDevider(),
                      const Expanded(child: SizedBox()),
                      _buildOrderItem(
                        context: context,
                        title: S.of(context).date,
                        value: order.billDate,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            color: _getColorByOrderType(orderType),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  S.of(context).orderDetails,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorManager.white,
                      ),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 8,
                ),
                SvgPicture.asset(
                  ImageManager.back,
                  matchTextDirection: true,
                  fit: BoxFit.scaleDown,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildDevider() {
    return Container(
                      height: 50,
                      width: 1,
                      color: ColorManager.grey,
                    );
  }

  Color _getColorByOrderType(String orderType) {
    return orderType == "new"
        ? ColorManager.green
        : _getColorByStatusFlag(order.deliveryStatusFlag);
  }

  Color _getColorByStatusFlag(String statusFlag) {
    switch (statusFlag) {
      case "1":
        return ColorManager.darkerGrey;
      case "2":
        return ColorManager.red.withOpacity(0.7);
      case "3":
        return ColorManager.red;
      default:
        return ColorManager.darkerGrey;
    }
  }

  String _getStatusNameByFlag(BuildContext context,List<StatusType> statusTypes) {
    for (var statusType in statusTypes) {
      if (statusType.number == order.deliveryStatusFlag) {
        return statusType.name;
      }
    }
    return S.of(context).neww;
  }

  Widget _buildOrderItem({
    required BuildContext context,
    required String title,
    required String value,
    bool changeColor = false,
  }) {
    return FittedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ColorManager.darkerGrey,
                ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: !changeColor ? ColorManager.primary : _getColorByOrderType(orderType),
            ),
          ),
        ],
      ),
    );
  }

  String convertToDouble(String amount) {
    try {
      double amountDouble = double.parse(amount);
      return amountDouble.toStringAsFixed(2);
    } catch (e) {
      return "";
    }
  }

}
