import 'package:api_case/product/model/task_master.dart';
import 'package:hive/hive.dart';

/// Represents a cache manager.
abstract final class ICacheManager<T> {
  /// Creates a new instance of the [ICacheManager] class.
  ICacheManager(this.key);

  /// The key of the box.
  final String key;

  Box<T>? _boxBooks;

  /// Initializes the box.
  Future<void> init() async {
    saveBooksAdapter();
    if (!(_boxBooks?.isOpen ?? false)) {
      _boxBooks = await Hive.openBox<T>(key);
    }
  }

  /// Closes the box.
  void saveBooksAdapter();

  /// Closes the box.
  Future<void> clearAll() async {
    await _boxBooks?.clear();
  }

  /// Closes the box.
  Future<void> addItems(List<T> items);

  /// Closes the box.
  Future<void> putItems(List<T> items);

  /// getItem
  T? getItem(String key);

  /// Closes the box.
  List<T> getValues();

  /// putItem
  Future<void> putItem(String key, T item);

  /// removeItem
  Future<void> removeItem(String key);

  /// removeItem
  Future<void> removeModel(T item);

  /// Updates the item.
  Future<void> updateItem(T item);
}

/// Represents a box.
final class PinnedCacheManager extends ICacheManager<TaskMaster> {
  /// Creates a new instance of the [PinnedCacheManager] class.
  PinnedCacheManager(super.key);

  @override
  Future<void> addItems(List<TaskMaster> items) async {
    await _boxBooks?.addAll(items);
  }

  @override
  Future<void> putItems(List<TaskMaster> items) async {
    await _boxBooks?.putAll(
      Map.fromEntries(
        items.map((e) => MapEntry(e.id, e)),
      ),
    );
  }

  @override
  Future<void> putItem(String key, TaskMaster item) async {
    await _boxBooks?.put(key, item);
  }

  @override
  Future<void> removeItem(String key) async {
    await _boxBooks?.deleteAt(
      _boxBooks?.values.toList().indexWhere(
                (element) => element.id == key,
              ) ??
          0,
    );
  }

  @override
  TaskMaster? getItem(String key) {
    return _boxBooks?.get(key);
  }

  @override
  List<TaskMaster> getValues() {
    return _boxBooks?.values.toList() ?? [];
  }

  @override
  void saveBooksAdapter() {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(
        TaskMasterAdapter(),
      );
    }
  }

  @override
  Future<void> removeModel(TaskMaster item) async {
    await _boxBooks?.delete(item);
  }

  @override
  Future<void> updateItem(TaskMaster item) async {
    return _boxBooks?.put(item.id, item);
  }
}
