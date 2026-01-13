import 'package:repalogic_flight_booking/utilities/common_exports.dart';

void showCityPicker({
  required String type,
  required BuildContext context,
  required List<String> popularCities,
  required TextEditingController originController,
  required TextEditingController destinationController,
}) {
  showModalBottomSheet(
    context: context,
    builder: (context) => Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Select $type',
            style: context.textTheme.displayLarge?.copyWith(
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: popularCities.length,
              itemBuilder: (context, index) {
                final city = popularCities[index];
                return ListTile(
                  title: Text(city),
                  onTap: () {
                    if (type == 'Origin') {
                      originController.text = city;
                    } else {
                      destinationController.text = city;
                    }
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
