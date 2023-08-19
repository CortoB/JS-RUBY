import { describe, it } from "node:test";
import assert from "node:assert";
import { Drug, Pharmacy } from "./pharmacy.js";

describe("Pharmacy", () => {
  it("should decrease the benefit and expiresIn for normal drug", () => {
    assert.deepEqual(
      new Pharmacy([new Drug("test", 2, 3)]).updateBenefitValue(),
      [new Drug("test", 1, 2)]
    );
  });

  it("should decrease the benefit and expiresIn for Dafalgan", () => {
    assert.deepEqual(
      new Pharmacy([new Drug("Dafalgan", 2, 5)]).updateBenefitValue(),
      [new Drug("Dafalgan", 1, 3)]
    );
  });
});
