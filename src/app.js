const http = require('http');

const PORT = process.env.PORT || 8080;
const PROJECT_ID = process.env.GCP_PROJECT_ID || 'portfolio-dev-local';

const server = http.createServer((req, res) => {
  if (req.url === '/health') {
    res.writeHead(200, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({
      status: 'UP',
      service: 'portfolio-backend',
      environment: PROJECT_ID,
      timestamp: new Date().toISOString()
    }));
  } else if (req.url === '/') {
    res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' });
    res.end(`
      <!DOCTYPE html>
      <html>
        <head>
          <title>Cloud Portfolio Backend</title>
          <style>
            body { font-family: system-ui, sans-serif; background: #0f172a; color: #f8fafc; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
            .card { background: #1e293b; padding: 2.5rem; border-radius: 12px; box-shadow: 0 10px 25px rgba(0,0,0,0.5); border: 1px solid #334155; text-align: center; }
            h1 { color: #38bdf8; margin-bottom: 0.5rem; }
            p { color: #94a3b8; font-size: 1.1rem; }
            .badge { background: #0284c7; color: white; padding: 0.4rem 0.8rem; border-radius: 6px; font-size: 0.9rem; font-weight: bold; }
          </style>
        </head>
        <body>
          <div class="card">
            <h1>☁️ Cloud-Native Microservice</h1>
            <p>Running on <strong>Kubernetes (GKE / Minikube)</strong></p>
            <p>GCP Project: <span class="badge">${PROJECT_ID}</span></p>
          </div>
        </body>
      </html>
    `);
  } else {
    res.writeHead(404, { 'Content-Type': 'text/plain' });
    res.end('404 Not Found');
  }
});

server.listen(PORT, () => {
  console.log(`Server executing on port ${PORT}`);
});