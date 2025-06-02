---
layout: default
---

## Synthèse

<v-switch>
  <template #1> <img src="/assets/stick-full-left.png"></template>
  <template #2> <img src="/assets/stick-full-right.png"></template>
  <template #3> <img src="/assets/stick-full.png"></template>
</v-switch>


---
layout: default
class: text-center
---

<v-switch>
  <template #1> <img src="/assets/safe1.png" width="60%"></template>
  <template #2> <img src="/assets/safe2.png" width="60%"></template>
  <template #3> <img src="/assets/safe3.png" width="60%"></template>
  <template #4> <img src="/assets/safe4.png" width="60%"></template>
  <template #5> <img src="/assets/safe5.png" width="60%"></template>
  <template #6> <img src="/assets/safe6.png" width="60%"></template>
  <template #7> <img src="/assets/safe7.png" width="60%"></template>
  <template #8> <img src="/assets/safe8.png" width="60%"></template>
  <template #9> <img src="/assets/safe9.png" width="60%"></template>
  <template #10> <img src="/assets/safe10.png" width="60%"></template>
  <template #11> <img src="/assets/safe11.png" width="60%"></template>
</v-switch>

---
layout: default
class: text-center
---

<br/>
<br/>
````md magic-move {lines: true}

```dart
final double willNeverHappen = 'Hello DigitRE';
```
````

---
layout: default
class: text-center
---

````md magic-move {lines: true}


```dart
TaskEither<Error, List<Model> myFunction(Param param) { 
    ... 
}
```

```dart
Reader<C, TaskEither<L, R>> prepareRequest<C extends HttpCallContext, L, R>(
  R Function(C callContext) doPrepare,
) {
  return Reader<C, TaskEither<L, R>>((C callContext) {
    return Either<L, R>.tryCatch(
      () => doPrepare(callContext),
      logError('Error while mapping to DTO in ${callContext.methodName}'),
    ).toTaskEither();
  });
}
```
````

---
layout: two-cols
class: text-center
---

::default::
<img src="/assets/stick-left.png" width="100%">

::right::

## <div v-click>+ Moins de bugs</div>
## <div v-click>+ Review facilitée</div>
## <div v-click>+ Réutilisable</div>
## <div v-click>+ Testable</div>
## <div v-click>- Apprentissage</div>
## <div v-click>- Complexe</div>
<br/>

### <div v-click>"chi va piano, va sano <br/> e va lontano"</div>

---
layout: default
class: text-center
---

<br/>
<br/>
<br/>

# MERCI !

<img src="/assets/code-barre.png" style="display:block; margin:auto" width="200" />