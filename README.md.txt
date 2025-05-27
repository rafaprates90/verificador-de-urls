# 🔗 Verificador de URLs Jurídico

API desenvolvida para validação pública de URLs utilizando busca no Yahoo Search ou Bing, consulta de indexação via IndexNow e checagem de status HTTP.  
Inclui geração de prints da busca e relatórios em PDF, Excel, CSV e JSON.

---

## 🚀 Funcionalidades

- ✅ Verifica se uma URL está **listada no Yahoo Search ou Bing**.
- ✅ Checa se a URL está **indexada via IndexNow**.
- ✅ Faz verificação de **status HTTP** (200, 404, etc.).
- ✅ Captura **screenshot** da busca no buscador escolhido.
- ✅ Gera **relatórios profissionais** em PDF, Excel, CSV e JSON.

---

## 📂 Estrutura dos Arquivos

/verificador-de-urls
├── capture_search.py # Captura resultados do buscador
├── check_http.py # Verifica status HTTP
├── indexnow_check.py # Consulta IndexNow
├── generate_report.py # Gera relatórios
├── main.py # API principal (FastAPI)
├── requirements.txt # Dependências
├── Dockerfile # Arquivo Docker para deploy
└── README.md # Este arquivo


---

## ⚙️ Instalação Local

1. Clone o repositório:
```bash
git clone https://github.com/seu-usuario/verificador-de-urls.git
cd verificador-de-urls

    Instale dependências:

pip install -r requirements.txt
playwright install

    Execute:

uvicorn main:app --reload

    Acesse a API:

http://localhost:8000/docs

🐳 Deploy com Docker

docker build -t verificador-url .
docker run -d -p 8000:8000 verificador-url

Acesse:

http://localhost:8000/docs

🚀 Deploy no Railway

    Crie um projeto no https://railway.app

    Escolha Deploy from GitHub Repo.

    Railway detectará automaticamente o Dockerfile.

    Clique em Settings → Domain → Generate Domain.

    Sua API ficará acessível em algo como:

https://verificador-url.up.railway.app

🔥 Exemplo de Uso
🔗 Endpoint:

POST /check-url/

Corpo da requisição:

{
  "url": "https://www.siteexemplo.com",
  "buscador": "Yahoo"
}

Resposta:

{
  "url": "https://www.siteexemplo.com",
  "http_status": 200,
  "indexnow_status": 200,
  "search_status": "Listado no buscador",
  "screenshot": "screenshot.png",
  "data_hora": "23/05/2025 18:00"
}

🧠 Observações

    A API do IndexNow requer configuração da chave (key.txt) no domínio próprio. Este projeto usa uma simulação de verificação, que pode ser estendida conforme necessidade.

🤝 Licença

Este projeto é livre para uso e customização.