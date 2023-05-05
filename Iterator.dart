class MyIterable implements Iterable<int> {
  final List<int> _list;

  MyIterable(this._list);

  @override
  Iterator<int> get iterator => _list.iterator;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  final myIterable = MyIterable([1, 2, 3, 4, 5]);

  final iterator = myIterable.iterator;
  while (iterator.moveNext()) {
    final current = iterator.current;
    print(current);
  }
}
