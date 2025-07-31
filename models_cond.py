from pydantic import BaseModel
from typing import Optional
from datetime import date, datetime, time

class Pessoa(BaseModel):
    cpf: str
    nome: str
    email: str

class PessoaUpdate(BaseModel):
    nome: str
    email: str

class Telefones(BaseModel):
    id_telefone: int
    cpf_pessoa: str
    numero: str
    tipo: str

class TelefonesUpdate(BaseModel):
    numero: str
    tipo: str

class Administrador(BaseModel):
    cpf_adm: str

class Morador(BaseModel):
    cpf_morador: str

class Funcionario(BaseModel):
    cpf_funcionario: str
    cargo: str
    salario: float
    data_admissao: date
    data_demissao: Optional[date] = None

class FuncionarioUpdate(BaseModel):
    cargo: str
    salario: float
    data_admissao: date
    data_demissao: Optional[date] = None

class Terceirizado(BaseModel):
    cpf_terceirizado: str
    empresa: str
    servico_prestado: str
    data_inicio: date
    data_termino: Optional[date] = None

class TerceirizadoUpdate(BaseModel):
    servico_prestado: str
    data_inicio: date
    data_termino: Optional[date] = None

class Unidade(BaseModel):
    id_unidade: int
    bloco: str
    numero_apartamento: str

class Morador_Unidade(BaseModel):
    cpf_morador: str
    id_unidade: int
    data_entrada: date
    data_saida: Optional[date] = None

class Morador_UnidadeUpdate(BaseModel):
    cpf_morador: str
    id_unidade: int
    data_entrada: date
    data_saida: Optional[date] = None

class Entrega(BaseModel):
    id_entrega: int
    cpf_morador: str
    cpf_funcionario: str
    data_recebimento: datetime
    data_retirada: Optional[datetime] = None
    status: str

class EntregaUpdate(BaseModel):
    data_retirada: Optional[datetime] = None
    status: str

class Solicitacao_Manutencao(BaseModel):
    id_solicitacao_manutencao: int
    cpf_morador: str
    id_unidade: int
    descricao: str
    status: str
    data_abertura: date
    data_fim: Optional[date] = None

class Solicitacao_ManutencaoUpdate(BaseModel):
    status: str
    data_fim: Optional[date] = None

class Funcionario_Manutencao(BaseModel):
    id_solicitacao: int
    cpf_funcionario: str

class Avisos(BaseModel):
    id_aviso: int
    cpf_adm: str
    titulo: str
    mensagem: str
    data_publicacao: date

class AvisosUpdate(BaseModel):
    titulo: str
    mensagem: str

class Area_comum(BaseModel):
    id_area_comum: int
    nome: str
    horario_funcionamento: str
    descricao: str
    capacidade: int
    regras: str

class Area_comumUpdate(BaseModel):
    horario_funcionamento: str
    descricao: str
    capacidade: int
    regras: str

class Reserva(BaseModel):
    id_reserva: int
    data_reserva: date
    horario_inicio: time
    horario_fim: time
    status: str
    id_area: int
    cpf_morador: str

class ReservaUpdate(BaseModel):
    data_reserva: date
    horario_inicio: time
    horario_fim: time
    status: str

class Visitas(BaseModel):
    id_visita: int
    cpf_morador: str
    nome_visitante: str
    cpf_visitante: Optional[str] = None
    data_visita: date
    horario_entrada: time
    horario_saida: Optional[time] = None

class VisitasUpdate(BaseModel):
    data_visita: date
    horario_entrada: time
    horario_saida: Optional[time] = None

class Contrato(BaseModel):
    id_contrato: int
    tipo_contrato: str
    cpf_pessoa: str
    arquivo: str

class ContratoUpdate(BaseModel):
    tipo_contrato: str
    arquivo: str

class Pagamento(BaseModel):
    id_pagamento: int
    cpf_morador: str
    mes_ano: str
    valor: float
    status: str
    forma_pagamento: Optional[str] = None
    data_emissao: date
    data_pagamento: Optional[date] = None
    vencimento: date
    comprovante: Optional[str] = None

class Denuncias(BaseModel):
    id_denuncia: int
    cpf_pessoa: Optional[str] = None
    data_denuncia: date
    descricao: str
    status: str

class DenunciasUpdate(BaseModel):
    status: str