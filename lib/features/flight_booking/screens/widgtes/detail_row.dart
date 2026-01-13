import 'package:repalogic_flight_booking/utilities/common_exports.dart';

class DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final BuildContext context;
  final bool isHighlight;

  const DetailRow({
    super.key,
    required this.label,
    required this.value,
    required this.context,
    this.isHighlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: this.context.textTheme.labelLarge),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: this.context.textTheme.displayMedium?.copyWith(
                color: isHighlight ? AppColors.primaryColor : AppColors.black,
                fontWeight: isHighlight ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
