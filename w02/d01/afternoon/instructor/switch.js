var lunch = prompt("What do you want for lunch?", "Type your lunch choice here");

  switch(lunch){
    case 'sandwich':
      console.log("Sure thing! One sandwich, coming right up.");
      break;
    case 'soup':
      console.log("Got it! Tomato's my favorite.");
      break;
    case 'salad':
      console.log("Sounds good! How about a caesar salad?");
      break;
    case 'pie':
      console.log("Pie's not a meal!");
      break;
    default:
      console.log("What! You can't eat " + lunch + " for lunch! Try again!");
  }
