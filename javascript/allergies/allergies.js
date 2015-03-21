function Allergies(allergySum) {
  this.allergySum = allergySum;
};

Allergies.prototype.list = function() {
  var allergies = [];

  switch (this.allergySum) {
    case 1:
      allergies.push("eggs");
      break;
    case 2:
      allergies.push("peanuts");
      break;
    case 8:
      allergies.push("strawberries");
      break;
  }

  this.find_allergies();
  return allergies;
};

Allergies.prototype.find_allergies = function() {
  var allergies = {
    1: "eggs",
    2: "peanuts",
    4: "shellfish",
    8: "strawberries",
    16: "tomatoes",
    32: "chocolate",
    64: "pollen",
    128: "cats"
  };

  var permutation = function() {
    Object.keys(allergies).forEach(function(key) {
      //put permutation code here
    });
  };

  permutation();
};

module.exports = Allergies
