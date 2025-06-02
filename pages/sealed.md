---
layout: default
class: text-left
---

## Exaustivité

````md magic-move {lines: true}
```dart {all}
abstract class FruitState {}

class FruitLoaded extends FruitState { ... }
class FruitError extends FruitState { ... }
class FruitLoading extends FruitState {}
```

```dart {all}
abstract class FruitState {}

class FruitLoaded extends FruitState { ... }
class FruitError extends FruitState { ... }
class FruitLoading extends FruitState {}

Widget build(BuildContext context) {
    return BlocBuilder<FruitBloc, FruitState>(
        builder: (context, state) {
            if (state is FruitLoading) {
                return LoadingIndicator();
            }
            if (state is FruitError) {
                return ErrorMessage(state.err);
            }
            if (state is FruitLoaded) {
                return FruitList(state.fruits);
            }
        },
    );
}
```
```dart {all}
abstract class FruitState {}

class FruitLoaded extends FruitState { ... }
class FruitError extends FruitState { ... }
class FruitLoading extends FruitState {}

Widget build(BuildContext context) {
    return BlocBuilder<FruitBloc, FruitState>(
        builder: (context, state) {
            if (state is String) {
                return Text('This is a String');
            }
            if (state is FruitLoading) {
                return LoadingIndicator();
            }
            if (state is FruitError) {
                return ErrorMessage(state.err);
            }
            if (state is FruitLoaded) {
                return FruitList(state.fruits);
            }
        },
    );
}
```
```dart {all}
abstract class FruitState {}

class FruitLoaded extends FruitState { ... }
class FruitError extends FruitState { ... }
class FruitLoading extends FruitState {}

Widget build(BuildContext context) {
    return BlocBuilder<FruitBloc, FruitState>(
        builder: (context, state) {
            if (state is FruitLoading) {
                return LoadingIndicator();
            }
            if (state is FruitError) {
                return ErrorMessage(state.err);
            }
            if (state is FruitLoaded) {
                return FruitList(state.fruits);
            }
        },
    );
}
```
```dart {all}
abstract class FruitState {}

class FruitLoaded extends FruitState { ... }
class FruitError extends FruitState { ... }
class FruitLoading extends FruitState {}

Widget build(BuildContext context) {
    return BlocBuilder<FruitBloc, FruitState>(
        builder: (context, state) {
            if (state is FruitLoading) {
                return LoadingIndicator();
            }
            if (state is FruitError) {
                return ErrorMessage(state.err);
            }
            if (state is FruitLoaded) {
                return FruitList(state.fruits);
            }
            return const SizedBox.shrink();
        },
    );
}
```
```dart {all}
abstract class FruitState {}

class FruitLoaded extends FruitState { ... }
class FruitError extends FruitState { ... }
class FruitLoading extends FruitState {}

Widget build(BuildContext context) {
    return BlocBuilder<FruitBloc, FruitState>(
        builder: (context, state) {
            return switch(state) {
                String() => Text('This can\'t happen'),
            };
        },
    );
}
```
```dart {all}
abstract class FruitState {}

class FruitLoaded extends FruitState { ... }
class FruitError extends FruitState { ... }
class FruitLoading extends FruitState {}

Widget build(BuildContext context) {
    return BlocBuilder<FruitBloc, FruitState>(
        builder: (context, state) {
            return switch(state) {
                FruitLoading() => LoadingIndicator(),
                FruitError() => ErrorMessage(state.err),
                FruitLoaded() => FruitList(state.fruits),
            };
        },
    );
}
```
```dart {all}
abstract class FruitState {}

class FruitLoaded extends FruitState { ... }
class FruitError extends FruitState { ... }
class FruitLoading extends FruitState {}

Widget build(BuildContext context) {
    return BlocBuilder<FruitBloc, FruitState>(
        builder: (context, state) {
            return switch(state) {
                FruitLoading() => LoadingIndicator(),
                FruitError(:final err) => ErrorMessage(err),
                FruitLoaded(:final fruits) => FruitList(fruits),
            };
        },
    );
}
```
```dart {all}
abstract class FruitState {}

class FruitLoaded extends FruitState { ... }
class FruitError extends FruitState { ... }
class FruitLoading extends FruitState {}

Widget build(BuildContext context) {
    return BlocBuilder<FruitBloc, FruitState>(
        builder: (context, state) {
            return switch(state) {
                FruitLoading() => LoadingIndicator(),
                FruitError(:final err) => ErrorMessage(err),
                FruitLoaded(:final fruits) => FruitList(fruits),
                _ => const SizedBox.shrink(),
            };
        },
    );
}
```
```dart {all}
abstract class FruitState {}

class FruitLoaded extends FruitState { ... }
class FruitError extends FruitState { ... }
class FruitLoading extends FruitState {}
class FruitSoonAvailable extends FruitState {
    final DateTime availableAt;
}

Widget build(BuildContext context) {
    return BlocBuilder<FruitBloc, FruitState>(
        builder: (context, state) {
            return switch(state) {
                FruitLoading() => LoadingIndicator(),
                FruitError(:final err) => ErrorMessage(err),
                FruitLoaded(:final fruits) => FruitList(fruits),
                _ => const SizedBox.shrink(),
            };
        },
    );
}
```
```dart {all}
abstract class FruitState {}

class FruitLoaded extends FruitState { ... }
class FruitError extends FruitState { ... }
class FruitLoading extends FruitState {}

Widget build(BuildContext context) {
    return BlocBuilder<FruitBloc, FruitState>(
        builder: (context, state) {
            return switch(state) {
                FruitLoading() => LoadingIndicator(),
                FruitError(:final err) => ErrorMessage(err),
                FruitLoaded(:final fruits) => FruitList(fruits),
                _ => const SizedBox.shrink(),
            };
        },
    );
}
```
```dart {1}
sealed class FruitState {}

class FruitLoaded extends FruitState { ... }
class FruitError extends FruitState { ... }
class FruitLoading extends FruitState {}

Widget build(BuildContext context) {
    return BlocBuilder<FruitBloc, FruitState>(
        builder: (context, state) {
            return switch(state) {
                FruitLoading() => LoadingIndicator(),
                FruitError(:final err) => ErrorMessage(err),
                FruitLoaded(:final fruits) => FruitList(fruits),
                _ => const SizedBox.shrink(),
            };
        },
    );
}
```
```dart {all}
sealed class FruitState {}

class FruitLoaded extends FruitState { ... }
class FruitError extends FruitState { ... }
class FruitLoading extends FruitState {}

Widget build(BuildContext context) {
    return BlocBuilder<FruitBloc, FruitState>(
        builder: (context, state) {
            return switch(state) {
                FruitLoading() => LoadingIndicator(),
                FruitError(:final err) => ErrorMessage(err),
                FruitLoaded(:final fruits) => FruitList(fruits),
            };
        },
    );
}
```
```dart {6-8}
sealed class FruitState {}

class FruitLoaded extends FruitState { ... }
class FruitError extends FruitState { ... }
class FruitLoading extends FruitState {}
class FruitSoonAvailable extends FruitState {
    final DateTime availableAt;
}

Widget build(BuildContext context) {
    return BlocBuilder<FruitBloc, FruitState>(
        builder: (context, state) {
            return switch(state) {
                FruitLoading() => LoadingIndicator(),
                FruitError(:final err) => ErrorMessage(err),
                FruitLoaded(:final fruits) => FruitList(fruits),
            };
        },
    );
}
```
```dart {6-8,17}
sealed class FruitState {}

class FruitLoaded extends FruitState { ... }
class FruitError extends FruitState { ... }
class FruitLoading extends FruitState {}
class FruitSoonAvailable extends FruitState {
    final DateTime availableAt;
}

Widget build(BuildContext context) {
    return BlocBuilder<FruitBloc, FruitState>(
        builder: (context, state) {
            return switch(state) {
                FruitLoading() => LoadingIndicator(),
                FruitError(:final err) => ErrorMessage(err),
                FruitLoaded(:final fruits) => FruitList(fruits),
                FruitSoonAvailable(:final availableAt) => FruitSoonAvailable(availableAt),
            };
        },
    );
}
```
```dart {all}
sealed class FruitState {}

class FruitLoaded extends FruitState { ... }
class FruitError extends FruitState { ... }
class FruitLoading extends FruitState {}
class FruitSoonAvailable extends FruitState {
    final DateTime availableAt;
}

Widget build(BuildContext context) {
    return BlocBuilder<FruitBloc, FruitState>(
        builder: (context, state) {
            return switch(state) {
                FruitLoading() => LoadingIndicator(),
                FruitError(:final err) => ErrorMessage(err),
                FruitLoaded(:final fruits) => FruitList(fruits),
                FruitSoonAvailable(:final availableAt) => FruitSoonAvailable(availableAt),
            };
        },
    );
}
```
```dart {all}
sealed class FruitState {}

class FruitLoaded extends FruitState { ... }
class FruitError extends FruitState { ... }
class FruitLoading extends FruitState {}
class FruitSoonAvailable extends FruitState {
    final DateTime availableAt;
}

Widget build(BuildContext context) {
    return BlocBuilder<FruitBloc, FruitState>(
        builder: (context, state) => switch(state) {
            FruitLoading() => LoadingIndicator(),
            FruitError(:final err) => ErrorMessage(err),
            FruitLoaded(:final fruits) => FruitList(fruits),
            FruitSoonAvailable(:final availableAt) => FruitSoonAvailable(availableAt),
        },
    );
}
```
```dart {all}
sealed class FruitState {}

class FruitLoaded extends FruitState { ... }
class FruitError extends FruitState { ... }
class FruitLoading extends FruitState {}
class FruitSoonAvailable extends FruitState {
    final DateTime availableAt;
}

Widget build(BuildContext context) => BlocBuilder<FruitBloc, FruitState>(
        builder: (context, state) => switch(state) {
            FruitLoading() => LoadingIndicator(),
            FruitError(:final err) => ErrorMessage(err),
            FruitLoaded(:final fruits) => FruitList(fruits),
            FruitSoonAvailable(:final availableAt) => FruitSoonAvailable(availableAt),
        },
    );
}
```
````
<v-clicks>

