---
layout: default
class: text-left
---

## Async

````md magic-move {lines: true}

```dart {all}
Either<FruitError, WareHouse> getWareHouse(WarehouseId warehouseId) { 
  ...
}
```
```dart {all}
Future<Either<FruitError, WareHouse>> getWareHouse(WarehouseId warehouseId) async { 
    final response = await http.get('$baseUrl/warehouses/${warehouseId.value}');
    ...
}
```
```dart {all}
Future<Either<FruitError, WareHouse>> getWareHouse(WarehouseId warehouseId) async { 
    try {
      final response = await http.get('$baseUrl/warehouses/${warehouseId.value}');
      return Right(WareHouse.fromJson(response.body));
    } catch (e) {
      return Left(NetworkError(e));
    }
}
```
```dart {all|1|2-9|all}
Task<Either<FruitError, WareHouse>> getWareHouse(WarehouseId warehouseId) { 
    return Task.of(() async {
        try {
            final response = await http.get('$baseUrl/warehouses/${warehouseId.value}');
            return Right(WareHouse.fromJson(response.body));
        } catch (e) {
            return Left(NetworkError(e));
        }
    });
}
```
```dart {all|1|2-9|all}
TaskEither<FruitError, WareHouse> getWareHouse(WarehouseId warehouseId) { 
    return TaskEither.tryCatch(() async {
        final response = await http.get('$baseUrl/warehouses/${warehouseId.value}');
        return WareHouse.fromJson(response.body);
    }, (error, stackTrace) {
        return NetworkError(error);
    });
}
```
````

---
layout: two-cols
class: text-left
---

::title::

## Async

::default:: 

````md magic-move {lines: true}

```dart {all}
  [1, 2, 3]
    .where((x) { 
        print(x);
        return x % 2 == 0; 
    })
    .map((x) { 
        print(x);
        return x * 2;
    });
```
```dart {all|10}
  [1, 2, 3]
    .where((x) { 
        print(x);
        return x % 2 == 0; 
    })
    .map((x) { 
        print(x);
        return x * 2;
    })
   .toList();
```
````

::right::

  1- `1`,`2`,`3`,`2`<br/>
  <br/>
  2- `1`,`2`,`2`,`3`<br/>
  <br>
  3- ` `

---
layout: default
class: text-left
---

## Async

