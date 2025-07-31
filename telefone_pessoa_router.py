from fastapi import APIRouter, HTTPException
from db import get_connection
from models_cond import Telefones, TelefonesUpdate
from typing import List, Optional

router = APIRouter()

@router.get("/telefones", response_model = List[Telefones])
async def listar_telefones():
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT * from Telefone_Pessoas")
    cur.close()
    conn.close()
    
@router.get("/telefones/{id_telefone}", response_model = Telefones)
async def get_telefone(id_telefone: int):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT p.nome, t.numero, t.tipo FROM telefones t JOIN Pessoa p ON t.cpf_pessoa = p.cpf WHERE id_telefone = %s", (id_telefone))
    row = cur.fetchone()
    cur.close()
    conn.close()
    if row:
        return Telefones(
            nome= row[0], numero =row[1], tipo=row[2]
        ).dict()
    raise HTTPException(404, 'Telefone não encontrado')