from fastapi import APIRouter, HTTPException
from db import get_connection
from models_cond import Funcionario, FuncionarioUpdate
from typing import List, Optional

router = APIRouter()

@router.get("/funcionario")
async def listar_funcionarios():
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT cpf_funcionario, cargo, salario, data_admissao FROM Funcionario")
    rows = cur.fetchall()
    cur.close()
    conn.close()
    return [
        Funcionario(
            cpf_funcionario=r[0], cargo=r[1], salario=r[2], data_admissao=r[3]
        ).dict()
        for r in rows
    ]

@router.get("/funcionario_ativos")
async def listar_funcionarios_atuais():
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT nome, email, cargo, data_admissao FROM Funcionarios_Ativos")
    rows = cur.fetchall()
    cur.close()
    conn.close()
    return [
        Funcionario(
            nome = r[0], email = r[1], cargo = r[2], data_admissao = r[3]
        ).dict()
        for r in rows
    ]

@router.get("/funcionario/{cpf_funcionario}")
async def get_funcionario(cpf_funcionario: str):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT cpf_funcionario, cargo, salario, data_admissao FROM Funcionario WHERE cpf_funcionario = %s", (cpf_funcionario,))
    row = cur.fetchone()
    cur.close()
    conn.close()
    if row:
        return Funcionario(
            cpf_funcionario=row[0], cargo=row[1], salario=row[2], data_admissao=row[3]
        ).dict()
    raise HTTPException(404, "Funcionário não encontrado")
    
@router.post("/funcionario")
async def criar_funcionario(f: Funcionario):
    conn = get_connection()
    cur = conn.cursor()
    try:
        cur.execute(
            "INSERT INTO Funcionario (cpf_funcionario, cargo, salario, data_admissao) VALUES (%s, %s, %s, %s)",
            (f.cpf_funcionario, f.cargo, f.salario, f.data_admissao)
        )
        conn.commit()
    except Exception as e:
        conn.rollback()
        raise HTTPException(400, f"Erro ao adicionar um funcionário: {e}")
    finally:
        cur.close()
        conn.close()
    return {"msg": "Funcionário adicionado com sucesso"}

@router.put("/funcionario/{cpf_funcionario}")
async def atualizar_funcionario(cpf_funcionario: str, f: Funcionario):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT cpf_funcionario FROM Funcionario WHERE cpf_funcionario = %s", (cpf_funcionario,))
    if not cur.fetchone():
        cur.close()
        conn.close()
        raise HTTPException(404, "Funcionário não encontrado")
    try:
        cur.execute(
            """UPDATE Funcionario SET cargo = %s, salario = %s, data_admissao = %s WHERE cpf_funcionario = %s""",
            (f.cargo, f.salario, f.data_admissao, cpf_funcionario)
        )
        conn.commit()
    except Exception as e:
        conn.rollback()
        raise HTTPException(400, f"Erro ao atualizar: {e}")
    finally:
        cur.close()
        conn.close()
    return {"msg": "Funcionário atualizado com sucesso"}

@router.delete("/funcionario/{cpf_funcionario}")
async def deletar_funcionario(cpf_funcionario: str):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("DELETE FROM Funcionario WHERE cpf_funcionario = %s", (cpf_funcionario,))
    conn.commit()
    cur.close()
    conn.close()
    return {"msg": "Funcionário excluído"}
