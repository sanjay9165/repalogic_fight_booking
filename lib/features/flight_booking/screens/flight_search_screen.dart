import 'package:repalogic_flight_booking/utilities/common_exports.dart';

class FlightSearchScreen extends StatefulWidget {
  const FlightSearchScreen({super.key});

  @override
  State<FlightSearchScreen> createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends State<FlightSearchScreen> {
  final _formKey = GlobalKey<FormState>();
  final _originController = TextEditingController();
  final _destinationController = TextEditingController();
  DateTime? _selectedDate;
  final List<String> _popularCities = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<FlightProvider>();
      _popularCities.addAll(provider.getPopularCities());
    });
  }

  @override
  void dispose() {
    _originController.dispose();
    _destinationController.dispose();
    super.dispose();
  }

  void _searchFlights() {
    if (_formKey.currentState!.validate()) {
      if (_selectedDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text(AppConstants.emptyDateError)),
        );
        return;
      }

      final search = FlightSearch(
        origin: _originController.text.trim(),
        destination: _destinationController.text.trim(),
        date: _selectedDate!,
      );

      if (!mounted) return;
      context.read<FlightProvider>().searchFlights(search).then((_) {
        if (!mounted) return;
        Navigator.pushNamed(context, Routes.flightListScreen);
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? date = await context.selectDate();

    if (date != null) {
      setState(() {
        _selectedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.searchFlightsTitle)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              CustomTextField(
                label: 'From (Origin)',
                hintText: 'Select origin city',
                controller: _originController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return AppConstants.emptyOriginError;
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  icon: const Icon(Icons.arrow_drop_down),
                  onPressed: () => showCityPicker(
                    type: 'Origin',
                    context: context,
                    popularCities: _popularCities,
                    originController: _originController,
                    destinationController: _destinationController,
                  ),
                ),
                onChanged: (value) {},
              ),
              const SizedBox(height: 24),
              CustomTextField(
                label: 'To (Destination)',
                hintText: 'Select destination city',
                controller: _destinationController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return AppConstants.emptyDestinationError;
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  icon: const Icon(Icons.arrow_drop_down),
                  onPressed: () => showCityPicker(
                    type: 'Destination',
                    context: context,
                    popularCities: _popularCities,
                    originController: _originController,
                    destinationController: _destinationController,
                  ),
                ),
                onChanged: (value) {},
              ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () async => await _selectDate(context),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.formBackground,
                    border: Border(
                      bottom: BorderSide(color: AppColors.lightGray, width: 2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Departure Date',
                        style: context.textTheme.labelLarge,
                      ),
                      const SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 16,
                          top: 16,
                          left: 16,
                        ),
                        child: Text(
                          _selectedDate != null
                              ? DateFormat(
                                  AppConstants.dateFormat,
                                ).format(_selectedDate!)
                              : 'Select date',
                          style: context.textTheme.labelLarge?.copyWith(
                            color: _selectedDate != null
                                ? AppColors.black
                                : AppColors.lightGray,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              CustomButton(text: 'Search Flights', onPressed: _searchFlights),
            ],
          ),
        ),
      ),
    );
  }
}
