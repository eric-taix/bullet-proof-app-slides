---
layout: default
class: text-left
---

# Immutabilité


<v-clicks>

````md magic-move {lines: true}
```dart {all}
const String hello = 'Hello';
```
```dart {all}
const String hello = 'Hello';

class WareHouse {
    WareHouse(this.name);
    final String name;
}
```
```dart {all}
const String hello = 'Hello';

class WareHouse {
    WareHouse(this.name);
    final String name;

    WareHouse changeName(String name) => WareHouse(name);
}
```
```dart {all}
class WareHouse {
    WareHouse(this.name, this.phones);
    final String name;
    final List<String> phones;

    WareHouse changeName(String name) => copyWith(name: name);

    WareHouse addPhone(String phone) => copyWith(phones: phones..add(phone));

    WareHouse copyWith({String? name, List<String>? phones}) => 
      WareHouse(name ?? this.name, phones ?? this.phones);  
}
```
````

</v-clicks>

<br/>

##### <div v-click>=> Immutable Collections (fast_immutable_collections / built_collections)</div>

