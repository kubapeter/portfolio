<a href="../">
  <img src="/img/Object-Oriented_Python_Inheritance_and_Encapsulation_logo.avif" width="120" align="right">
</a>

# Week 3 <br> Polymorphism

## Learning Objectives
- Define polymorphism
- Explain how method overriding is an example of polymorphism
- Overload a method
- Overload an operator
- Define duck typing

## [Coding practice challenge](./lab_challenge.py)


>"**Problem**
>
>\[... T\]he class `Chef` is already defined. Modify the `compare` method so that it uses operator overloading to compare two chefs and determine who has more Michelin stars. You can use either the `>` or `<` operators for your overloading.
>
>**Expected Output**
>
>Instantiate the following `Chef` objects:
```python
    marco = Chef('Marco Pierre White', 'French, British', 3)
    rene = Chef('Rene Redzepi', 'Nordic', 2)
```
> Calling the `display` method for each object should return the following text:
> 
>| Method Call           | Return Value                                                   | 
>|-----------------------|----------------------------------------------------------------|
>| `marco.compare(rene)` | ‘Marco Pierre White has more Michelin stars than Rene Redzepi’ | 
>| `rene.compare(marco)` | ‘Marco Pierre White has more Michelin stars than Rene Redzepi’ | 

