from fastapi import APIRouter, HTTPException
from db import get_connection
from models_cond import Entrega, EntregaUpdate
from typing import List

router = APIRouter()
@router.get("/Entrega", response_model=List[Entrega])
async def listar_entregas_pendentes():
    conn = get_connection()
    cur = conn.cursor()
    try:
        cur.execute(
            "SELECT nome, data_recebimento FROM Entregas_Pendentes"
        )
        rows = cur.fetchall()
        cur.close()
        conn.close()
        
        return [
            Entrega(
                nome=e[0], data_recebimento=e[1]
            ) for e in rows
        ]
    except Exception as e:
        cur.close()
        conn.close()
        raise HTTPException(400, "Erro ao listar entregas pendentes")

@router.get("/entrega", response_model= List[Entrega])
async def listar_entregas():
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT cpf_morador, cpf_funcionario, data_recebimento, data_retirada FROM Entregas")
    rows = cur.fetchall()
    cur.close()
    conn.close()
    return [
        Entrega(
            cpf_morador = e[0], cpf_funcionario = e[1], data_recebimento = e[2], data_retirada = e[3]
        ) for e in rows
    ]

@router.get("/entrega/{id_entrega}", response_model= Entrega)
async def get_entrega(id_entrega: int):
    conn= get_connection()
    cur = conn.cursor()
    cur.execute("SELECT cpf_morador, cpf_funcionario, data_recebimento, data_retirada FROM Entregas WHERE id_entrega=%s", (id_entrega))
    row = cur.fetchone()
    cur.close()
    conn.close()
    if row:
        return Entrega(cpf_morador=row[0], cpf_funcionario=row[1], data_recebimento=row[2], data_retirada=row[3])
    raise HTTPException(404, "Entrega não encontrada/inexistente")

@router.patch("/entrega/{id_entrega}")
async def atualizar_entregas(id_entrega: int, ent: EntregaUpdate):

    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT id_entrega FROM entrega WHERE id_entrega = %s", (id_entrega))
    if not cur.fetchone():
        cur.close()
        conn.close()
        raise HTTPException(404, "Entrega não encontrada ou inexistente")
    fields = []
    values = []
    for campo, valor in ent.dict(exclude_unset= True).items():
        fields.append(f"{campo}=%s")
        values.append(valor)
    if not fields:
        cur.close()
        conn.close()
        raise HTTPException(400, "Nenhum campo foi informado para atualizar")
    values.append(id_entrega)
    try:
        cur.execute(f"UPDATE entrega SET {', '.join(fields)} WHERE id_entrega = %s", values)
        conn.commit()
    except Exception as e:
        conn.rollback()
        raise HTTPException(400, "Erro ao atualizar: {e}")
    finally:
        cur.close()
        conn.close()
    return {"msg": "Entrega foi atualizado com sucesso"}

@router.post("/entrega")
async def criar_entrega(e: Entrega):
    conn = get_connection()
    cur = conn.cursor()
    try:
        cur.execute(
            "INSERT INTO Entrega (cpf_morador, cpf_funcionario, data_recebimento, data_retirada, status) VALUES (%s, %s, %s, %s, %s)",
            (e.cpf_morador, e.cpf_funcionario, e.data_recebimento, e.data_retirada, e.status)
        )
        conn.commit()
    except Exception as e:
        conn.rollback()
        raise HTTPException(400, f"Erro ao adicionar uma entrega: {e}")
    finally:
        cur.close()
        conn.close()
    return {"msg": "Entrega adicionada com sucesso"}


@router.delete("/entrega/{id_entrega}")
async def deletar_entrega(id_entrega: int):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("DELETE FROM entrega WHERE id_entrega = %s", (id_entrega))
    conn.commit()
    cur.close()
    conn.close()
    return {"msg": "Entrega excluída com sucesso"}