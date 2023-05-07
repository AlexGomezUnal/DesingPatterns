class Node<T> {
  Node<T>? _next;
  Node<T>? _previous;
  T? _data;

  Node(T data) {
    this._data = data;
  }

  T? getData() {
    return this._data;
  }

  Node<T>? getNodeNext() {
    return this._next;
  }

  Node<T>? getNodePrevious() {
    return this._previous;
  }

  void setData(T data) {
    this._data = data;
  }

  void setNext(Node<T> next) {
    this._next = next;
  }

  void setPrevious(Node<T> previous) {
    this._previous = previous;
  }
}

class DoubledLinkedList<T> {
  int _length = 0;
  Node<T>? _head;
  Node<T>? _tail;

  DoubledLinkedList(T item) {
    Node<T> node = Node(item);
    this._head = node;
    this._tail = node;
    this._length++;
  }

  void add(T item) {
    Node<T> node = Node(item);
    if (this._head == null) {
      this._head = node;
      this._tail = node;
    } else {
      this._head?.setPrevious(node);
      node.setNext(this._head!);
      this._head = node;
    }
    this._length++;
  }

  T? getFirst() {
    return this._head?.getData();
  }

  T? getlast() {
    return this._tail?.getData();
  }

  int getLength() {
    return this._length;
  }
}

void main() {
  DoubledLinkedList list = DoubledLinkedList<int>(1);
  for (var i = 2; i < 1000; i++) {
    list.add(i);
  }
  print(list.getFirst());
  print(list.getlast());
  print(list.getLength());
  print(list);
}
