// Loop Controel with Break
var x = 1;
console.log("Entering the loop");

while (x < 20) {
   if (x == 5){
      break; // breaks out of loop completely
   }
   x = x + 1;
   console.log(x);
}
console.log("Exiting the loop!");

// Loop Controel with Continue
var x = 1;
console.log("Entering the loop");

while (x < 10){
   x = x + 1;

      if (x == 5){
         continue; // skill rest of the loop body
      }
      console.log(x);
   }
console.log("Exiting the loop!");
