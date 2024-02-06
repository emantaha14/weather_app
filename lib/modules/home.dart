import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/api_repo/weather_api.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/widgets/cloud_icon.dart';
import '../core/style/theme.dart';
import '../widgets/check_connectivity.dart';
import '../widgets/default_sized_box.dart';
import '../widgets/default_text_form_field.dart';
import '../widgets/next_five_days.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: WeatherApi.getWeatherData(context.watch<WeatherProvider>().city!),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final weatherData = snapshot.data!;

          int returnedTemperature(int index) {
            return ((weatherData.listWeather?[index].main.temp_max)! - 273.15)
                .round();
          }

          String getDate(int duration) {
            return DateFormat('EEEE').format(weatherData.listWeather![0].dt_txt
                .add(Duration(days: duration)));
          }

          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              DefaultTextFormField(
                controller: _searchController,
                type: TextInputType.text,
                isPassword: false,
                labelOfTextFormField: 'Search',
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter city';
                  }
                },
                prefix: Icons.search,
                onSubmit: (value) {
                  context.read<WeatherProvider>().changeSearchResult(
                      _searchController.text.isEmpty
                          ? weatherData.city.name
                          : _searchController.text);
                },
              ),
              const DefaultSizedBox.vertical(100),
              Center(
                child: Text(
                  weatherData.city.name,
                  style: TextStyle(
                    color: lightTheme.colorScheme.primary,
                    fontSize: 40,
                  ),
                ),
              ),
              const DefaultSizedBox.vertical(30),
              SizedBox(
                height: 80,
                width: 80,
                child: selectCloudIcon(
                  returnedTemperature(0),
                ),
              ),
              const DefaultSizedBox.vertical(30),
              Center(
                child: Text(
                  '${((weatherData.listWeather?[0].main.temp_max)! - 273.15).round()}',
                  style: TextStyle(
                    color: lightTheme.colorScheme.primary,
                    fontSize: 60,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the children horizontally
                children: [
                  Text(
                    'H:${returnedTemperature(0)}\u2103',
                    style: TextStyle(
                      color: lightTheme.colorScheme.primary,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '  L:${returnedTemperature(0)}\u2103',
                    style: TextStyle(
                      color: lightTheme.colorScheme.primary,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const DefaultSizedBox.vertical(20),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      child: NextFiveDays(
                        day: getDate(0),
                        temp: returnedTemperature(0),
                        cloudIcon: selectCloudIcon(returnedTemperature(0)),
                      ),
                    ),
                    Expanded(
                      child: NextFiveDays(
                        day: getDate(1),
                        temp: returnedTemperature(3),
                        cloudIcon: selectCloudIcon(returnedTemperature(3)),
                      ),
                    ),
                    Expanded(
                      child: NextFiveDays(
                        day: getDate(2),
                        temp: returnedTemperature(6),
                        cloudIcon: selectCloudIcon(returnedTemperature(6)),
                      ),
                    ),
                    Expanded(
                      child: NextFiveDays(
                        day: getDate(3),
                        temp: returnedTemperature(9),
                        cloudIcon: selectCloudIcon(returnedTemperature(9)),
                      ),
                    ),
                    Expanded(
                      child: NextFiveDays(
                        day: getDate(4),
                        temp: returnedTemperature(12),
                        cloudIcon: selectCloudIcon(returnedTemperature(12)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        else if (snapshot.hasError) {

          return const CheckConnectivity();
        }
        else {
          return  Center(
            child: CircularProgressIndicator(color: lightTheme.colorScheme.primary),
          );
        }
      },
    );
  }
}
