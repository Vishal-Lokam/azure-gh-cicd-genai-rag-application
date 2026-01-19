from fastapi import FastAPI
from fastapi.responses import JSONResponse
from fastapi import status

app = FastAPI()


# TODO: Add API endpoints
@app.get("/health")
async def get_health():
    return JSONResponse(content="Health ok!", status_code=status.HTTP_200_OK)
