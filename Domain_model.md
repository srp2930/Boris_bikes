# From User Stories to a Domain Model

## Organised classes and methods

Objects | Messages
------- | -------------
Person  | take_bike
Bike    | working?
Dock    | release(bike), load(bikes)


## Diagram of communication 

**Person** -> *take_bike* -> return bike to person

**Bike** -> *working?* -> return true/false

**Dock** -> *release(bike)* -> return a bike

**Dock** -> *load(bikes)* -> adds bike to dock, return number of bikes in dock
