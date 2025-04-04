import 'package:fullstack_group_ui_kit/fullstack_group_ui_kit.dart';

class MockApiService implements ApiService {
  // Simulate a database/storage
  final Set<String> _favoriteIds = {};

  final Map<String, int> _orderStatus = {};


  @override
  Future<void> addToFavorites(String productId) async {
    _favoriteIds.add(productId);
  }

  @override
  Future<void> removeFromFavorites(String productId) async {
    _favoriteIds.remove(productId);
  }

  // Helper method to check if a product is favorited
  Future<bool> isFavorite(String productId) async {
    return _favoriteIds.contains(productId);
  }

  // Helper method to clear all favorites (for testing)
  Future<void> clearFavorites() async {
    _favoriteIds.clear();
  }

  @override
  Future<List<int>> getFavoriteIds() {
    // TODO: implement getFavoriteIds
    throw UnimplementedError();
  }

  @override
  Future<void> updateStatus(String orderId, int status) async {
    _orderStatus[orderId] = status;
  }

  @override
  Future<int> getStatus(String orderId) async {
    return _orderStatus[orderId] ?? 0;
  }
}