const http = require("http");
const { getStatus } = require("./app");

const port = process.env.PORT || 3000;

const server = http.createServer((req, res) => {
  if (req.url === "/health") {
    res.writeHead(200, { "Content-Type": "application/json" });
    res.end(JSON.stringify(getStatus()));
    return;
  }

  res.writeHead(200, { "Content-Type": "text/plain" });
  res.end("Practica 7 CI/CD - solerdiaz\n");
});

server.listen(port, () => {
  console.log(`Servidor iniciado en puerto ${port}`);
});
