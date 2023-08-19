export class Drug {
  constructor(name, expiresIn, benefit) {
    this.name = name;
    this.expiresIn = expiresIn;
    this.benefit = benefit;
  }
}

export class Pharmacy {
  constructor(drugs = []) {
    this.drugs = drugs;
  }

  /**
   * @description Update all drug values every time it's called.
   * @returns Drugs[]
   */
  updateBenefitValue() {
    for (let i = 0; i < this.drugs.length; i++) {
      const drug = this.drugs[i];

      if (drug.name === "Magic Pill") {
        continue;
      }

      if (drug.name === "Herbal Tea") {
        drug.benefit = Math.min(
          50,
          drug.benefit + (drug.expiresIn <= 0 ? 2 : 1)
        );
      } else if (drug.name === "Fervex") {
        if (drug.expiresIn <= 0) {
          drug.benefit = 0;
        } else if (drug.expiresIn <= 5) {
          drug.benefit = Math.min(50, drug.benefit + 3);
        } else if (drug.expiresIn <= 10) {
          drug.benefit = Math.min(50, drug.benefit + 2);
        }
      } else if (drug.name === "Dafalgan") {
        drug.benefit = Math.max(
          0,
          drug.benefit - (drug.expiresIn <= 0 ? 4 : 2)
        );
      } else {
        drug.benefit = Math.max(
          0,
          drug.benefit - (drug.expiresIn <= 0 ? 2 : 1)
        );
      }

      if (drug.name !== "Magic Pill") {
        drug.expiresIn--;
      }
    }

    return this.drugs;
  }
}
