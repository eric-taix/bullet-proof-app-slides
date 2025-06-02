---
layout: two-cols
class: text-left
---

::title::
## Fermeture des types

::default::

````md magic-move {lines: false}

```dart {all}
dynamic get(dynamic arg) { }
```
```dart {all}
dynamic get(dynamic arg) { }
get('foo');
get(1);
get(true);
```
```dart {all}
dynamic getWareHouse(dynamic warehouseId) { }
```
```dart {all}
dynamic getWareHouse(dynamic warehouseId) { }
getWareHouse('foo');
getWareHouse(supplierId);
getWareHouse(contactId);
```
```dart {all}
WareHouse getWareHouse(String warehouseId) { }

getWareHouse('foo');
getWareHouse(supplierId);
getWareHouse(contactId);
```
````
::right::

<div v-click>
````md magic-move {lines: false}
```json
{
    "id": "1234-ABCD",
    "name": "Warehouse 1",
    "address": {
        "street": "123 Main St",
        "city": "New York",
        "state": "NY",
        "zip": "12345"
    }
}
```
````
</div>

---
layout: default
class: text-left
---


## Fermeture des types


````md magic-move {lines: false}

```dart {all}
WareHouse getWareHouse(String warehouseId) { }
```
```dart {all}
WareHouse getWareHouse(WarehouseId warehouseId) { }
```
```dart {all}
WareHouse getWareHouse(WarehouseId warehouseId) { }

getWareHouse('foo'); // Don't compile
getWareHouse(supplierId); // Don't compile
getWareHouse(contactId); // Don't compile

final WarehouseId id = WarehouseId('1234-ABCD');
getWareHouse(id);
```
```dart {all}


WareHouse getWareHouse(WarehouseId warehouseId) { }
```
```dart {all}
extension type WarehouseId(String value) {}

WareHouse getWareHouse(WarehouseId warehouseId) { }
```
```dart {all}
extension type WarehouseId(String value) {}

WareHouse getWareHouse(WarehouseId id) { }
```
```dart {all}
extension type WarehouseId(String value) {}

WareHouse get(WarehouseId id) { }
```
````
