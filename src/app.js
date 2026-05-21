function getStatus() {
  return {
    app: "Practica 7 CI/CD",
    author: "solerdiaz",
    status: "ok"
  };
}

function sum(a, b) {
  return a + b;
}

module.exports = {
  getStatus,
  sum
};
