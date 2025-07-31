from fastapi import APIRouter, HTTPException
from db import get_connection
from models_cond import Morador_Unidade, Morador_UnidadeUpdate
from typing import List

router = APIRouter()

@router.get("/morador_unidade", response_model=List[Morador_Unidade])
async def listar_unidades_desocupadas():
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT bloco, numero_apartamento from Unidade_desocupada")
    row = cur.fetchone()
    cur.close()
    conn.close()
    if row:
        return [
            Morador_Unidade(
                bloco=row[0], numero_apartamento=row[1]
            ).dict()
        ]


@router.get("/morador_unidade/{id_unidade}", response_model= Morador_Unidade)
async def get_unidade_ocupadas(id_unidade: int):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT u.bloco, u.numero_apartamento, p.nome FROM morador_unidade mu JOIN Pessoa p ON mu.cpf_morador = p.cpf JOIN Unidade u ON mu.id_unidade = u.id_unidade WHERE data_saida is null", (id_unidade))
    row = cur.fetchone()
    cur.close()
    conn.close()
    if row:
        return Morador_Unidade(bloco = row[0], numero_apartamento = row[1], nome = row[2])
    raise HTTPException(404, "Unidade não encontrada ou não está ocupada")

