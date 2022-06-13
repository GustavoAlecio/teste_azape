import 'package:az_proof/app/data/models/dashboard_model.dart';
import 'package:dio/dio.dart';

class DashboardProvider {
  final request = Dio();

  Options opt = Options(
    followRedirects: false,
    validateStatus: (status) {
      return status! < 500;
    },
    headers: {
      'Content-Type': 'application/json',
    },
  );

  final baseUrl = 'http://150.230.64.79:9393/proof';

  Future getDataDashboard(String token) async {
    opt.headers!['Authorization'] = 'Bearer $token';
    try {
      final response = await request.get(
        '$baseUrl/dashboard',
        options: opt,
      );

      if (response.statusCode == 200) {
        var dashboard = DashboardModel.fromJson(response.data);

        return dashboard;
      }
    } catch (e) {
      return Exception();
    }
  }
}
