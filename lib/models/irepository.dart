abstract class IRepository<T> {
  Future<List<T>> search();

  Future<T> find(int id);

  Future<int> insert(T entity);

  Future<int> update({
    required T entity,
    required String conditions,
    required List conditionsValue,
  });

  Future<int> remove({
    required String conditions,
    required List conditionsValue,
  });
}