import Char "mo:base/Char";
import Func "mo:base/Func";

import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Array "mo:base/Array";
import Iter "mo:base/Iter";

actor {
  // Function to calculate life path number
  func calculateLifePathNumber(dateOfBirth: Text) : Nat {
    let digits = Iter.toArray(Text.toIter(dateOfBirth));
    let sum = Array.foldLeft<Char, Nat>(digits, 0, func (acc, digit) {
      acc + (switch (digit) {
        case ('0') 0;
        case ('1') 1;
        case ('2') 2;
        case ('3') 3;
        case ('4') 4;
        case ('5') 5;
        case ('6') 6;
        case ('7') 7;
        case ('8') 8;
        case ('9') 9;
        case (_) 0;
      })
    });

    var lifePath = sum;
    while (lifePath > 9) {
      lifePath := (lifePath / 10) + (lifePath % 10);
    };

    lifePath
  };

  // Store interpretations for each life path number
  let interpretations = [
    "1: You are a natural born leader with strong independence.",
    "2: You are diplomatic and peacemaking, with a focus on relationships.",
    "3: You are creative, expressive, and optimistic.",
    "4: You are practical, hardworking, and value stability.",
    "5: You are adventurous, versatile, and love freedom.",
    "6: You are responsible, caring, and focus on home and family.",
    "7: You are analytical, introspective, and spiritual.",
    "8: You are ambitious, goal-oriented, and business-minded.",
    "9: You are compassionate, selfless, and humanitarian."
  ];

  // Public query function to get numerology reading
  public query func getNumerologyReading(name: Text, dateOfBirth: Text) : async Text {
    let lifePathNumber = calculateLifePathNumber(dateOfBirth);
    let interpretation = interpretations[lifePathNumber - 1];
    "Hello " # name # "! Your Life Path Number is " # Int.toText(lifePathNumber) # ". " # interpretation
  };
};
