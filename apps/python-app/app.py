from flask import Flask
app = Flask(__name__)

@app.route('/')
def home():
    return '''
    <!DOCTYPE html>
    <html>
    <head>
        <title>Python App - Nebula PaaS</title>
        <style>
            body { font-family: Arial, sans-serif; margin: 40px; }
            .container { max-width: 800px; margin: auto; }
            h1 { color: #3498db; }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>🚀 Python App Funcionando</h1>
            <p>Desplegada en <strong>Nebula PaaS</strong> con Docker</p>
            <p><strong>Estado:</strong> 🟢 Operativa</p>
        </div>
    </body>
    </html>
'''

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
