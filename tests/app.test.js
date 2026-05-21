const assert = require("assert");
const { getStatus, sum } = require("../src/app");

describe("Aplicacion practica 7", function () {
  it("debe devolver estado ok", function () {
    const status = getStatus();

    assert.strictEqual(status.status, "ok");
    assert.strictEqual(status.author, "solerdiaz");
  });

  it("debe sumar dos numeros", function () {
    assert.strictEqual(sum(2, 3), 5);
  });
});
