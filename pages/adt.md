---
layout: two-cols
class: text-left
---

::title::
## La complexité extrinsèque

::default::


````md magic-move {lines: true}

```dart
bool isLocalFruit(Fruit fruit) => ...;
```

```dart {all}
class FruitState {
  final List<Fruit> fruits;
}
```
```dart {all}
class FruitState {
  final List<Fruit> fruits;
  bool isLoading;
}
```
```dart {all}
class FruitState {
  final List<Fruit>? fruits;
  bool isLoading;
}
```
```dart {all}
class FruitState {
  final List<Fruit>? fruits;
  bool isLoading;
  bool isError;
  String? err;
}
```
````

---
layout: two-cols
class: text-left
---

::title::
## La complexité extrinsèque

::default::


````md magic-move {lines: true}

```dart {all}
class FruitState {
  final List<Fruit>? fruits;
  bool isLoading;
  bool isError;
  String? err;
}
```
````

::right::
<v-clicks>

| Fruits | isLoad | isErr | err | result  |
| --- | --- | --- | --- | --- |
| `vals` | `false` | `false` | `null` | `vals` |
| `null`| `true` | `false` | `null` | `loading` |
| `null`| `false` | `true` | `Error` | `Error` |
| `vals` | `true` | `false` | `null` | `?` |
| `vals` | `false` | `true` | `-` | `?` |
| `vals` | `true` | `true` | `-` | `?` |
| `null`| `true` | `true` | `-` | `?` |
| `null`| `false` | `false` | `-` | `?` |

</v-clicks>


---
layout: two-cols
class: text-left
---

::title::
## La complexité extrinsèque

::default::
<v-clicks>

| Attribut | Possibilités |
| --- | --- |
| `fruits` | `2` |
| `isLoading` | `2` |
| `isError` | `2` |
| `err` | `2` |
| `Total` | `2 * 2 * 2 * 2 = 16` |

</v-clicks>

#### <div v-click>=> Product Type</div>

::right::

<v-clicks>

  - 13 solutions de trop
  - Charge cognitive
  - Tests unitaires pour vérifier que certains cas ne vont jamais apparaître
  - Pour des choses qui ne devraient pas être modélisées
  - Ajouter une documentation pour expliquer comment utiliser ce state
  - Ou des bugs en production si cela arrive

</v-clicks>

---
layout: two-cols
class: text-left
---

::title::
## La complexité extrinsèque


::default::

````md magic-move {lines: true}

```dart {all}
abstract class FruitState {}
```
```dart {all}
abstract class FruitState {}

class FruitLoaded extends FruitState {
  final List<Fruit> fruits;
}
```
```dart {all}
abstract class FruitState {}

class FruitLoaded extends FruitState {
  final List<Fruit> fruits;
}

class FruitError extends FruitState {
  final String err;
}
```
```dart {all}
abstract class FruitState {}

class FruitLoaded extends FruitState {
  final List<Fruit> fruits;
}

class FruitError extends FruitState {
  final String err;
}

class FruitLoading extends FruitState {}
```
````

::right::
<v-clicks>

| State | result  |
| --- | --- | 
| `FruitLoaded` | `fruits` |
| `FruitError` | `err` |
| `FruitLoading` | `loading` |
| `Total` | `3` |

</v-clicks>

#### <div v-click>=> Sum Type</div>
