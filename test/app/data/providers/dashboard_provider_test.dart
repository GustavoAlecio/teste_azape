import 'package:az_proof/app/data/models/dashboard_model.dart';
import 'package:az_proof/app/data/providers/dashboard_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DashboardProviderMock extends Mock implements DashboardProvider {}

void main() {
  test('dashboard provider ...', () async {
    final provider = DashboardProviderMock();
    final result = [DashboardModel()];

    when(() => provider.getDataDashboard('')).thenAnswer((_) async => result);

    var res = await provider.getDataDashboard('');

    expect(res, isA<List<DashboardModel>>());
  });
}
