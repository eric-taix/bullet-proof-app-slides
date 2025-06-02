---
layout: default
class: text-left
---

# Fonction : valeur avec un type

````md magic-move {lines: true}

```dart {1-2}
// <return> Function(<parameters>)
bool iLocalFruit(Fruit fruit) => fruit.category == FruitCategory.local;
```
```dart {3}
// <return> Function(<parameters>)
bool iLocalFruit(Fruit fruit) => fruit.category == FruitCategory.local;
bool Function(Fruit) isLocalFruit2 = (Fruit fruit) => fruit.category == FruitCategory.local;
```
```dart {5-7}
// <return> Function(<parameters>)
bool iLocalFruit(Fruit fruit) => fruit.category == FruitCategory.local;
bool Function(Fruit) isLocalFruit2 = (Fruit fruit) => fruit.category == FruitCategory.local;

// Que l'on peut passer en paramètre
fruits.where(isLocalFruit);
fruits.where(isLocalFruit2);
```
```dart {10-14,16}
// <return> Function(<parameters>)
bool iLocalFruit(Fruit fruit) => fruit.category == FruitCategory.local;
bool Function(Fruit) isLocalFruit2 = (Fruit fruit) => fruit.category == FruitCategory.local;

// Que l'on peut passer en paramètre
fruits.where(isLocalFruit);
fruits.where(isLocalFruit2);

// Ou retourner
bool Function(Fruit) otherFunction() {
  return (Fruit fruit) {
    return fruit.category == FruitCategory.local; 
  }
}

fruits.where(otherFunction());
```

```dart {9-12}
// <return> Function(<parameters>)
bool iLocalFruit(Fruit fruit) => fruit.category == FruitCategory.local;
bool Function(Fruit) isLocalFruit2 = (Fruit fruit) => fruit.category == FruitCategory.local;

// Que l'on peut passer en paramètre
fruits.where(isLocalFruit);
fruits.where(isLocalFruit2);

// Ou retourner
bool Function(Fruit) otherFunction() => (Fruit fruit) => fruit.category == FruitCategory.local; 

fruits.where(otherFunction());
```

```dart {8-11}
// <return> <function name>(<parameters>)
bool iLocalFruit(Fruit fruit) => fruit.category == FruitCategory.local;
bool Function(Fruit) isLocalFruit = (Fruit fruit) => fruit.category == FruitCategory.local;

// Que l'on peut passer en paramètre
fruits.where(isLocalFruit);

// Ou que l'on peut retourner
bool fruitIsOfCategory(Fruit fruit, FruitCategory category) => fruit.category == category; 

fruits.where((fruit) => fruitIsOfCategory(fruit, FruitCategory.local));
```

```dart {8-11}
// <return> <function name>(<parameters>)
bool iLocalFruit(Fruit fruit) => fruit.category == FruitCategory.local;
bool Function(Fruit) isLocalFruit = (Fruit fruit) => fruit.category == FruitCategory.local;

// Que l'on peut passer en paramètre
fruits.where(isLocalFruit);

// Ou que l'on peut retourner
bool fruitIsOfCategory(FruitCategory category, Fruit fruit) => fruit.category == category; 

fruits.where((fruit) => fruitIsOfCategory(FruitCategory.local, fruit));
```


```dart {8-12}
// <return> <function name>(<parameters>)
bool iLocalFruit(Fruit fruit) => fruit.category == FruitCategory.local;
bool Function(Fruit) isLocalFruit = (Fruit fruit) => fruit.category == FruitCategory.local;

// Que l'on peut passer en paramètre
fruits.where(isLocalFruit);

// Ou que l'on peut retourner
bool Function(Fruit) fruitIsOfCategory(FruitCategory category) => 
  (Fruit fruit) => fruit.category == category; 

fruits.where((fruit) => fruitIsOfCategory(FruitCategory.local)(fruit));
```

```dart {8-12}
// <return> <function name>(<parameters>)
bool iLocalFruit(Fruit fruit) => fruit.category == FruitCategory.local;
bool Function(Fruit) isLocalFruit = (Fruit fruit) => fruit.category == FruitCategory.local;

// Que l'on peut passer en paramètre
fruits.where(isLocalFruit);

// Ou que l'on peut retourner
bool Function(Fruit) fruitIsOfCategory(FruitCategory category) => 
  (Fruit fruit) => fruit.category == category; 

fruits.where(fruitIsOfCategory(FruitCategory.local));
```

```dart {all}
bool Function(Fruit) fruitIsOfCategory(FruitCategory category) => 
  (Fruit fruit) => fruit.category == category; 

double computeStockValueFP(List<Fruit> fruits, FruitCategory category) => fruits
    .where(fruitIsOfCategory(category))
    .map(computePrice)
    .reduce(sum);
```

```dart {all}
bool Function(Fruit) fruitIsOfCategory(FruitCategory category) => 
  (Fruit fruit) => fruit.category == category; 

double computeStockValueFP(FruitCategory category, List<Fruit> fruits) => fruits
    .where(fruitIsOfCategory(category))
    .map(computePrice)
    .reduce(sum);
```

```dart {all}
bool Function(Fruit) fruitIsOfCategory(FruitCategory category) => 
  (Fruit fruit) => fruit.category == category; 

double Function(List<Fruit>) computeStockValueFP(FruitCategory category) => 
    (List<Fruit> fruits) => fruits
      .where(fruitIsOfCategory(category))
      .map(computePrice)
      .reduce(sum);
```

```dart {all}
bool Function(Fruit) fruitIsOfCategory(FruitCategory category) => 
  (Fruit fruit) => fruit.category == category; 
  
double Function(List<Fruit>) computeStockValueFP(FruitCategory category) => 
    (List<Fruit> fruits) => fruits
      .where(fruitIsOfCategory(category))
      .map(computePrice)
      .reduce(sum);

final computeLocalFruitStockValue = computeStockValueFP(FruitCategory.local);
final computeExoticFruitStockValue = computeStockValueFP(FruitCategory.exotic);

computeLocalFruitStockValue(fruits);
computeExoticFruitStockValue(fruits);
```

````
