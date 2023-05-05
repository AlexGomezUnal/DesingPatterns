import "dart:collection";

void main() {}

enum color { red, blue, green, yellow, black, white, brown, gray }

class Animal {
  String? _sound;
  String? _name;
  int? _age;
  color? _color;

  Animal(String sound, String name, int age, color colour) {
    this._sound = sound;
    this._name = name;
    this._age = age;
    this._color = colour;
  }
  String? getName() {
    return this._name;
  }

  int? getAge() {
    return this._age;
  }

  String? makeSound() {
    return this._sound;
  }

  void setName(String name) {
    this._name = name;
  }

  void setAge(int age) {
    this._age = age;
  }

  void setSound(String sound) {
    this._sound = sound;
  }

  void setColor(color colour) {
    this._color = colour;
  }
}

class Bird extends Animal {
  Bird(super.sound, super.name, super.age, super.colour);
}
