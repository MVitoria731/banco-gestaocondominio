from fastapi import APIRouter, HTTPException
from db import get_connection
from models_cond import Morador
from typing import List, Optional

router = APIRouter()
@router.get("/moradores", response_model=List[Morador])
async def listar_moradores():
    conn = get_connection()
    cur = conn.cursor()

    cur.execute("SELECT nome, email, bloco, numero_apartamento, data_entrada, data_saida FROM Moradores")
    rows = cur.fetchall()
    cur.close()
    conn.close()
    return [
        Morador(
            nome=r[0], email=r[1], bloco=r[2], numero_apartamento=r[3], data_entrada=r[4], data_saida = [5]
        ).dict()
        for r in rows
    ]

@router.get("/morador/{cpf_morador}", response_model= List[Morador])
async def listar_morador(cpf_morador: str):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT nome, email, bloco, numero_apartamento, data_entrada, data_saida FROM Moradores WHERE cpf_morador = %s", (cpf_morador,))
    row = cur.fetchone()
    cur.close()
    conn.close()
    if row:
        return Morador(
            nome = row[0], email = row[1], bloco = row[2], numero_apartamento = row[3], data_entrada = row[4], data_saida = row[5]
        )
    raise HTTPException(404, "Morador não encontrado")

@router.get("/morador", response_model= List[Morador])
async def listar_moradores_ativos():
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT nome, email, bloco, numero_apartamento, data_entrada FROM Moradores_atuais")
    rows = cur.fetchall()
    cur.close()
    conn.close()
    return [
        Morador(
            nome=d[0], email=d[1], bloco=d[2], numero_apartamento=d[3], data_entrada = d[4]
        ) for d in rows
    ]

@router.post("/morador")
async def criar_morador(m: Morador):
    conn = get_connection()
    cur = conn.cursor()
    try:
        cur.execute("INSERT INTO Morador (cpf_morador) VALUES (%s)", (m.cpf_morador,))
        conn.commit()
    except Exception as e:
        conn.rollback()
        raise HTTPException(400, f"Erro ao adicionar um morador: {e}")
    finally:
        cur.close()
        conn.close()
    return {"msg": "Morador adicionado com sucesso"}

@router.delete("/morador/{cpf_morador}")
async def deletar_morador(cpf_morador: str):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("DELETE FROM Morador WHERE cpf_morador = %s", (cpf_morador,))
    conn.commit()
    cur.close()
    conn.close()
    return {"msg": "Morador excluído"}
