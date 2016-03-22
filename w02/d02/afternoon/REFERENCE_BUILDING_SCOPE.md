## Building Scope

Let's see how scope works. Here's the code we'll work with:

```javascript
var firstName = 'John'; // 1
var lastName = 'Dowd'; // 2
var age = 19; // 3

function displayPerson(fname, lname){ //4, 5
  var prefix = 'Mr'; // 6
  var fullName = null; // 6

  function getFullName(){ // 7
    var suffix = "Esq.";  // (Esquire) Everybody's a lawyer, eh.
    return  fullName = prefix + " " + fname + " " + lname + " " + suffix;
  };

  return getFullName();
};

function removeYears(){ // 8
  var minusYears = 10, age = 49;
  return age - minusYears;
};

console.log(displayPerson(firstName, lastName));
console.log(removeYears());

```

1. Found `var firstName` variable declaration.  
Put firstName variable in Global Scope.  
2. Found `var lastName` variable declaration.  
Put lastName in Global Scope.  
3. Found `var age` variable declaration.  
Put age in Global Scope.  
4. Found `displayPerson` declaration.  
Put age in displayPerson in Global Scope.

  - Notice that displayPerson's value is a function. So, create an inner scope and process this function.

5. Found the `fname` and `lname` declarations.

   > Note: functions arguments behave just like local variables.  Put them in the displayPerson function scope.  

6. Found `prefix`, `fullName` variable declarations.  
Put them in the displayPerson function scope.  
7. Found `getFullName` declaration.  
Put getFullName in the displayPerson function scope.

 - Notice that getFullName is a function. So, create an inner scope and  process this function.
 - All done with getFullName function, no more variable declarations.
 - All done with displayPerson function, no more variable declarations.<br><br>
![Scope](https://i.imgur.com/Ex9a0qB.png)<br><br>
8. Found `removeYears` variable declaration.
Put removeYears in Global scope.  
**Notice that removeYears value is a function. So, create an inner scope and process this function.**
9. Found `age` and `minusYears` variable declarations.  
Put these in the function's scope.<br><br>
![Final](https://i.imgur.com/cA6kaw5.png)
