from fastapi import APIRouter, HTTPException
from db import get_connection
from models_cond import Pessoa, PessoaUpdate


router = APIRouter()
@router.get("/pessoas")
async def listar_pessoas():
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT nome, email FROM Pessoa")
    rows = cur.fetchall()
    cur.close()
    conn.close()
    return [
        Pessoa(
            nome = r[0], email=r[1]
        ).dict()
        for r in rows
    ]

@router.get("/pessoa/{cpf}")
async def get_pessoas(cpf: str):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT nome, email FROM Funcionario WHERE cpf= %s", (cpf))
    row = cur.fetchone()
    cur.close()
    conn.close()
    if row:
        return Pessoa(
            nome=row[0], email=row[1]
        ).dict()
    raise HTTPException(404, "Pessoa não encontrada")

@router.post("/pessoa")
async def criar_pessoa(p: Pessoa):
    conn = get_connection()
    cur = conn.cursor()
    try:
        cur.execute(
            "INSERT INTO pessoa (cpf, nome, email) VALUES (%s, %s, %s)",
            (
                p.cpf, p.nome, p.email
            )
        )
        conn.commit()
    except Exception as e:
        conn.rollback()
        raise HTTPException(400, f"Erro ao adicionar uma pessoa: {e}")
    finally:
        cur.close()
        conn.close()
    return {"msg": "Pessoa adicionada com sucesso"}

@router.put("/pessoa/{cpf}")
async def atualizar_pessoa(cpf: str, p: Pessoa):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT cpf FROM Pessoa WHERE cpf = %s", (cpf))
    if not cur.fetchone():
        cur.close()
        conn.close()
        raise HTTPException(404, "Pessoa não encontrada")
    try:
        cur.execute(
            """UPDATE pessoa SET nome = %s, email = %s
            WHERE cpf = %s""",
            (
                p.nome, p.email
            )
        )
        conn.commit()
    except Exception as e:
        conn.rollback()
        raise HTTPException((400, f"Erro ao atualizar: {e}"))
    finally:
        cur.close()
        conn.close()
    return {"msg": "Pessoa atualizada com sucesso"}

router.patch("/pessoa/{cpf}")
async def atualizar_pessoa_parcial(cpf: str, p: PessoaUpdate):
    conn = get_connection()
    cur = conn.cursor()

    cur.execute("SELECT cpf FROM Pessoa WHERE cpf = %s", (cpf))
    if not cur.fetchone():
        cur.close()
        conn.close()
        raise HTTPException(404, "Pessoa não encontrada")
    
    campos = []
    valores = []
    for campo, valor in p.dict(exclude_unset = True).items():
        campos.append(f"{campo}= %s")
        valores.append(valor)

    if not campos:
        cur.close()
        conn.close()
        raise HTTPException(400, "Nenhum campo informado para atualização")
    
    valores.append(cpf)
    query = f"UPDATE Pessoa SET {','.join(campos)} WHERE cpf = %s"

    try:
        cur.execute(query, tuple(valores))
        conn.commit()

    except Exception as e:
        conn.rollback()
        raise HTTPException(400, f"Erro ao atualizar: {e}")
    finally:
        cur.close()
        conn.close()
    return {"msg": "Pessoa atualizada com sucesso"}

@router.delete("/pessoa/{cpf}")
async def deletar_pessoa(cpf: str):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("DELETE FROM Pessoa WHERE cpf = %s", (cpf))
    conn.commit()
    cur.close()
    conn.close()
    return {"msg": "Pessoa excluida"}