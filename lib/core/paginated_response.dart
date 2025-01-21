import 'package:capp_mobile/shared/constants/sizes.dart';

const double perPageLimit = size_20;

class PaginatedResponse<T> {
  final int total;
  final int skip;
  static const limit = perPageLimit;
  final List<T> data;

  PaginatedResponse(
      {required this.total, required this.skip, required this.data});

  factory PaginatedResponse.fromJson(dynamic json, List<T> data,
          {Function(dynamic json)? fixture}) =>
      PaginatedResponse(
        total: json['total'] ?? size_0,
        skip: json['skip'] ?? size_0,
        data: data,
      );

  @override
  String toString() {
    return 'PaginatedResponse(total:$total, skip:$skip, data:${data.length})';
  }
}
