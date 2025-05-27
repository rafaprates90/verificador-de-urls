from fastapi import FastAPI, Header, HTTPException
from pydantic import BaseModel
from playwright.sync_api import sync_playwright
from datetime import datetime
import os

app = FastAPI()

API_KEY = "sua-chave-secreta"  # Defina sua chave API

class URLRequest(BaseModel):
    url: str
    buscador: str

@app.post("/check-url/")
def check_url(data: URLRequest, x_api_key: str = Header(...)):
    if x_api_key != API_KEY:
        raise HTTPException(status_code=401, detail="Chave API inválida")

    url = data.url
    buscador = data.buscador.lower()

    with sync_playwright() as p:
        browser = p.chromium.launch()
        page = browser.new_page()

        if buscador == "yahoo":
            search_url = f"https://br.search.yahoo.com/search?p=url:{url}"
        elif buscador == "bing":
            search_url = f"https://www.bing.com/search?q=url:{url}"
        else:
            raise HTTPException(status_code=400, detail="Buscador inválido. Use Yahoo ou Bing.")

        page.goto(search_url)
        page.wait_for_timeout(3000)

        screenshots_dir = "screenshots"
        os.makedirs(screenshots_dir, exist_ok=True)

        screenshot_filename = f"screenshot_{buscador}_{datetime.now().strftime('%Y%m%d%H%M%S')}.png"
        screenshot_path = os.path.join(screenshots_dir, screenshot_filename)
        page.screenshot(path=screenshot_path, full_page=True)

        content = page.content()
        encontrada = url in content

        browser.close()

    resultado = {
        "url": url,
        "search_status": "Localizada no buscador" if encontrada else "Não localizada no buscador",
        "screenshot": f"https://SEU_DOMINIO/screenshots/{screenshot_filename}",
        "buscador": buscador.capitalize(),
        "data_hora": datetime.now().strftime("%d/%m/%Y %H:%M")
    }

    return resultado
