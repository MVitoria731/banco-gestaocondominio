from fastapi import FastAPI

from crud_pessoa import router as pessoa_router
from entrega_router import router as entrega_router
from morador_unidade_router import router as morador_unidade_router
from funcionario_router import router as funcionario_router
from morador_router import router as morador_router
from telefone_pessoa_router import router as telefone_pessoa_router

app = FastAPI(
    title = "API Condominio",
    version = "1.0"
)

app.include_router(pessoa_router, prefix="/pessoas", tags=["Pessoas"])
app.include_router(entrega_router, prefix="/entregas", tags='Entregas')
app.include_router(morador_unidade_router, prefix="/morador_unidade", tags=["Morador_Unidade"])
app.include_router(funcionario_router, prefix="/funcionarios", tags=["Funcionários"])
app.include_router(morador_router, prefix="/moradores", tags=["Moradores"])
app.include_router(telefone_pessoa_router, prefix="/telefone", tags=["Telefones"])