````md magic-move {lines: true}
```dart {all}
TaskEither<FruitError, WareHouse> getWareHouse(WarehouseId warehouseId) { ... }

void computeDashboard(WarehouseId warehouseId) {
  getWareHouse(warehouseId);
}
```
```dart {all}
TaskEither<FruitError, WareHouse> getWareHouse(WarehouseId warehouseId) { ... }

void computeDashboard(WarehouseId warehouseId) {
  getWareHouse(warehouseId)
    .map((wareHouse) => wareHouse.stocks);
}
```
```dart {all|2,6}
TaskEither<FruitError, WareHouse> getWareHouse(WarehouseId warehouseId) { ... }
Stocks getWareHouseStocks(WareHouse wareHouse) { ... }

void computeDashboard(WarehouseId warehouseId) {
  getWareHouse(warehouseId)
    .map(getWareHouseStocks);
}
```
```dart {all|1,6}
TaskEither<FruitError, Fruits> getFruits(Stocks stocks) { ... }

void computeDashboard(WarehouseId warehouseId) {
  getWareHouse(warehouseId)
    .map(getWareHouseStocks)
    .flatMap(getFruits);
}
```
```dart {1}
Option<double> averagePrice(List<Fruit> fruits) { ... }

void computeDashboard(WarehouseId warehouseId) {
  getWareHouse(warehouseId)
    .map(getWareHouseStocks)
    .flatMap(getFruits);
}
```
```dart {1-5}
Option<double> averagePrice(List<Fruit> fruits) {
  return fruits.isNotEmpty
      ? Some(fruits.map((fruit) => fruit.price).fold(0, sum) / fruits.length)
      : None();
}

void computeDashboard(WarehouseId warehouseId) {
  getWareHouse(warehouseId)
    .map(getWareHouseStocks)
    .flatMap(getFruits);
}
```
```dart {1-5}
Either<FruitError, double> averagePrice(List<Fruit> fruits) {
  return fruits.isNotEmpty
      ? Right(fruits.map((fruit) => fruit.price).fold(0, sum) / fruits.length)
      : Left(NoFruitsFoundError());
}

void computeDashboard(WarehouseId warehouseId) {
  getWareHouse(warehouseId)
    .map(getWareHouseStocks)
    .flatMap(getFruits);
}
```
```dart {1,7}
Either<FruitError, double> averagePrice(List<Fruit> fruits) { ... }

void computeDashboard(WarehouseId warehouseId) {
  getWareHouse(warehouseId)
    .map(getWareHouseStocks)
    .flatMap(getFruits)
    .chainEither(averagePrice);
}
```
```dart {1,8}
double Function(double) addTva(double tva) { ... }

void computeDashboard(WarehouseId warehouseId) {
  getWareHouse(warehouseId)
    .map(getWareHouseStocks)
    .flatMap(getFruits)
    .chainEither(averagePrice)
    .map(addTva(0.2));
}
```
```dart {1-4,14}
DashboardState buildErrorState(FruitError error) => switch(error) {
  WareHouseNotFoundError() => DashboardNoWareHouse(),
  NoFruitsFoundError() => DashboardStocksEmpty(),
};
DashboardState buildDashboardState(double price) => DashboardReady(price: price);

void computeDashboard(WarehouseId warehouseId) {
  getWareHouse(warehouseId)
    .map(getWareHouseStocks)
    .flatMap(getFruits)
    .chainEither(averagePrice)
    .map(addTva(0.2))
    .match(
      buildErrorState,
      buildDashboardState,
    );
}
```
```dart {5,15}
DashboardState buildErrorState(FruitError error) => switch(error) {
  WareHouseNotFoundError() => DashboardNoWareHouse(),
  NoFruitsFoundError() => DashboardStocksEmpty(),
};
DashboardState buildDashboardState(double price) => DashboardReady(price: price);

void computeDashboard(WarehouseId warehouseId) {
  getWareHouse(warehouseId)
    .map(getWareHouseStocks)
    .flatMap(getFruits)
    .chainEither(averagePrice)
    .map(addTva(0.2))
    .match(
      buildErrorState,
      buildDashboardState,
    );
}
```
```dart {all}
void computeDashboard(WarehouseId warehouseId) {
  getWareHouse(warehouseId)
    .map(getWareHouseStocks)
    .flatMap(getFruits)
    .chainEither(averagePrice)
    .map(addTva(0.2))
    .match(
      buildErrorState,
      buildDashboardState,
    )
    .map(emit);
}
```
```dart {all}
void computeDashboard(WarehouseId warehouseId) {
  getWareHouse(warehouseId)
    .map(getWareHouseStocks)
    .flatMap(getFruits)
    .chainEither(averagePrice)
    .map(addTva(0.2))
    .match(
      buildErrorState,
      buildDashboardState,
    )
    .map(emit)
    .run();
}
```
```dart {2}
void computeDashboard(WarehouseId warehouseId) {
  emit(DashboardLoading());  
  getWareHouse(warehouseId)
    .map(getWareHouseStocks)
    .flatMap(getFruits)
    .chainEither(averagePrice)
    .map(addTva(0.2))
    .match(
      buildErrorState,
      buildDashboardState,
    )
    .map(emit)
    .run();
}
```
```dart {12}
void computeDashboard(WarehouseId warehouseId) {
  emit(DashboardLoading());  
  getWareHouse(warehouseId)
    .map(getWareHouseStocks)
    .flatMap(getFruits)
    .chainEither(averagePrice)
    .map(addTva(0.2))
    .match(
      buildErrorState,
      buildDashboardState,
    )
    .withMinimalDelay(Duration(milliseconds: 150))
    .map(emit)
    .run();
}
```
```dart {1|1,5,6}
TaskEither<FruitError, WareHouse> Function() getCachedWareHouse(WarehouseId warehouseId) { ... }

void computeDashboard(WarehouseId warehouseId) {
  emit(DashboardLoading());  
  getWareHouse(warehouseId)
    .alt(getCachedWareHouse(warehouseId))
    .map(getWareHouseStocks)
    .flatMap(getFruits)
    .chainEither(averagePrice)
    .map(addTva(0.2))
    .match(
      buildErrorState,
      buildDashboardState,
    )
    .withMinimalDelay(Duration(milliseconds: 150))
    .map(emit)
    .run();
}
```

```dart {all}
void computeDashboard(WarehouseId warehouseId) {
  emit(DashboardLoading());  
  getWareHouse(warehouseId)
    .alt(getCachedWareHouse(warehouseId))
    .map(getWareHouseStocks)
    .flatMap(getFruits)
    .chainEither(averagePrice)
    .map(addTva(0.2))
    .match(
      buildErrorState,
      buildDashboardState,
    )
    .withMinimalDelay(Duration(milliseconds: 150))
    .map(emit)
    .run();
}
```
````