#### Vérifié à la compilation ET exaustif
</v-clicks>

---
layout: default
class: text-left
---

### Exaustivité

````md magic-move {lines: true}
```dart {all}
class WareHouseModel {
  final bool canSelect;
  final bool isSelected;
  final bool isSomethingMissing;
}
```
```dart {all}
class WareHouseModel {
  final bool canSelect;
  final bool isSelected;
  final bool isSomethingMissing;
}

Color complexWareHouseColor(WareHouseModel warehouse) {
  if (warehouse.canSelect) {
    if (warehouse.isSelected) {
        return Colors.blue;
    } else {
        return Colors.white;
    }
  } else if (warehouse.isSomethingMissing) {
    return Colors.red;
  } else {
    return Colors.grey;
  }
}
```
````

---
layout: default
class: text-left
---

## Exaustivité

<v-clicks>

| canSelect | isSelected | isSomethingMissing | result  |
| --- | --- | --- | --- |
| `true` | `true` | `-` | `blue` |
| `true` | `false` | `-` | `white` |
| `false` | `-` | `true` | `red` |
| `false` | `-` | `false` | `grey` |

</v-clicks>

---
layout: default
class: text-left
---

## Exaustivité

````md magic-move {lines: true}
```dart {all}
class WareHouseModel {
  final bool canSelect;
  final bool isSelected;
  final bool isSomethingMissing;
}
```
```dart {7-12|8|9|10|11|7-12}
class WareHouseModel {
  final bool canSelect;
  final bool isSelected;
  final bool isSomethingMissing;
}

Color simpleWareHouseColor(WareHouseModel model) => switch (model) {
    WareHouseModel(canSelect: true, isSelected: true, isSomethingMissing: _) => Colors.blue,
    WareHouseModel(canSelect: true, isSelected: false, isSomethingMissing: _) => Colors.white,
    WareHouseModel(canSelect: false, isSelected: _, isSomethingMissing: true) => Colors.red,
    WareHouseModel(canSelect: false, isSelected: _, isSomethingMissing: false) => Colors.grey
  };
```
```dart {8|9|10|11|12|7-13}
class WareHouseModel {
  final bool canSelect;
  final bool isSelected;
  final bool isSomethingMissing;
}

Color simplestWareHouseColor(WareHouseModel model) =>
    switch ((model.canSelect, model.isSelected, model.isSomethingMissing)) {
      (true, true, _) => Colors.blue,
      (true, false, _) => Colors.white,
      (false, _, true) => Colors.red,
      (false, _, false) => Colors.grey,
    };
```
````

