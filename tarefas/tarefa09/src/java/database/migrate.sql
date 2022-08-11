DROP DATABASE IF EXISTS web2;

CREATE DATABASE web2;

\c web2;

CREATE TABLE tb_usuario (
    id_usuario serial PRIMARY KEY,
    login_usuario VARCHAR(50) NOT NULL,
    senha_usuario VARCHAR(50) NOT NULL,
    nome_usuario VARCHAR(100) NOT NULL
);

CREATE TABLE tb_estado (
    id_estado serial PRIMARY KEY,
    nome_estado VARCHAR(100),
    sigla_estado CHAR(2)
);

CREATE TABLE tb_cidade (
    id_cidade serial PRIMARY KEY,
    nome_cidade VARCHAR(100),
    id_estado INT NOT NULL,
    CONSTRAINT fk_estado FOREIGN KEY(id_estado) REFERENCES tb_estado(id_estado)
);

CREATE TABLE tb_cliente (
    id_cliente serial PRIMARY KEY,
    cpf_cliente CHAR(11) NOT NULL,
    email_cliente VARCHAR(50) NOT NULL,
    nome_cliente VARCHAR(100) NOT NULL,
    data_cliente DATE,
    rua_cliente VARCHAR(100),
    nr_cliente INTEGER,
    cep_cliente CHAR(8),
    id_cidade INT,
    CONSTRAINT fk_cidade FOREIGN KEY(id_cidade) REFERENCES tb_cidade(id_cidade)
);

CREATE TABLE tb_produto (
    id_produto serial PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL
);

CREATE TABLE tb_tipo_atendimento (
    id_tipo_atendimento serial PRIMARY KEY,
    nome_tipo_atendimento VARCHAR(50) NOT NULL
);

CREATE TABLE tb_atendimento (
    id_atendimento serial PRIMARY KEY,
    dt_hr_atendimento TIMESTAMP,
    dsc_atendimento VARCHAR(255),
    res_atendimento CHAR(1),
    id_produto INT,
    id_tipo_atendimento INT,
    id_usuario INT,
    id_cliente INT,
    CONSTRAINT fk_produto FOREIGN KEY(id_produto) REFERENCES tb_produto(id_produto),
    CONSTRAINT fk_tipo_atendimento FOREIGN KEY(id_tipo_atendimento) REFERENCES tb_tipo_atendimento(id_tipo_atendimento),
    CONSTRAINT fk_usuario FOREIGN KEY(id_usuario) REFERENCES tb_usuario(id_usuario),
    CONSTRAINT fk_cliente FOREIGN KEY(id_cliente) REFERENCES tb_cliente(id_cliente)
);

INSERT INTO tb_usuario(login_usuario, senha_usuario, nome_usuario)
VALUES ('leticialima', '657b298b04e033810343842f993c9817', 'leticia lima');

INSERT INTO tb_usuario(login_usuario, senha_usuario, nome_usuario)
VALUES ('lucaslima', '12705eee806dbc01eef5d0233cdfa7a8', 'lucas lima');

INSERT INTO tb_usuario(login_usuario, senha_usuario, nome_usuario)
VALUES ('edumend', '82788f72090471a9133b9c0d107d8192', 'eduardo mendes');

INSERT INTO tb_estado(nome_estado, sigla_estado)
VALUES ('Acre', 'AC');

INSERT INTO tb_estado(nome_estado, sigla_estado)
VALUES ('Alagoas', 'AL');

INSERT INTO tb_estado(nome_estado, sigla_estado)
VALUES ('Amapá', 'AP');

INSERT INTO tb_estado(nome_estado, sigla_estado)
VALUES ('Amazonas', 'AM');

INSERT INTO tb_estado(nome_estado, sigla_estado)
VALUES ('Bahia', 'BA');

INSERT INTO tb_estado(nome_estado, sigla_estado)
VALUES ('Ceará', 'CE');

INSERT INTO tb_estado(nome_estado, sigla_estado)
VALUES ('Espírito Santo', 'ES');

INSERT INTO tb_estado(nome_estado, sigla_estado)
VALUES ('Goiás', 'GO');

INSERT INTO tb_estado(nome_estado, sigla_estado)
VALUES ('Maranhão', 'MA');

INSERT INTO tb_estado(nome_estado, sigla_estado)
VALUES ('Mato Grosso', 'MT');

INSERT INTO tb_estado(nome_estado, sigla_estado)
VALUES ('Mato Grosso do Sul', 'MS');

INSERT INTO tb_estado(nome_estado, sigla_estado)
VALUES ('Minas Gerais', 'MG');

INSERT INTO tb_estado(nome_estado, sigla_estado)
VALUES ('Pará', 'PA');

INSERT INTO tb_estado(nome_estado, sigla_estado)
VALUES ('Paraíba', 'PB');

INSERT INTO tb_estado(nome_estado, sigla_estado)
VALUES ('Paraná', 'PR');

INSERT INTO tb_estado(nome_estado, sigla_estado)
VALUES ('Pernambuco', 'PE');

INSERT INTO tb_estado(nome_estado, sigla_estado)
VALUES ('Piauí', 'PI');

INSERT INTO tb_estado(nome_estado, sigla_estado)
VALUES ('Rio de Janeiro', 'RJ');

INSERT INTO tb_estado(nome_estado, sigla_estado)
VALUES ('Rio Grande do Norte', 'RN');

INSERT INTO tb_estado(nome_estado, sigla_estado)
VALUES ('Rio Grande do Sul', 'RS');

INSERT INTO tb_estado(nome_estado, sigla_estado)
VALUES ('Rondônia', 'RO');

INSERT INTO tb_estado(nome_estado, sigla_estado)
VALUES ('Roraima', 'RR');

INSERT INTO tb_estado(nome_estado, sigla_estado)
VALUES ('Santa Catarina', 'SC');

INSERT INTO tb_estado(nome_estado, sigla_estado)
VALUES ('São Paulo', 'SP');

INSERT INTO tb_estado(nome_estado, sigla_estado)
VALUES ('Sergipe', 'SE');

INSERT INTO tb_estado(nome_estado, sigla_estado)
VALUES ('Tocantins', 'TO');

INSERT INTO tb_estado(nome_estado, sigla_estado)
VALUES ('Distrito Federal', 'DF');

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alta Floresta D''oeste', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ariquemes', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cabixi', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cacoal', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cerejeiras', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Colorado do Oeste', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Corumbiara', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Costa Marques', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Espigão D''oeste', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guajará-mirim', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaru', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ji-paraná', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Machadinho D''oeste', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Brasilândia D''oeste', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ouro Preto do Oeste', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pimenta Bueno', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Velho', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Presidente Médici', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Crespo', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rolim de Moura', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Luzia D''oeste', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vilhena', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Miguel do Guaporé', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Mamoré', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alvorada D''oeste', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alto Alegre Dos Parecis', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alto Paraíso', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Buritis', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Horizonte do Oeste', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cacaulândia', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo Novo de Rondônia', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Candeias do Jamari', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Castanheiras', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Chupinguaia', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cujubim', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Governador Jorge Teixeira', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapuã do Oeste', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ministro Andreazza', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mirante da Serra', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monte Negro', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova União', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Parecis', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pimenteiras do Oeste', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Primavera de Rondônia', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Felipe D''oeste', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Francisco do Guaporé', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Seringueiras', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Teixeirópolis', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Theobroma', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Urupá', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vale do Anari', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vale do Paraíso', 21);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Acrelândia', 1);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Assis Brasil', 1);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brasiléia', 1);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bujari', 1);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capixaba', 1);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cruzeiro do Sul', 1);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Epitaciolândia', 1);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Feijó', 1);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jordão', 1);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mâncio Lima', 1);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Manoel Urbano', 1);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marechal Thaumaturgo', 1);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Plácido de Castro', 1);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Walter', 1);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Branco', 1);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rodrigues Alves', 1);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Rosa do Purus', 1);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Senador Guiomard', 1);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sena Madureira', 1);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tarauacá', 1);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Xapuri', 1);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Acre', 1);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alvarães', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Amaturá', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Anamã', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Anori', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Apuí', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Atalaia do Norte', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Autazes', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barcelos', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barreirinha', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Benjamin Constant', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Beruri', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boa Vista do Ramos', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boca do Acre', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Borba', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caapiranga', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Canutama', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carauari', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Careiro', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Careiro da Várzea', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coari', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Codajás', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Eirunepé', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Envira', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fonte Boa', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guajará', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Humaitá', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipixuna', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iranduba', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itacoatiara', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itamarati', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapiranga', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Japurá', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Juruá', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jutaí', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lábrea', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Manacapuru', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Manaquiri', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Manaus', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Manicoré', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maraã', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maués', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nhamundá', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Olinda do Norte', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Airão', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Aripuanã', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Parintins', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pauini', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Presidente Figueiredo', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Preto da Eva', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Isabel do Rio Negro', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio do Içá', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Gabriel da Cachoeira', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Paulo de Olivença', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Sebastião do Uatumã', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Silves', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tabatinga', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tapauá', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tefé', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tonantins', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Uarini', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Urucará', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Urucurituba', 4);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Amajari', 22);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alto Alegre', 22);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boa Vista', 22);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bonfim', 22);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cantá', 22);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caracaraí', 22);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caroebe', 22);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iracema', 22);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mucajaí', 22);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Normandia', 22);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pacaraima', 22);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rorainópolis', 22);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João da Baliza', 22);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Luiz', 22);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Uiramutã', 22);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Abaetetuba', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Abel Figueiredo', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Acará', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Afuá', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Água Azul do Norte', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alenquer', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Almeirim', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Altamira', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Anajás', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ananindeua', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Anapu', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Augusto Corrêa', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aurora do Pará', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aveiro', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bagre', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Baião', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bannach', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barcarena', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Belém', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Belterra', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Benevides', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Jesus do Tocantins', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bonito', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bragança', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brasil Novo', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brejo Grande do Araguaia', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Breu Branco', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Breves', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bujaru', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cachoeira do Piriá', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cachoeira do Arari', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cametá', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Canaã Dos Carajás', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capanema', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capitão Poço', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Castanhal', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Chaves', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Colares', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conceição do Araguaia', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Concórdia do Pará', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cumaru do Norte', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Curionópolis', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Curralinho', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Curuá', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Curuçá', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dom Eliseu', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Eldorado Dos Carajás', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Faro', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Floresta do Araguaia', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Garrafão do Norte', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Goianésia do Pará', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gurupá', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Igarapé-açu', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Igarapé-miri', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Inhangapi', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipixuna do Pará', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Irituia', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaituba', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itupiranga', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jacareacanga', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jacundá', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Juruti', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Limoeiro do Ajuru', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mãe do Rio', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Magalhães Barata', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marabá', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maracanã', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marapanim', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marituba', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Medicilândia', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Melgaço', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mocajuba', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Moju', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mojuí dos Campos', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monte Alegre', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Muaná', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Esperança do Piriá', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Ipixuna', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Timboteua', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Progresso', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Repartimento', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Óbidos', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Oeiras do Pará', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Oriximiná', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ourém', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ourilândia do Norte', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pacajá', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palestina do Pará', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paragominas', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Parauapebas', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pau D''arco', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Peixe-boi', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piçarra', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Placas', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ponta de Pedras', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Portel', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto de Moz', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Prainha', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Primavera', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quatipuru', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Redenção', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Maria', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rondon do Pará', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rurópolis', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Salinópolis', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Salvaterra', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Bárbara do Pará', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Cruz do Arari', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Isabel do Pará', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Luzia do Pará', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Maria Das Barreiras', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Maria do Pará', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santana do Araguaia', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santarém', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santarém Novo', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio do Tauá', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Caetano de Odivelas', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Domingos do Araguaia', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Domingos do Capim', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Félix do Xingu', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Francisco do Pará', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Geraldo do Araguaia', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João da Ponta', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João de Pirabas', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João do Araguaia', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Miguel do Guamá', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Sebastião da Boa Vista', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sapucaia', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Senador José Porfírio', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Soure', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tailândia', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Terra Alta', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Terra Santa', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tomé-açu', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tracuateua', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Trairão', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tucumã', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tucuruí', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ulianópolis', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Uruará', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vigia', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Viseu', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vitória do Xingu', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Xinguara', 13);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serra do Navio', 3);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Amapá', 3);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedra Branca do Amapari', 3);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Calçoene', 3);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cutias', 3);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ferreira Gomes', 3);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaubal', 3);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Laranjal do Jari', 3);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Macapá', 3);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mazagão', 3);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Oiapoque', 3);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Grande', 3);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pracuúba', 3);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santana', 3);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tartarugalzinho', 3);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vitória do Jari', 3);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Abreulândia', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aguiarnópolis', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aliança do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Almas', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alvorada', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ananás', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Angico', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aparecida do Rio Negro', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aragominas', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araguacema', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araguaçu', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araguaína', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araguanã', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araguatins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arapoema', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arraias', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Augustinópolis', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aurora do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Axixá do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Babaçulândia', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bandeirantes do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra do Ouro', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barrolândia', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bernardo Sayão', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Jesus do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brasilândia do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brejinho de Nazaré', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Buriti do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cachoeirinha', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campos Lindos', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cariri do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carmolândia', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carrasco Bonito', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caseara', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Centenário', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Chapada de Areia', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Chapada da Natividade', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Colinas do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Combinado', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conceição do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Couto de Magalhães', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cristalândia', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Crixás do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Darcinópolis', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dianópolis', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Divinópolis do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dois Irmãos do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dueré', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Esperantina', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fátima', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Figueirópolis', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Filadélfia', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Formoso do Araguaia', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fortaleza do Tabocão', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Goianorte', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Goiatins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guaraí', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gurupi', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipueiras', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itacajá', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaguatins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapiratins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaporã do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaú do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Juarina', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa da Confusão', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lajeado', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lavandeira', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lizarda', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Luzinópolis', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marianópolis do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mateiros', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maurilândia do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Miracema do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Miranorte', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monte do Carmo', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monte Santo do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palmeiras do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Muricilândia', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Natividade', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nazaré', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Olinda', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Rosalândia', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Acordo', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Alegre', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Jardim', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Oliveira de Fátima', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palmeirante', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palmeirópolis', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paraíso do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paranã', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pau D''arco', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedro Afonso', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Peixe', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pequizeiro', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Colméia', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pindorama do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piraquê', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pium', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ponte Alta do Bom Jesus', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ponte Alta do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Alegre do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Nacional', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Praia Norte', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Presidente Kennedy', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pugmil', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Recursolândia', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Riachinho', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio da Conceição', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Dos Bois', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Sono', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sampaio', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sandolândia', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa fé do Araguaia', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Maria do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Rita do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Rosa do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Tereza do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Terezinha do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Bento do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Félix do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Miguel do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Salvador do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Sebastião do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Valério da Natividade', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Silvanópolis', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sítio Novo do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sucupira', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Taguatinga', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Taipas do Tocantins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Talismã', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palmas', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tocantínia', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tocantinópolis', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tupirama', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tupiratins', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Wanderlândia', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Xambioá', 26);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Açailândia', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Afonso Cunha', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Água Doce do Maranhão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alcântara', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aldeias Altas', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Altamira do Maranhão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alto Alegre do Maranhão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alto Alegre do Pindaré', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alto Parnaíba', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Amapá do Maranhão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Amarante do Maranhão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Anajatuba', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Anapurus', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Apicum-açu', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araguanã', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araioses', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arame', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arari', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Axixá', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bacabal', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bacabeira', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bacuri', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bacurituba', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Balsas', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barão de Grajaú', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra do Corda', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barreirinhas', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Belágua', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bela Vista do Maranhão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Benedito Leite', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bequimão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bernardo do Mearim', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boa Vista do Gurupi', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Jardim', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Jesus Das Selvas', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Lugar', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brejo', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brejo de Areia', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Buriti', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Buriti Bravo', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Buriticupu', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Buritirana', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cachoeira Grande', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cajapió', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cajari', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campestre do Maranhão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cândido Mendes', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cantanhede', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capinzal do Norte', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carolina', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carutapera', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caxias', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cedral', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Central do Maranhão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Centro do Guilherme', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Centro Novo do Maranhão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Chapadinha', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cidelândia', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Codó', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coelho Neto', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Colinas', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conceição do Lago-açu', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coroatá', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cururupu', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Davinópolis', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dom Pedro', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Duque Bacelar', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Esperantinópolis', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Estreito', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Feira Nova do Maranhão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fernando Falcão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Formosa da Serra Negra', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fortaleza Dos Nogueiras', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fortuna', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Godofredo Viana', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gonçalves Dias', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Governador Archer', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Governador Edison Lobão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Governador Eugênio Barros', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Governador Luiz Rocha', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Governador Newton Bello', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Governador Nunes Freire', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Graça Aranha', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Grajaú', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guimarães', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Humberto de Campos', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Icatu', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Igarapé do Meio', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Igarapé Grande', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Imperatriz', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaipava do Grajaú', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapecuru Mirim', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itinga do Maranhão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jatobá', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jenipapo Dos Vieiras', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('João Lisboa', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Joselândia', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Junco do Maranhão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lago da Pedra', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lago do Junco', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lago Verde', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa do Mato', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lago Dos Rodrigues', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa Grande do Maranhão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lajeado Novo', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lima Campos', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Loreto', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Luís Domingues', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Magalhães de Almeida', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maracaçumé', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marajá do Sena', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maranhãozinho', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mata Roma', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Matinha', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Matões', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Matões do Norte', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Milagres do Maranhão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mirador', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Miranda do Norte', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mirinzal', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monção', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Montes Altos', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Morros', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nina Rodrigues', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Colinas', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Iorque', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Olinda do Maranhão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Olho D''água Das Cunhãs', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Olinda Nova do Maranhão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paço do Lumiar', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palmeirândia', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paraibano', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Parnarama', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Passagem Franca', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pastos Bons', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paulino Neves', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paulo Ramos', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedreiras', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedro do Rosário', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Penalva', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Peri Mirim', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Peritoró', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pindaré-mirim', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pinheiro', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pio Xii', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pirapemas', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Poção de Pedras', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Franco', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Rico do Maranhão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Presidente Dutra', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Presidente Juscelino', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Presidente Médici', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Presidente Sarney', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Presidente Vargas', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Primeira Cruz', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Raposa', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Riachão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ribamar Fiquene', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rosário', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sambaíba', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Filomena do Maranhão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Helena', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Inês', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Luzia', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Luzia do Paruá', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Quitéria do Maranhão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Rita', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santana do Maranhão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Amaro do Maranhão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio Dos Lopes', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Benedito do Rio Preto', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Bento', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Bernardo', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Domingos do Azeitão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Domingos do Maranhão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Félix de Balsas', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Francisco do Brejão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Francisco do Maranhão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João Batista', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João do Carú', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João do Paraíso', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João do Soter', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João Dos Patos', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José de Ribamar', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José Dos Basílios', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Luís', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Luís Gonzaga do Maranhão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Mateus do Maranhão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Pedro da Água Branca', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Pedro Dos Crentes', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Raimundo Das Mangabeiras', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Raimundo do Doca Bezerra', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Roberto', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Vicente Ferrer', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Satubinha', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Senador Alexandre Costa', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Senador la Rocque', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serrano do Maranhão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sítio Novo', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sucupira do Norte', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sucupira do Riachão', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tasso Fragoso', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Timbiras', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Timon', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Trizidela do Vale', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tufilândia', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tuntum', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Turiaçu', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Turilândia', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tutóia', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Urbano Santos', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vargem Grande', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Viana', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vila Nova Dos Martírios', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vitória do Mearim', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vitorino Freire', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('zé Doca', 9);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Acauã', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Agricolândia', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Água Branca', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alagoinha do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alegrete do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alto Longá', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Altos', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alvorada do Gurguéia', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Amarante', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Angical do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Anísio de Abreu', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Antônio Almeida', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aroazes', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aroeiras do Itaim', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arraial', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Assunção do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Avelino Lopes', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Baixa Grande do Ribeiro', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra D''alcântara', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barras', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barreiras do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barro Duro', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Batalha', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bela Vista do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Belém do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Beneditinos', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bertolínia', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Betânia do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boa Hora', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bocaina', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Jesus', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Princípio do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bonfim do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boqueirão do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brasileira', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brejo do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Buriti Dos Lopes', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Buriti Dos Montes', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cabeceiras do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cajazeiras do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cajueiro da Praia', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caldeirão Grande do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campinas do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo Alegre do Fidalgo', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo Grande do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo Largo do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo Maior', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Canavieira', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Canto do Buriti', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capitão de Campos', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capitão Gervásio Oliveira', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caracol', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caraúbas do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caridade do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Castelo do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caxingó', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cocal', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cocal de Telha', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cocal Dos Alves', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coivaras', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Colônia do Gurguéia', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Colônia do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conceição do Canindé', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coronel José Dias', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Corrente', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cristalândia do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cristino Castro', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Curimatá', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Currais', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Curralinhos', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Curral Novo do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Demerval Lobão', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dirceu Arcoverde', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dom Expedito Lopes', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Domingos Mourão', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dom Inocêncio', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Elesbão Veloso', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Eliseu Martins', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Esperantina', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fartura do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Flores do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Floresta do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Floriano', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Francinópolis', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Francisco Ayres', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Francisco Macedo', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Francisco Santos', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fronteiras', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Geminiano', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gilbués', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guadalupe', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guaribas', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Hugo Napoleão', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ilha Grande', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Inhuma', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipiranga do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Isaías Coelho', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itainópolis', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaueira', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jacobina do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaicós', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jardim do Mulato', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jatobá do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jerumenha', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('João Costa', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Joaquim Pires', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Joca Marques', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('José de Freitas', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Juazeiro do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Júlio Borges', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jurema', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoinha do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa Alegre', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa do Barro do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa de São Francisco', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa do Sítio', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Landri Sales', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Luís Correia', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Luzilândia', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Madeiro', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Manoel Emídio', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marcolândia', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marcos Parente', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Massapê do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Matias Olímpio', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Miguel Alves', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Miguel Leão', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Milton Brandão', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monsenhor Gil', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monsenhor Hipólito', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monte Alegre do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Morro Cabeça no Tempo', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Morro do Chapéu do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Murici Dos Portelas', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nazaré do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nazária', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nossa Senhora de Nazaré', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nossa Senhora Dos Remédios', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Oriente do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Santo Antônio', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Oeiras', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Olho D''água do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Padre Marcos', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paes Landim', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pajeú do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palmeira do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palmeirais', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paquetá', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Parnaguá', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Parnaíba', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Passagem Franca do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Patos do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pau D''arco do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paulistana', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pavussu', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedro ii', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedro Laurentino', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Santa Rita', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Picos', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pimenteiras', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pio ix', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piracuruca', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piripiri', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Alegre do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Prata do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Queimada Nova', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Redenção do Gurguéia', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Regeneração', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Riacho Frio', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ribeira do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ribeiro Gonçalves', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Grande do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Cruz do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Cruz Dos Milagres', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Filomena', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Luz', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santana do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Rosa do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio de Lisboa', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio Dos Milagres', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Inácio do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Braz do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Félix do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Francisco de Assis do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Francisco do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Gonçalo do Gurguéia', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Gonçalo do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João da Canabrava', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João da Fronteira', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João da Serra', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João da Varjota', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João do Arraial', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Divino', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Peixe', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Julião', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Lourenço do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Luis do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Miguel da Baixa Grande', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Miguel do Fidalgo', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Miguel do Tapuio', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Pedro do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Raimundo Nonato', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sebastião Barros', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sebastião Leal', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sigefredo Pacheco', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Simões', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Simplício Mendes', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Socorro do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sussuapara', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tamboril do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tanque do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Teresina', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('União', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Uruçuí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Valença do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Várzea Branca', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Várzea Grande', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vera Mendes', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vila Nova do Piauí', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Wall Ferraz', 17);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Abaiara', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Acarapé', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Acaraú', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Acopiara', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aiuaba', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alcântaras', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Altaneira', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alto Santo', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Amontada', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Antonina do Norte', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Apuiarés', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aquiraz', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aracati', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aracoiaba', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ararendá', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araripe', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aratuba', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arneiroz', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Assaré', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aurora', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Baixio', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Banabuiú', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barbalha', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barreira', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barro', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barroquinha', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Baturité', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Beberibe', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bela Cruz', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boa Viagem', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brejo Santo', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Camocim', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campos Sales', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Canindé', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capistrano', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caridade', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cariré', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caririaçu', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cariús', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carnaubal', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cascavel', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Catarina', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Catunda', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caucaia', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cedro', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Chaval', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Choró', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Chorozinho', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coreaú', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Crateús', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Crato', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Croatá', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cruz', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Deputado Irapuan Pinheiro', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ererê', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Eusébio', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Farias Brito', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Forquilha', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fortaleza', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fortim', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Frecheirinha', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('General Sampaio', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Graça', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Granja', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Granjeiro', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Groaíras', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guaiúba', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guaraciaba do Norte', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guaramiranga', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Hidrolândia', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Horizonte', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibaretama', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibiapina', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibicuitinga', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Icapuí', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Icó', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iguatu', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Independência', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipaporanga', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipaumirim', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipu', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipueiras', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iracema', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Irauçuba', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaiçaba', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaitinga', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapagé', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapipoca', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapiúna', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itarema', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itatira', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaguaretama', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaguaribara', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaguaribe', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaguaruana', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jardim', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jati', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jijoca de Jericoacoara', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Juazeiro do Norte', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jucás', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lavras da Mangabeira', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Limoeiro do Norte', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Madalena', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maracanaú', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maranguape', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marco', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Martinópole', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Massapê', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mauriti', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Meruoca', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Milagres', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Milhã', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Miraíma', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Missão Velha', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mombaça', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monsenhor Tabosa', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Morada Nova', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Moraújo', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Morrinhos', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mucambo', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mulungu', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Olinda', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Russas', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Oriente', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ocara', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Orós', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pacajus', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pacatuba', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pacoti', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pacujá', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palhano', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palmácia', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paracuru', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paraipaba', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Parambu', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paramoti', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedra Branca', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Penaforte', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pentecoste', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pereiro', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pindoretama', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piquet Carneiro', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pires Ferreira', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Poranga', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porteiras', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Potengi', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Potiretama', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quiterianópolis', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quixadá', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quixelô', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quixeramobim', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quixeré', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Redenção', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Reriutaba', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Russas', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Saboeiro', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Salitre', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santana do Acaraú', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santana do Cariri', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Quitéria', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Benedito', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Gonçalo do Amarante', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João do Jaguaribe', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Luís do Curu', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Senador Pompeu', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Senador sá', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sobral', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Solonópole', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tabuleiro do Norte', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tamboril', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tarrafas', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tauá', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tejuçuoca', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tianguá', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Trairi', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tururu', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ubajara', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Umari', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Umirim', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Uruburetama', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Uruoca', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Varjota', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Várzea Alegre', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Viçosa do Ceará', 6);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Acari', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Açu', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Afonso Bezerra', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Água Nova', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alexandria', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Almino Afonso', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alto do Rodrigues', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Angicos', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Antônio Martins', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Apodi', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Areia Branca', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arês', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Augusto Severo', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Baía Formosa', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Baraúna', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barcelona', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bento Fernandes', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bodó', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Jesus', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brejinho', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caiçara do Norte', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caiçara do Rio do Vento', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caicó', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo Redondo', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Canguaretama', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caraúbas', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carnaúba Dos Dantas', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carnaubais', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ceará-mirim', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cerro Corá', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coronel Ezequiel', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coronel João Pessoa', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cruzeta', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Currais Novos', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Doutor Severiano', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Parnamirim', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Encanto', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Equador', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Espírito Santo', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Extremoz', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Felipe Guerra', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fernando Pedroza', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Florânia', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Francisco Dantas', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Frutuoso Gomes', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Galinhos', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Goianinha', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Governador Dix-sept Rosado', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Grossos', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guamaré', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ielmo Marinho', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipanguaçu', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipueira', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itajá', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaú', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaçanã', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jandaíra', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Janduís', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Januário Cicco', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Japi', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jardim de Angicos', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jardim de Piranhas', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jardim do Seridó', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('João Câmara', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('João Dias', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('José da Penha', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jucurutu', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jundiá', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa D''anta', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa de Pedras', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa de Velhos', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa Nova', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa Salgada', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lajes', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lajes Pintadas', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lucrécia', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Luís Gomes', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Macaíba', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Macau', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Major Sales', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marcelino Vieira', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Martins', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maxaranguape', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Messias Targino', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Montanhas', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monte Alegre', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monte Das Gameleiras', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mossoró', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Natal', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nísia Floresta', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Cruz', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Olho-d''água do Borges', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ouro Branco', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paraná', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paraú', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Parazinho', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Parelhas', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio do Fogo', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Passa e Fica', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Passagem', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Patu', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Maria', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pau Dos Ferros', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedra Grande', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedra Preta', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedro Avelino', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedro Velho', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pendências', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pilões', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Poço Branco', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Portalegre', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto do Mangue', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Presidente Juscelino', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pureza', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rafael Fernandes', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rafael Godeiro', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Riacho da Cruz', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Riacho de Santana', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Riachuelo', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rodolfo Fernandes', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tibau', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ruy Barbosa', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Cruz', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santana do Matos', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santana do Seridó', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Bento do Norte', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Bento do Trairí', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Fernando', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Francisco do Oeste', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Gonçalo do Amarante', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João do Sabugi', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José de Mipibu', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Campestre', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Seridó', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Miguel', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Miguel do Gostoso', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Paulo do Potengi', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Pedro', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Rafael', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Tomé', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Vicente', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Senador Elói de Souza', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Senador Georgino Avelino', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serra de São Bento', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serra do Mel', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serra Negra do Norte', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serrinha', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serrinha Dos Pintos', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Severiano Melo', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sítio Novo', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Taboleiro Grande', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Taipu', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tangará', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tenente Ananias', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tenente Laurentino Cruz', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tibau do Sul', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Timbaúba Dos Batistas', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Touros', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Triunfo Potiguar', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Umarizal', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Upanema', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Várzea', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Venha-ver', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vera Cruz', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Viçosa', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vila Flor', 19);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Água Branca', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aguiar', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alagoa Grande', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alagoa Nova', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alagoinha', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alcantil', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Algodão de Jandaíra', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alhandra', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João do Rio do Peixe', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Amparo', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aparecida', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araçagi', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arara', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araruna', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Areia', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Areia de Baraúnas', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Areial', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aroeiras', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Assunção', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Baía da Traição', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bananeiras', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Baraúna', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra de Santana', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra de Santa Rosa', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra de São Miguel', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bayeux', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Belém', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Belém do Brejo do Cruz', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bernardino Batista', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boa Ventura', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boa Vista', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Jesus', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Sucesso', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bonito de Santa fé', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boqueirão', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Igaracy', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Borborema', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brejo do Cruz', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brejo Dos Santos', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caaporã', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cabaceiras', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cabedelo', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cachoeira Dos Índios', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cacimba de Areia', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cacimba de Dentro', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cacimbas', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caiçara', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cajazeiras', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cajazeirinhas', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caldas Brandão', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Camalaú', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campina Grande', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capim', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caraúbas', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carrapateira', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Casserengue', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Catingueira', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Catolé do Rocha', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caturité', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conceição', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Condado', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conde', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Congo', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coremas', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coxixola', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cruz do Espírito Santo', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cubati', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cuité', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cuitegi', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cuité de Mamanguape', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Curral de Cima', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Curral Velho', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Damião', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Desterro', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vista Serrana', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Diamante', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dona Inês', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Duas Estradas', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Emas', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Esperança', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fagundes', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Frei Martinho', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gado Bravo', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guarabira', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gurinhém', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gurjão', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibiara', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Imaculada', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ingá', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itabaiana', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaporanga', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapororoca', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itatuba', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jacaraú', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jericó', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('João Pessoa', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Juarez Távora', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Juazeirinho', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Junco do Seridó', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Juripiranga', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Juru', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa de Dentro', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa Seca', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lastro', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Livramento', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Logradouro', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lucena', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mãe D''água', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Malta', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mamanguape', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Manaíra', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marcação', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mari', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marizópolis', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Massaranduba', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mataraca', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Matinhas', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mato Grosso', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maturéia', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mogeiro', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Montadas', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monte Horebe', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monteiro', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mulungu', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Natuba', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nazarezinho', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Floresta', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Olinda', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Palmeira', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Olho D''água', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Olivedos', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ouro Velho', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Parari', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Passagem', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Patos', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paulista', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedra Branca', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedra Lavrada', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedras de Fogo', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piancó', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Picuí', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pilar', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pilões', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pilõezinhos', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pirpirituba', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pitimbu', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pocinhos', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Poço Dantas', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Poço de José de Moura', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pombal', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Prata', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Princesa Isabel', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Puxinanã', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Queimadas', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quixabá', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Remígio', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedro Régis', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Riachão', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Riachão do Bacamarte', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Riachão do Poço', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Riacho de Santo Antônio', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Riacho Dos Cavalos', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Tinto', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Salgadinho', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Salgado de São Félix', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Cecília', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Cruz', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Helena', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Inês', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Luzia', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santana de Mangueira', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santana Dos Garrotes', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santarém', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Rita', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Teresinha', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo André', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Bento', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Bentinho', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Domingos do Cariri', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Domingos de Pombal', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Francisco', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João do Cariri', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João do Tigre', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José da Lagoa Tapada', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José de Caiana', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José de Espinharas', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José Dos Ramos', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José de Piranhas', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José de Princesa', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Bonfim', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Brejo do Cruz', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Sabugi', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José Dos Cordeiros', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Mamede', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Miguel de Taipu', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Sebastião de Lagoa de Roça', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Sebastião do Umbuzeiro', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sapé', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Seridó', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serra Branca', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serra da Raiz', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serra Grande', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serra Redonda', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serraria', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sertãozinho', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sobrado', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Solânea', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Soledade', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sossêgo', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sousa', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sumé', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo de Santana', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Taperoá', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tavares', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Teixeira', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tenório', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Triunfo', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Uiraúna', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Umbuzeiro', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Várzea', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vieirópolis', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Zabelê', 14);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Abreu e Lima', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Afogados da Ingazeira', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Afrânio', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Agrestina', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Água Preta', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Águas Belas', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alagoinha', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aliança', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Altinho', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Amaraji', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Angelim', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araçoiaba', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araripina', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arcoverde', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra de Guabiraba', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barreiros', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Belém de Maria', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Belém de São Francisco', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Belo Jardim', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Betânia', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bezerros', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bodocó', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Conselho', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Jardim', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bonito', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brejão', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brejinho', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brejo da Madre de Deus', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Buenos Aires', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Buíque', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cabo de Santo Agostinho', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cabrobó', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cachoeirinha', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caetés', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Calçado', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Calumbi', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Camaragibe', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Camocim de São Félix', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Camutanga', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Canhotinho', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capoeiras', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carnaíba', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carnaubeira da Penha', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carpina', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caruaru', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Casinhas', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Catende', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cedro', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Chã de Alegria', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Chã Grande', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Condado', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Correntes', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cortês', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cumaru', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cupira', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Custódia', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dormentes', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Escada', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Exu', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Feira Nova', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fernando de Noronha', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ferreiros', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Flores', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Floresta', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Frei Miguelinho', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gameleira', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Garanhuns', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Glória do Goitá', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Goiana', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Granito', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gravatá', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iati', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibimirim', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibirajuba', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Igarassu', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iguaraci', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Inajá', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ingazeira', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipojuca', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipubi', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itacuruba', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaíba', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ilha de Itamaracá', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itambé', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapetim', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapissuma', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaquitinga', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaboatão Dos Guararapes', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaqueira', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jataúba', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jatobá', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('João Alfredo', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Joaquim Nabuco', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jucati', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jupi', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jurema', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa do Carro', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa do Itaenga', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa do Ouro', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa Dos Gatos', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa Grande', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lajedo', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Limoeiro', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Macaparana', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Machados', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Manari', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maraial', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mirandiba', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Moreno', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nazaré da Mata', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Olinda', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Orobó', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Orocó', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ouricuri', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palmares', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palmeirina', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Panelas', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paranatama', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Parnamirim', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Passira', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paudalho', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paulista', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedra', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pesqueira', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Petrolândia', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Petrolina', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Poção', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pombos', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Primavera', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quipapá', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quixaba', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Recife', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Riacho Das Almas', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ribeirão', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Formoso', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sairé', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Salgadinho', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Salgueiro', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Saloá', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sanharó', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Cruz', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Cruz da Baixa Verde', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Cruz do Capibaribe', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Filomena', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Maria da Boa Vista', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Maria do Cambucá', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Terezinha', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Benedito do Sul', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Bento do Una', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Caitano', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Joaquim do Monte', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José da Coroa Grande', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Belmonte', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Egito', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Lourenço da Mata', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Vicente Ferrer', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serra Talhada', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serrita', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sertânia', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sirinhaém', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Moreilândia', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Solidão', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Surubim', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tabira', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tacaimbó', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tacaratu', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tamandaré', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Taquaritinga do Norte', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Terezinha', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Terra Nova', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Timbaúba', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Toritama', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tracunhaém', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Trindade', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Triunfo', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tupanatinga', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tuparetama', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Venturosa', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Verdejante', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vertente do Lério', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vertentes', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vicência', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vitória de Santo Antão', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Xexéu', 16);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Água Branca', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Anadia', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arapiraca', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Atalaia', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra de Santo Antônio', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra de São Miguel', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Batalha', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Belém', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Belo Monte', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boca da Mata', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Branquinha', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cacimbinhas', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cajueiro', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campestre', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo Alegre', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo Grande', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Canapi', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capela', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carneiros', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Chã Preta', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coité do Nóia', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Colônia Leopoldina', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coqueiro Seco', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coruripe', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Craíbas', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Delmiro Gouveia', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dois Riachos', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Estrela de Alagoas', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Feira Grande', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Feliz Deserto', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Flexeiras', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Girau do Ponciano', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibateguara', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Igaci', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Igreja Nova', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Inhapi', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jacaré Dos Homens', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jacuípe', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Japaratinga', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaramataia', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jequiá da Praia', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Joaquim Gomes', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jundiá', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Junqueiro', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa da Canoa', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Limoeiro de Anadia', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maceió', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Major Isidoro', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maragogi', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maravilha', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marechal Deodoro', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maribondo', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mar Vermelho', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mata Grande', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Matriz de Camaragibe', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Messias', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Minador do Negrão', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monteirópolis', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Murici', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Lino', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Olho D''água Das Flores', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Olho D''água do Casado', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Olho D''água Grande', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Olivença', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ouro Branco', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palestina', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palmeira Dos Índios', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pão de Açúcar', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pariconha', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paripueira', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Passo de Camaragibe', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paulo Jacinto', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Penedo', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piaçabuçu', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pilar', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pindoba', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piranhas', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Poço Das Trincheiras', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Calvo', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto de Pedras', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Real do Colégio', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quebrangulo', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Largo', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Roteiro', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Luzia do Norte', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santana do Ipanema', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santana do Mundaú', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Brás', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José da Laje', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José da Tapera', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Luís do Quitunde', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Miguel Dos Campos', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Miguel Dos Milagres', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Sebastião', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Satuba', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Senador Rui Palmeira', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tanque D''arca', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Taquarana', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Teotônio Vilela', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Traipu', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('União Dos Palmares', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Viçosa', 2);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Amparo de São Francisco', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aquidabã', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aracaju', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arauá', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Areia Branca', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra Dos Coqueiros', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boquim', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brejo Grande', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo do Brito', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Canhoba', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Canindé de São Francisco', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capela', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carira', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carmópolis', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cedro de São João', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cristinápolis', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cumbe', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Divina Pastora', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Estância', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Feira Nova', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Frei Paulo', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gararu', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('General Maynard', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gracho Cardoso', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ilha Das Flores', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Indiaroba', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itabaiana', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itabaianinha', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itabi', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaporanga D''ajuda', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Japaratuba', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Japoatã', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagarto', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Laranjeiras', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Macambira', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Malhada Dos Bois', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Malhador', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maruim', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Moita Bonita', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monte Alegre de Sergipe', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Muribeca', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Neópolis', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nossa Senhora Aparecida', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nossa Senhora da Glória', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nossa Senhora Das Dores', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nossa Senhora de Lourdes', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nossa Senhora do Socorro', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pacatuba', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedra Mole', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedrinhas', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pinhão', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pirambu', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Poço Redondo', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Poço Verde', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto da Folha', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Propriá', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Riachão do Dantas', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Riachuelo', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ribeirópolis', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rosário do Catete', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Salgado', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Luzia do Itanhy', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santana do São Francisco', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Rosa de Lima', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Amaro Das Brotas', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Cristóvão', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Domingos', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Francisco', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Miguel do Aleixo', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Simão Dias', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Siriri', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Telha', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tobias Barreto', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tomar do Geru', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Umbaúba', 25);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Abaíra', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Abaré', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Acajutiba', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Adustina', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Água Fria', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Érico Cardoso', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aiquara', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alagoinhas', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alcobaça', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Almadina', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Amargosa', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Amélia Rodrigues', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('América Dourada', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Anagé', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Andaraí', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Andorinha', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Angical', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Anguera', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Antas', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Antônio Cardoso', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Antônio Gonçalves', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aporá', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Apuarema', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aracatu', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araças', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araci', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aramari', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arataca', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aratuípe', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aurelino Leal', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Baianópolis', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Baixa Grande', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Banzaê', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra da Estiva', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra do Choça', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra do Mendes', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra do Rocha', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barreiras', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barro Alto', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barrocas', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Governador Lomanto Júnior', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Belmonte', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Belo Campo', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Biritinga', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boa Nova', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boa Vista do Tupim', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Jesus da Lapa', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Jesus da Serra', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boninal', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bonito', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boquira', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Botuporã', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brejões', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brejolândia', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brotas de Macaúbas', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brumado', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Buerarema', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Buritirama', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caatiba', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cabaceiras do Paraguaçu', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cachoeira', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caculé', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caém', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caetanos', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caetité', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cafarnaum', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cairu', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caldeirão Grande', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Camacan', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Camaçari', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Camamu', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo Alegre de Lourdes', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo Formoso', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Canápolis', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Canarana', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Canavieiras', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Candeal', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Candeias', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Candiba', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cândido Sales', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cansanção', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Canudos', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capela do Alto Alegre', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capim Grosso', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caraíbas', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caravelas', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cardeal da Silva', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carinhanha', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Casa Nova', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Castro Alves', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Catolândia', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Catu', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caturama', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Central', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Chorrochó', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cícero Dantas', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cipó', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coaraci', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cocos', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conceição da Feira', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conceição do Almeida', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conceição do Coité', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conceição do Jacuípe', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conde', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Condeúba', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Contendas do Sincorá', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coração de Maria', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cordeiros', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coribe', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coronel João sá', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Correntina', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cotegipe', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cravolândia', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Crisópolis', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cristópolis', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cruz Das Almas', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Curaçá', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dário Meira', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dias D''ávila', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dom Basílio', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dom Macedo Costa', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Elísio Medrado', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Encruzilhada', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Entre Rios', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Esplanada', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Euclides da Cunha', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Eunápolis', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fátima', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Feira da Mata', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Feira de Santana', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Filadélfia', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Firmino Alves', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Floresta Azul', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Formosa do Rio Preto', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gandu', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gavião', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gentio do Ouro', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Glória', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gongogi', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Governador Mangabeira', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guajeru', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guanambi', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guaratinga', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Heliópolis', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iaçu', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibiassucê', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibicaraí', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibicoara', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibicuí', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibipeba', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibipitanga', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibiquera', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibirapitanga', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibirapuã', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibirataia', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibitiara', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibititá', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibotirama', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ichu', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Igaporã', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Igrapiúna', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iguaí', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ilhéus', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Inhambupe', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipecaetá', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipiaú', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipirá', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipupiara', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Irajuba', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iramaia', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iraquara', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Irará', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Irecê', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itabela', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaberaba', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itabuna', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itacaré', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaeté', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itagi', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itagibá', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itagimirim', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaguaçu da Bahia', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaju do Colônia', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itajuípe', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itamaraju', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itamari', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itambé', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itanagra', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itanhém', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaparica', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapé', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapebi', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapetinga', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapicuru', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapitanga', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaquara', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itarantim', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itatim', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itiruçu', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itiúba', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itororó', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ituaçu', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ituberá', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iuiú', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaborandi', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jacaraci', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jacobina', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaguaquara', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaguarari', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaguaripe', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jandaíra', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jequié', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jeremoabo', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jiquiriçá', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jitaúna', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('João Dourado', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Juazeiro', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jucuruçu', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jussara', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jussari', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jussiape', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lafaiete Coutinho', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa Real', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Laje', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lajedão', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lajedinho', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lajedo do Tabocal', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lamarão', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lapão', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lauro de Freitas', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lençóis', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Licínio de Almeida', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Livramento de Nossa Senhora', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Luís Eduardo Magalhães', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Macajuba', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Macarani', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Macaúbas', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Macururé', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Madre de Deus', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maetinga', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maiquinique', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mairi', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Malhada', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Malhada de Pedras', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Manoel Vitorino', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mansidão', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maracás', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maragogipe', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maraú', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marcionílio Souza', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mascote', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mata de São João', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Matina', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Medeiros Neto', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Miguel Calmon', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Milagres', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mirangaba', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mirante', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monte Santo', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Morpará', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Morro do Chapéu', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mortugaba', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mucugê', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mucuri', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mulungu do Morro', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mundo Novo', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Muniz Ferreira', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Muquém de São Francisco', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Muritiba', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mutuípe', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nazaré', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nilo Peçanha', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nordestina', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Canaã', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Fátima', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Ibiá', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Itarana', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Redenção', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Soure', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Viçosa', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Horizonte', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Triunfo', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Olindina', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Oliveira Dos Brejinhos', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ouriçangas', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ourolândia', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palmas de Monte Alto', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palmeiras', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paramirim', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paratinga', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paripiranga', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pau Brasil', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paulo Afonso', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('pé de Serra', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedrão', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedro Alexandre', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piatã', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pilão Arcado', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pindaí', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pindobaçu', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pintadas', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piraí do Norte', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piripá', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piritiba', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Planaltino', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Planalto', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Poções', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pojuca', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ponto Novo', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Seguro', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Potiraguá', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Prado', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Presidente Dutra', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Presidente Jânio Quadros', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Presidente Tancredo Neves', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Queimadas', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quijingue', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quixabeira', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rafael Jambeiro', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Remanso', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Retirolândia', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Riachão Das Neves', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Riachão do Jacuípe', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Riacho de Santana', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ribeira do Amparo', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ribeira do Pombal', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ribeirão do Largo', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio de Contas', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio do Antônio', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio do Pires', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Real', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rodelas', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ruy Barbosa', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Salinas da Margarida', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Salvador', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Bárbara', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Brígida', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Cruz Cabrália', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Cruz da Vitória', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Inês', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santaluz', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Luzia', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Maria da Vitória', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santana', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santanópolis', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Rita de Cássia', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Teresinha', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Amaro', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio de Jesus', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Estêvão', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Desidério', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Domingos', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Félix', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Félix do Coribe', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Felipe', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Francisco do Conde', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Gabriel', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Gonçalo Dos Campos', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José da Vitória', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Jacuípe', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Miguel Das Matas', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Sebastião do Passé', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sapeaçu', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sátiro Dias', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Saubara', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Saúde', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Seabra', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sebastião Laranjeiras', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Senhor do Bonfim', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serra do Ramalho', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sento sé', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serra Dourada', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serra Preta', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serrinha', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serrolândia', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Simões Filho', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sítio do Mato', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sítio do Quinto', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sobradinho', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Souto Soares', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tabocas do Brejo Velho', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tanhaçu', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tanque Novo', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tanquinho', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Taperoá', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tapiramutá', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Teixeira de Freitas', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Teodoro Sampaio', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Teofilândia', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Teolândia', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Terra Nova', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tremedal', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tucano', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Uauá', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ubaíra', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ubaitaba', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ubatã', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Uibaí', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Umburanas', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Una', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Urandi', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Uruçuca', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Utinga', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Valença', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Valente', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Várzea da Roça', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Várzea do Poço', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Várzea Nova', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Varzedo', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vera Cruz', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vereda', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vitória da Conquista', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Wagner', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Wanderley', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Wenceslau Guimarães', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Xique-xique', 5);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Abadia Dos Dourados', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Abaeté', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Abre Campo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Acaiaca', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Açucena', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Água Boa', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Água Comprida', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aguanil', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Águas Formosas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Águas Vermelhas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aimorés', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aiuruoca', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alagoa', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Albertina', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Além Paraíba', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alfenas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alfredo Vasconcelos', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Almenara', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alpercata', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alpinópolis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alterosa', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alto Caparaó', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alto Rio Doce', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alvarenga', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alvinópolis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alvorada de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Amparo do Serra', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Andradas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cachoeira de Pajeú', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Andrelândia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Angelândia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Antônio Carlos', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Antônio Dias', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Antônio Prado de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araçaí', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aracitaba', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araçuaí', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araguari', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arantina', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araponga', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araporã', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arapuá', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araújos', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araxá', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arceburgo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arcos', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Areado', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Argirita', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aricanduva', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arinos', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Astolfo Dutra', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ataléia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Augusto de Lima', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Baependi', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Baldim', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bambuí', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bandeira', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bandeira do Sul', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barão de Cocais', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barão de Monte Alto', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barbacena', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra Longa', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barroso', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bela Vista de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Belmiro Braga', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Belo Horizonte', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Belo Oriente', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Belo Vale', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Berilo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bertópolis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Berizal', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Betim', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bias Fortes', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bicas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Biquinhas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boa Esperança', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bocaina de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bocaiúva', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Despacho', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Jardim de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Jesus da Penha', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Jesus do Amparo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Jesus do Galho', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Repouso', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Sucesso', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bonfim', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bonfinópolis de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bonito de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Borda da Mata', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Botelhos', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Botumirim', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brasilândia de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brasília de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brás Pires', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Braúnas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brasópolis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brumadinho', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bueno Brandão', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Buenópolis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bugre', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Buritis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Buritizeiro', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cabeceira Grande', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cabo Verde', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cachoeira da Prata', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cachoeira de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cachoeira Dourada', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caetanópolis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caeté', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caiana', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cajuri', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caldas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Camacho', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Camanducaia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cambuí', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cambuquira', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campanário', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campanha', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campestre', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campina Verde', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo Azul', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo Belo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo do Meio', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo Florido', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campos Altos', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campos Gerais', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Canaã', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Canápolis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cana Verde', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Candeias', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cantagalo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caparaó', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capela Nova', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capelinha', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capetinga', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capim Branco', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capinópolis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capitão Andrade', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capitão Enéas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capitólio', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caputira', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caraí', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caranaíba', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carandaí', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carangola', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caratinga', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carbonita', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Careaçu', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carlos Chagas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carmésia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carmo da Cachoeira', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carmo da Mata', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carmo de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carmo do Cajuru', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carmo do Paranaíba', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carmo do Rio Claro', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carmópolis de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carneirinho', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carrancas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carvalhópolis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carvalhos', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Casa Grande', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cascalho Rico', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cássia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conceição da Barra de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cataguases', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Catas Altas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Catas Altas da Noruega', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Catuji', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Catuti', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caxambu', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cedro do Abaeté', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Central de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Centralina', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Chácara', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Chalé', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Chapada do Norte', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Chapada Gaúcha', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Chiador', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cipotânea', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Claraval', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Claro Dos Poções', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cláudio', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coimbra', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coluna', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Comendador Gomes', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Comercinho', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conceição da Aparecida', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conceição Das Pedras', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conceição Das Alagoas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conceição de Ipanema', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conceição do Mato Dentro', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conceição do Pará', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conceição do Rio Verde', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conceição Dos Ouros', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cônego Marinho', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Confins', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Congonhal', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Congonhas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Congonhas do Norte', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conquista', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conselheiro Lafaiete', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conselheiro Pena', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Consolação', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Contagem', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coqueiral', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coração de Jesus', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cordisburgo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cordislândia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Corinto', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coroaci', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coromandel', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coronel Fabriciano', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coronel Murta', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coronel Pacheco', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coronel Xavier Chaves', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Córrego Danta', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Córrego do Bom Jesus', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Córrego Fundo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Córrego Novo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Couto de Magalhães de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Crisólita', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cristais', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cristália', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cristiano Otoni', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cristina', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Crucilândia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cruzeiro da Fortaleza', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cruzília', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cuparaque', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Curral de Dentro', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Curvelo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Datas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Delfim Moreira', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Delfinópolis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Delta', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Descoberto', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Desterro de Entre Rios', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Desterro do Melo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Diamantina', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Diogo de Vasconcelos', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dionísio', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Divinésia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Divino', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Divino Das Laranjeiras', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Divinolândia de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Divinópolis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Divisa Alegre', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Divisa Nova', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Divisópolis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dom Bosco', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dom Cavati', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dom Joaquim', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dom Silvério', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dom Viçoso', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dona Eusébia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dores de Campos', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dores de Guanhães', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dores do Indaiá', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dores do Turvo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Doresópolis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Douradoquara', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Durandé', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Elói Mendes', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Engenheiro Caldas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Engenheiro Navarro', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Entre Folhas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Entre Rios de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ervália', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Esmeraldas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Espera Feliz', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Espinosa', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Espírito Santo do Dourado', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Estiva', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Estrela Dalva', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Estrela do Indaiá', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Estrela do Sul', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Eugenópolis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ewbank da Câmara', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Extrema', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fama', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Faria Lemos', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Felício Dos Santos', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Gonçalo do Rio Preto', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Felisburgo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Felixlândia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fernandes Tourinho', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ferros', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fervedouro', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Florestal', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Formiga', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Formoso', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fortaleza de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fortuna de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Francisco Badaró', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Francisco Dumont', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Francisco sá', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Franciscópolis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Frei Gaspar', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Frei Inocêncio', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Frei Lagonegro', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fronteira', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fronteira Dos Vales', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fruta de Leite', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Frutal', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Funilândia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Galiléia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gameleiras', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Glaucilândia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Goiabeira', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Goianá', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gonçalves', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gonzaga', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gouveia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Governador Valadares', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Grão Mogol', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Grupiara', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guanhães', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guapé', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guaraciaba', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guaraciama', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guaranésia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guarani', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guarará', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guarda-mor', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guaxupé', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guidoval', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guimarânia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guiricema', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gurinhatã', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Heliodora', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iapu', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibertioga', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibiá', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibiaí', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibiracatu', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibiraci', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibirité', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibitiúra de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibituruna', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Icaraí de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Igarapé', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Igaratinga', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iguatama', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ijaci', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ilicínea', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Imbé de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Inconfidentes', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Indaiabira', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Indianópolis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ingaí', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Inhapim', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Inhaúma', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Inimutaba', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipaba', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipanema', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipatinga', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipiaçu', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipuiúna', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iraí de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itabira', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itabirinha', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itabirito', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itacambira', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itacarambi', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaguara', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaipé', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itajubá', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itamarandiba', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itamarati de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itambacuri', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itambé do Mato Dentro', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itamogi', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itamonte', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itanhandu', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itanhomi', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaobim', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapagipe', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapecerica', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapeva', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itatiaiuçu', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaú de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaúna', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaverava', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itinga', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itueta', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ituiutaba', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itumirim', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iturama', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itutinga', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaboticatubas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jacinto', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jacuí', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jacutinga', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaguaraçu', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaíba', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jampruca', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Janaúba', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Januária', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Japaraíba', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Japonvar', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jeceaba', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jenipapo de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jequeri', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jequitaí', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jequitibá', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jequitinhonha', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jesuânia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Joaíma', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Joanésia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('João Monlevade', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('João Pinheiro', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Joaquim Felício', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jordânia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('José Gonçalves de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('José Raydan', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Josenópolis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova União', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Juatuba', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Juiz de Fora', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Juramento', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Juruaia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Juvenília', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ladainha', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagamar', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa da Prata', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa Dos Patos', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa Dourada', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa Formosa', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa Grande', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa Santa', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lajinha', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lambari', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lamim', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Laranjal', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lassance', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lavras', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Leandro Ferreira', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Leme do Prado', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Leopoldina', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Liberdade', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lima Duarte', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Limeira do Oeste', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lontra', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Luisburgo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Luislândia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Luminárias', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Luz', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Machacalis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Machado', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Madre de Deus de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Malacacheta', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mamonas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Manga', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Manhuaçu', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Manhumirim', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mantena', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maravilhas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mar de Espanha', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maria da fé', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mariana', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marilac', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mário Campos', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maripá de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marliéria', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marmelópolis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Martinho Campos', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Martins Soares', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mata Verde', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Materlândia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mateus Leme', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Matias Barbosa', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Matias Cardoso', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Matipó', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mato Verde', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Matozinhos', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Matutina', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Medeiros', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Medina', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mendes Pimentel', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mercês', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mesquita', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Minas Novas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Minduri', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mirabela', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Miradouro', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Miraí', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Miravânia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Moeda', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Moema', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monjolos', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monsenhor Paulo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Montalvânia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monte Alegre de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monte Azul', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monte Belo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monte Carmelo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monte Formoso', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monte Santo de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Montes Claros', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monte Sião', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Montezuma', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Morada Nova de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Morro da Garça', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Morro do Pilar', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Munhoz', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Muriaé', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mutum', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Muzambinho', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nacip Raydan', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nanuque', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Naque', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Natalândia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Natércia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nazareno', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nepomuceno', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ninheira', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Belém', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Era', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Lima', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Módica', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Ponte', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Porteirinha', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Resende', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Serrana', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Cruzeiro', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Oriente de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novorizonte', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Olaria', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Olhos-d''água', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Olímpio Noronha', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Oliveira', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Oliveira Fortes', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Onça de Pitangui', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Oratórios', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Orizânia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ouro Branco', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ouro Fino', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ouro Preto', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ouro Verde de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Padre Carvalho', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Padre Paraíso', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paineiras', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pains', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pai Pedro', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paiva', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palma', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palmópolis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Papagaios', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paracatu', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pará de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paraguaçu', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paraisópolis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paraopeba', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Passabém', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Passa Quatro', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Passa Tempo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Passa-vinte', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Passos', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Patis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Patos de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Patrocínio', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Patrocínio do Muriaé', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paula Cândido', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paulistas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pavão', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Peçanha', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedra Azul', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedra Bonita', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedra do Anta', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedra do Indaiá', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedra Dourada', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedralva', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedras de Maria da Cruz', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedrinópolis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedro Leopoldo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedro Teixeira', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pequeri', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pequi', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Perdigão', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Perdizes', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Perdões', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Periquito', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pescador', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piau', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piedade de Caratinga', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piedade de Ponte Nova', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piedade do Rio Grande', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piedade Dos Gerais', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pimenta', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pingo-d''água', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pintópolis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piracema', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pirajuba', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piranga', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piranguçu', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piranguinho', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pirapetinga', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pirapora', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piraúba', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pitangui', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piumhi', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Planura', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Poço Fundo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Poços de Caldas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pocrane', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pompéu', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ponte Nova', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ponto Chique', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ponto Dos Volantes', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porteirinha', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Firme', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Poté', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pouso Alegre', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pouso Alto', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Prados', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Prata', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pratápolis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pratinha', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Presidente Bernardes', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Presidente Juscelino', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Presidente Kubitschek', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Presidente Olegário', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alto Jequitibá', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Prudente de Morais', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quartel Geral', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Queluzito', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Raposos', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Raul Soares', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Recreio', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Reduto', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Resende Costa', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Resplendor', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ressaquinha', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Riachinho', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Riacho Dos Machados', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ribeirão Das Neves', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ribeirão Vermelho', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Acima', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Casca', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Doce', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio do Prado', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Espera', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Manso', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Novo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Paranaíba', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Pardo de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Piracicaba', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Pomba', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Preto', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Vermelho', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ritápolis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rochedo de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rodeiro', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Romaria', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rosário da Limeira', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rubelita', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rubim', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sabará', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sabinópolis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sacramento', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Salinas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Salto da Divisa', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Bárbara', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Bárbara do Leste', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Bárbara do Monte Verde', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Bárbara do Tugúrio', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Cruz de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Cruz de Salinas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Cruz do Escalvado', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Efigênia de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa fé de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Helena de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Juliana', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Luzia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Margarida', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Maria de Itabira', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Maria do Salto', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Maria do Suaçuí', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santana da Vargem', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santana de Cataguases', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santana de Pirapama', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santana do Deserto', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santana do Garambéu', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santana do Jacaré', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santana do Manhuaçu', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santana do Paraíso', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santana do Riacho', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santana Dos Montes', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Rita de Caldas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Rita de Jacutinga', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Rita de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Rita de Ibitipoca', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Rita do Itueto', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Rita do Sapucaí', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Rosa da Serra', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Vitória', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio do Amparo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio do Aventureiro', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio do Grama', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio do Itambé', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio do Jacinto', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio do Monte', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio do Retiro', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio do Rio Abaixo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Hipólito', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santos Dumont', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Bento Abade', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Brás do Suaçuí', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Domingos Das Dores', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Domingos do Prata', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Félix de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Francisco', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Francisco de Paula', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Francisco de Sales', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Francisco do Glória', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Geraldo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Geraldo da Piedade', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Geraldo do Baixio', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Gonçalo do Abaeté', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Gonçalo do Pará', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Gonçalo do Rio Abaixo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Gonçalo do Sapucaí', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Gotardo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João Batista do Glória', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João da Lagoa', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João da Mata', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João da Ponte', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João Das Missões', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João Del Rei', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João do Manhuaçu', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João do Manteninha', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João do Oriente', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João do Pacuí', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João do Paraíso', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João Evangelista', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João Nepomuceno', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Joaquim de Bicas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José da Barra', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José da Lapa', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José da Safira', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José da Varginha', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Alegre', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Divino', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Goiabal', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Jacuri', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Mantimento', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Lourenço', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Miguel do Anta', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Pedro da União', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Pedro Dos Ferros', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Pedro do Suaçuí', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Romão', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Roque de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Sebastião da Bela Vista', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Sebastião da Vargem Alegre', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Sebastião do Anta', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Sebastião do Maranhão', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Sebastião do Oeste', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Sebastião do Paraíso', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Sebastião do Rio Preto', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Sebastião do Rio Verde', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Tiago', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Tomás de Aquino', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Thomé Das Letras', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Vicente de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sapucaí-mirim', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sardoá', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sarzedo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Setubinha', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sem-peixe', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Senador Amaral', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Senador Cortes', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Senador Firmino', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Senador José Bento', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Senador Modestino Gonçalves', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Senhora de Oliveira', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Senhora do Porto', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Senhora Dos Remédios', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sericita', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Seritinga', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serra Azul de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serra da Saudade', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serra Dos Aimorés', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serra do Salitre', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serrania', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serranópolis de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serranos', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serro', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sete Lagoas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Silveirânia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Silvianópolis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Simão Pereira', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Simonésia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sobrália', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Soledade de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tabuleiro', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Taiobeiras', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Taparuba', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tapira', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tapiraí', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Taquaraçu de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tarumirim', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Teixeiras', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Teófilo Otoni', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Timóteo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tiradentes', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tiros', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tocantins', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tocos do Moji', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Toledo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tombos', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Três Corações', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Três Marias', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Três Pontas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tumiritinga', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tupaciguara', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Turmalina', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Turvolândia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ubá', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ubaí', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ubaporanga', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Uberaba', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Uberlândia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Umburatiba', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Unaí', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('União de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Uruana de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Urucânia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Urucuia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vargem Alegre', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vargem Bonita', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vargem Grande do Rio Pardo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Varginha', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Varjão de Minas', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Várzea da Palma', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Varzelândia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vazante', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Verdelândia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Veredinha', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Veríssimo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vermelho Novo', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vespasiano', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Viçosa', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vieiras', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mathias Lobato', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Virgem da Lapa', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Virgínia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Virginópolis', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Virgolândia', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Visconde do Rio Branco', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Volta Grande', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Wenceslau Braz', 12);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Afonso Cláudio', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Águia Branca', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Água Doce do Norte', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alegre', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alfredo Chaves', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alto Rio Novo', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Anchieta', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Apiacá', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aracruz', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Atilio Vivacqua', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Baixo Guandu', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra de São Francisco', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boa Esperança', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Jesus do Norte', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brejetuba', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cachoeiro de Itapemirim', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cariacica', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Castelo', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Colatina', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conceição da Barra', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conceição do Castelo', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Divino de São Lourenço', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Domingos Martins', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dores do Rio Preto', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ecoporanga', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fundão', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Governador Lindenberg', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guaçuí', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guarapari', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibatiba', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibiraçu', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibitirama', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iconha', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Irupi', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaguaçu', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapemirim', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itarana', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iúna', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaguaré', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jerônimo Monteiro', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('João Neiva', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Laranja da Terra', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Linhares', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mantenópolis', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marataízes', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marechal Floriano', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marilândia', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mimoso do Sul', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Montanha', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mucurici', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Muniz Freire', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Muqui', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Venécia', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pancas', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedro Canário', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pinheiros', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piúma', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ponto Belo', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Presidente Kennedy', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Bananal', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Novo do Sul', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Leopoldina', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Maria de Jetibá', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Teresa', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Domingos do Norte', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Gabriel da Palha', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Calçado', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Mateus', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Roque do Canaã', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serra', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sooretama', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vargem Alta', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Venda Nova do Imigrante', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Viana', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vila Pavão', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vila Valério', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vila Velha', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vitória', 7);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Angra Dos Reis', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aperibé', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araruama', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Areal', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Armação Dos Búzios', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arraial do Cabo', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra do Piraí', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra Mansa', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Belford Roxo', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Jardim', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Jesus do Itabapoana', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cabo Frio', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cachoeiras de Macacu', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cambuci', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carapebus', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Comendador Levy Gasparian', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campos Dos Goytacazes', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cantagalo', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cardoso Moreira', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carmo', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Casimiro de Abreu', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conceição de Macabu', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cordeiro', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Duas Barras', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Duque de Caxias', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Engenheiro Paulo de Frontin', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guapimirim', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iguaba Grande', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaboraí', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaguaí', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Italva', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaocara', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaperuna', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itatiaia', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Japeri', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Laje do Muriaé', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Macaé', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Macuco', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Magé', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mangaratiba', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maricá', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mendes', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mesquita', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Miguel Pereira', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Miracema', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Natividade', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nilópolis', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Niterói', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Friburgo', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Iguaçu', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paracambi', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paraíba do Sul', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Parati', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paty do Alferes', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Petrópolis', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pinheiral', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piraí', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porciúncula', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Real', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quatis', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Queimados', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quissamã', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Resende', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Bonito', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Claro', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Das Flores', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Das Ostras', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio de Janeiro', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Maria Madalena', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio de Pádua', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Francisco de Itabapoana', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Fidélis', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Gonçalo', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João da Barra', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João de Meriti', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José de Ubá', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Vale do Rio Preto', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Pedro da Aldeia', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Sebastião do Alto', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sapucaia', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Saquarema', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Seropédica', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Silva Jardim', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sumidouro', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tanguá', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Teresópolis', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Trajano de Morais', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Três Rios', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Valença', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Varre-sai', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vassouras', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Volta Redonda', 18);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Adamantina', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Adolfo', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aguaí', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Águas da Prata', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Águas de Lindóia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Águas de Santa Bárbara', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Águas de São Pedro', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Agudos', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alambari', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alfredo Marcondes', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Altair', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Altinópolis', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alto Alegre', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alumínio', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Álvares Florence', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Álvares Machado', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Álvaro de Carvalho', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alvinlândia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Americana', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Américo Brasiliense', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Américo de Campos', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Amparo', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Analândia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Andradina', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Angatuba', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Anhembi', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Anhumas', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aparecida', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aparecida D''oeste', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Apiaí', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araçariguama', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araçatuba', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araçoiaba da Serra', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aramina', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arandu', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arapeí', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araraquara', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araras', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arco-íris', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arealva', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Areias', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Areiópolis', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ariranha', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Artur Nogueira', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arujá', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aspásia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Assis', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Atibaia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Auriflama', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Avaí', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Avanhandava', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Avaré', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bady Bassitt', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Balbinos', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bálsamo', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bananal', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barão de Antonina', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barbosa', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bariri', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra Bonita', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra do Chapéu', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra do Turvo', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barretos', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barrinha', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barueri', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bastos', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Batatais', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bauru', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bebedouro', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bento de Abreu', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bernardino de Campos', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bertioga', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bilac', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Birigui', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Biritiba-mirim', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boa Esperança do Sul', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bocaina', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bofete', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boituva', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Jesus Dos Perdões', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Sucesso de Itararé', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Borá', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boracéia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Borborema', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Borebi', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Botucatu', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bragança Paulista', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Braúna', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brejo Alegre', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brodowski', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brotas', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Buri', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Buritama', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Buritizal', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cabrália Paulista', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cabreúva', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caçapava', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cachoeira Paulista', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caconde', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cafelândia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caiabu', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caieiras', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caiuá', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cajamar', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cajati', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cajobi', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cajuru', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campina do Monte Alegre', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campinas', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo Limpo Paulista', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campos do Jordão', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campos Novos Paulista', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cananéia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Canas', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cândido Mota', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cândido Rodrigues', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Canitar', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capão Bonito', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capela do Alto', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capivari', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caraguatatuba', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carapicuíba', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cardoso', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Casa Branca', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cássia Dos Coqueiros', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Castilho', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Catanduva', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Catiguá', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cedral', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cerqueira César', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cerquilho', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cesário Lange', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Charqueada', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Clementina', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Colina', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Colômbia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conchal', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conchas', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cordeirópolis', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coroados', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coronel Macedo', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Corumbataí', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cosmópolis', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cosmorama', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cotia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cravinhos', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cristais Paulista', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cruzália', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cruzeiro', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cubatão', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cunha', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Descalvado', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Diadema', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dirce Reis', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Divinolândia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dobrada', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dois Córregos', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dolcinópolis', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dourado', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dracena', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Duartina', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dumont', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Echaporã', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Eldorado', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Elias Fausto', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Elisiário', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Embaúba', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Embu', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Embu-guaçu', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Emilianópolis', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Engenheiro Coelho', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Espírito Santo do Pinhal', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Espírito Santo do Turvo', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Estrela D''oeste', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Estrela do Norte', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Euclides da Cunha Paulista', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fartura', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fernandópolis', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fernando Prestes', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fernão', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ferraz de Vasconcelos', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Flora Rica', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Floreal', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Flórida Paulista', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Florínia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Franca', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Francisco Morato', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Franco da Rocha', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gabriel Monteiro', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gália', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Garça', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gastão Vidigal', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gavião Peixoto', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('General Salgado', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Getulina', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Glicério', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guaiçara', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guaimbê', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guaíra', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guapiaçu', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guapiara', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guará', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guaraçaí', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guaraci', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guarani D''oeste', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guarantã', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guararapes', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guararema', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guaratinguetá', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guareí', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guariba', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guarujá', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guarulhos', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guatapará', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guzolândia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Herculândia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Holambra', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Hortolândia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iacanga', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iacri', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iaras', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibaté', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibirá', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibirarema', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibitinga', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibiúna', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Icém', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iepê', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Igaraçu do Tietê', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Igarapava', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Igaratá', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iguape', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ilhabela', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ilha Comprida', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ilha Solteira', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Indaiatuba', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Indiana', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Indiaporã', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Inúbia Paulista', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipaussu', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iperó', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipeúna', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipiguá', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iporanga', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipuã', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iracemápolis', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Irapuã', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Irapuru', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaberá', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaí', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itajobi', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaju', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itanhaém', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaóca', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapecerica da Serra', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapetininga', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapeva', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapevi', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapira', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapirapuã Paulista', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itápolis', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaporanga', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapuí', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapura', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaquaquecetuba', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itararé', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itariri', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itatiba', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itatinga', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itirapina', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itirapuã', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itobi', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itu', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itupeva', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ituverava', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaborandi', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaboticabal', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jacareí', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaci', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jacupiranga', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaguariúna', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jales', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jambeiro', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jandira', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jardinópolis', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jarinu', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaú', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jeriquara', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Joanópolis', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('João Ramalho', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('José Bonifácio', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Júlio Mesquita', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jumirim', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jundiaí', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Junqueirópolis', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Juquiá', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Juquitiba', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoinha', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Laranjal Paulista', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lavínia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lavrinhas', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Leme', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lençóis Paulista', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Limeira', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lindóia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lins', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lorena', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lourdes', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Louveira', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lucélia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lucianópolis', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Luís Antônio', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Luiziânia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lupércio', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lutécia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Macatuba', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Macaubal', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Macedônia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Magda', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mairinque', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mairiporã', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Manduri', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marabá Paulista', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maracaí', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marapoama', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mariápolis', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marília', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marinópolis', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Martinópolis', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Matão', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mauá', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mendonça', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Meridiano', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mesópolis', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Miguelópolis', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mineiros do Tietê', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Miracatu', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mira Estrela', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mirandópolis', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mirante do Paranapanema', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mirassol', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mirassolândia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mococa', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Moji Das Cruzes', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mogi Guaçu', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Moji-mirim', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mombuca', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monções', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mongaguá', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monte Alegre do Sul', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monte Alto', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monte Aprazível', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monte Azul Paulista', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monte Castelo', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monteiro Lobato', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monte Mor', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Morro Agudo', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Morungaba', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Motuca', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Murutinga do Sul', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nantes', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Narandiba', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Natividade da Serra', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nazaré Paulista', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Neves Paulista', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nhandeara', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nipoã', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Aliança', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Campina', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Canaã Paulista', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Castilho', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Europa', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Granada', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Guataporanga', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Independência', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novais', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Luzitânia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Odessa', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Horizonte', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nuporanga', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ocauçu', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Óleo', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Olímpia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Onda Verde', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Oriente', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Orindiúva', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Orlândia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Osasco', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Oscar Bressane', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Osvaldo Cruz', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ourinhos', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ouroeste', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ouro Verde', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pacaembu', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palestina', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palmares Paulista', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palmeira D''oeste', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palmital', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Panorama', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paraguaçu Paulista', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paraibuna', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paraíso', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paranapanema', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paranapuã', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Parapuã', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pardinho', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pariquera-açu', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Parisi', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Patrocínio Paulista', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paulicéia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paulínia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paulistânia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paulo de Faria', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pederneiras', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedra Bela', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedranópolis', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedregulho', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedreira', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedrinhas Paulista', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedro de Toledo', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Penápolis', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pereira Barreto', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pereiras', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Peruíbe', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piacatu', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piedade', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pilar do Sul', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pindamonhangaba', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pindorama', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pinhalzinho', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piquerobi', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piquete', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piracaia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piracicaba', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piraju', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pirajuí', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pirangi', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pirapora do Bom Jesus', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pirapozinho', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pirassununga', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piratininga', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pitangueiras', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Planalto', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Platina', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Poá', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Poloni', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pompéia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pongaí', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pontal', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pontalinda', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pontes Gestal', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Populina', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porangaba', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Feliz', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Ferreira', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Potim', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Potirendaba', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pracinha', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pradópolis', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Praia Grande', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pratânia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Presidente Alves', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Presidente Bernardes', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Presidente Epitácio', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Presidente Prudente', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Presidente Venceslau', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Promissão', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quadra', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quatá', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Queiroz', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Queluz', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quintana', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rafard', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rancharia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Redenção da Serra', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Regente Feijó', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Reginópolis', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Registro', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Restinga', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ribeira', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ribeirão Bonito', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ribeirão Branco', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ribeirão Corrente', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ribeirão do Sul', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ribeirão Dos Índios', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ribeirão Grande', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ribeirão Pires', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ribeirão Preto', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Riversul', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rifaina', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rincão', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rinópolis', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Claro', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Das Pedras', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Grande da Serra', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Riolândia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rosana', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Roseira', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rubiácea', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rubinéia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sabino', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sagres', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sales', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sales Oliveira', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Salesópolis', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Salmourão', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Saltinho', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Salto', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Salto de Pirapora', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Salto Grande', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sandovalina', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Adélia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Albertina', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Bárbara D''oeste', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Branca', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Clara D''oeste', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Cruz da Conceição', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Cruz da Esperança', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Cruz Das Palmeiras', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Cruz do Rio Pardo', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Ernestina', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa fé do Sul', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Gertrudes', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Isabel', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Lúcia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Maria da Serra', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Mercedes', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santana da Ponte Pensa', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santana de Parnaíba', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Rita D''oeste', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Rita do Passa Quatro', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Rosa de Viterbo', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Salete', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Anastácio', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo André', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio da Alegria', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio de Posse', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio do Aracanguá', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio do Jardim', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio do Pinhal', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Expedito', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santópolis do Aguapeí', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santos', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Bento do Sapucaí', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Bernardo do Campo', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Caetano do Sul', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Carlos', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Francisco', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João da Boa Vista', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João Das Duas Pontes', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João de Iracema', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João do Pau D''alho', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Joaquim da Barra', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José da Bela Vista', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Barreiro', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Rio Pardo', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Rio Preto', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José Dos Campos', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Lourenço da Serra', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Luís do Paraitinga', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Manuel', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Miguel Arcanjo', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Paulo', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Pedro', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Pedro do Turvo', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Roque', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Sebastião', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Sebastião da Grama', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Simão', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Vicente', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sarapuí', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sarutaiá', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sebastianópolis do Sul', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serra Azul', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serrana', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serra Negra', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sertãozinho', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sete Barras', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Severínia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Silveiras', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Socorro', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sorocaba', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sud Mennucci', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sumaré', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Suzano', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Suzanápolis', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tabapuã', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tabatinga', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Taboão da Serra', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Taciba', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Taguaí', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Taiaçu', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Taiúva', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tambaú', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tanabi', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tapiraí', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tapiratiba', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Taquaral', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Taquaritinga', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Taquarituba', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Taquarivaí', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tarabai', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tarumã', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tatuí', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Taubaté', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tejupá', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Teodoro Sampaio', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Terra Roxa', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tietê', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Timburi', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Torre de Pedra', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Torrinha', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Trabiju', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tremembé', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Três Fronteiras', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tuiuti', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tupã', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tupi Paulista', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Turiúba', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Turmalina', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ubarana', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ubatuba', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ubirajara', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Uchoa', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('União Paulista', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Urânia', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Uru', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Urupês', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Valentim Gentil', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Valinhos', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Valparaíso', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vargem', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vargem Grande do Sul', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vargem Grande Paulista', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Várzea Paulista', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vera Cruz', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vinhedo', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Viradouro', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vista Alegre do Alto', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vitória Brasil', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Votorantim', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Votuporanga', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Zacarias', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Chavantes', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Estiva Gerbi', 24);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Abatiá', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Adrianópolis', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Agudos do Sul', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Almirante Tamandaré', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Altamira do Paraná', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Altônia', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alto Paraná', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alto Piquiri', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alvorada do Sul', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Amaporã', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ampére', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Anahy', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Andirá', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ângulo', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Antonina', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Antônio Olinto', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Apucarana', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arapongas', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arapoti', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arapuã', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araruna', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araucária', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ariranha do Ivaí', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Assaí', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Assis Chateaubriand', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Astorga', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Atalaia', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Balsa Nova', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bandeirantes', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barbosa Ferraz', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barracão', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra do Jacaré', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bela Vista da Caroba', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bela Vista do Paraíso', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bituruna', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boa Esperança', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boa Esperança do Iguaçu', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boa Ventura de São Roque', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boa Vista da Aparecida', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bocaiúva do Sul', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Jesus do Sul', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Sucesso', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Sucesso do Sul', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Borrazópolis', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Braganey', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brasilândia do Sul', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cafeara', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cafelândia', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cafezal do Sul', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Califórnia', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cambará', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cambé', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cambira', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campina da Lagoa', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campina do Simão', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campina Grande do Sul', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo Bonito', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo do Tenente', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo Largo', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo Magro', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo Mourão', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cândido de Abreu', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Candói', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cantagalo', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capanema', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capitão Leônidas Marques', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carambeí', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carlópolis', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cascavel', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Castro', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Catanduvas', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Centenário do Sul', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cerro Azul', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Céu Azul', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Chopinzinho', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cianorte', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cidade Gaúcha', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Clevelândia', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Colombo', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Colorado', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Congonhinhas', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conselheiro Mairinck', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Contenda', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Corbélia', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cornélio Procópio', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coronel Domingos Soares', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coronel Vivida', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Corumbataí do Sul', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cruzeiro do Iguaçu', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cruzeiro do Oeste', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cruzeiro do Sul', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cruz Machado', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cruzmaltina', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Curitiba', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Curiúva', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Diamante do Norte', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Diamante do Sul', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Diamante D''oeste', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dois Vizinhos', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Douradina', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Doutor Camargo', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Enéas Marques', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Engenheiro Beltrão', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Esperança Nova', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Entre Rios do Oeste', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Espigão Alto do Iguaçu', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Farol', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Faxinal', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fazenda Rio Grande', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fênix', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fernandes Pinheiro', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Figueira', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Floraí', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Flor da Serra do Sul', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Floresta', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Florestópolis', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Flórida', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Formosa do Oeste', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Foz do Iguaçu', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Francisco Alves', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Francisco Beltrão', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Foz do Jordão', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('General Carneiro', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Godoy Moreira', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Goioerê', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Goioxim', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Grandes Rios', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guaíra', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guairaçá', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guamiranga', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guapirama', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guaporema', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guaraci', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guaraniaçu', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guarapuava', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guaraqueçaba', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guaratuba', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Honório Serpa', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibaiti', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibema', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibiporã', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Icaraíma', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iguaraçu', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iguatu', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Imbaú', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Imbituva', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Inácio Martins', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Inajá', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Indianópolis', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipiranga', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iporã', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iracema do Oeste', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Irati', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iretama', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaguajé', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaipulândia', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itambaracá', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itambé', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapejara D''oeste', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaperuçu', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaúna do Sul', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ivaí', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ivaiporã', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ivaté', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ivatuba', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaboti', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jacarezinho', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaguapitã', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaguariaíva', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jandaia do Sul', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Janiópolis', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Japira', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Japurá', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jardim Alegre', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jardim Olinda', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jataizinho', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jesuítas', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Joaquim Távora', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jundiaí do Sul', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Juranda', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jussara', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Kaloré', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lapa', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Laranjal', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Laranjeiras do Sul', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Leópolis', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lidianópolis', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lindoeste', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Loanda', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lobato', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Londrina', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Luiziana', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lunardelli', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lupionópolis', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mallet', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mamborê', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mandaguaçu', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mandaguari', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mandirituba', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Manfrinópolis', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mangueirinha', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Manoel Ribas', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marechal Cândido Rondon', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maria Helena', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marialva', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marilândia do Sul', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marilena', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mariluz', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maringá', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mariópolis', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maripá', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marmeleiro', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marquinho', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marumbi', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Matelândia', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Matinhos', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mato Rico', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mauá da Serra', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Medianeira', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mercedes', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mirador', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Miraselva', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Missal', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Moreira Sales', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Morretes', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Munhoz de Melo', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nossa Senhora Das Graças', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Aliança do Ivaí', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova América da Colina', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Aurora', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Cantu', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Esperança', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Esperança do Sudoeste', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Fátima', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Laranjeiras', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Londrina', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Olímpia', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Santa Bárbara', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Santa Rosa', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Prata do Iguaçu', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Tebas', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Itacolomi', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ortigueira', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ourizona', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ouro Verde do Oeste', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paiçandu', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palmas', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palmeira', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palmital', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palotina', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paraíso do Norte', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paranacity', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paranaguá', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paranapoema', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paranavaí', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pato Bragado', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pato Branco', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paula Freitas', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paulo Frontin', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Peabiru', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Perobal', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pérola', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pérola D''oeste', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piên', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pinhais', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pinhalão', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pinhal de São Bento', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pinhão', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piraí do Sul', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piraquara', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pitanga', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pitangueiras', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Planaltina do Paraná', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Planalto', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ponta Grossa', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pontal do Paraná', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porecatu', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Amazonas', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Barreiro', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Rico', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Vitória', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Prado Ferreira', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pranchita', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Presidente Castelo Branco', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Primeiro de Maio', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Prudentópolis', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quarto Centenário', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quatiguá', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quatro Barras', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quatro Pontes', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quedas do Iguaçu', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Querência do Norte', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quinta do Sol', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quitandinha', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ramilândia', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rancho Alegre', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rancho Alegre D''oeste', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Realeza', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rebouças', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Renascença', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Reserva', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Reserva do Iguaçu', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ribeirão Claro', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ribeirão do Pinhal', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Azul', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Bom', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Bonito do Iguaçu', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Branco do Ivaí', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Branco do Sul', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Negro', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rolândia', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Roncador', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rondon', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rosário do Ivaí', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sabáudia', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Salgado Filho', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Salto do Itararé', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Salto do Lontra', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Amélia', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Cecília do Pavão', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Cruz de Monte Castelo', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa fé', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Helena', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Inês', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Isabel do Ivaí', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Izabel do Oeste', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Lúcia', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Maria do Oeste', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Mariana', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Mônica', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santana do Itararé', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Tereza do Oeste', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Terezinha de Itaipu', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio da Platina', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio do Caiuá', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio do Paraíso', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio do Sudoeste', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Inácio', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Carlos do Ivaí', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Jerônimo da Serra', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João do Caiuá', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João do Ivaí', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João do Triunfo', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Jorge D''oeste', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Jorge do Ivaí', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Jorge do Patrocínio', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José da Boa Vista', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José Das Palmeiras', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José Dos Pinhais', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Manoel do Paraná', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Mateus do Sul', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Miguel do Iguaçu', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Pedro do Iguaçu', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Pedro do Ivaí', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Pedro do Paraná', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Sebastião da Amoreira', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Tomé', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sapopema', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sarandi', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Saudade do Iguaçu', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sengés', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serranópolis do Iguaçu', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sertaneja', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sertanópolis', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Siqueira Campos', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sulina', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tamarana', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tamboara', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tapejara', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tapira', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Teixeira Soares', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Telêmaco Borba', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Terra Boa', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Terra Rica', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Terra Roxa', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tibagi', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tijucas do Sul', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Toledo', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tomazina', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Três Barras do Paraná', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tunas do Paraná', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tuneiras do Oeste', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tupãssi', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Turvo', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ubiratã', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Umuarama', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('União da Vitória', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Uniflor', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Uraí', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Wenceslau Braz', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ventania', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vera Cruz do Oeste', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Verê', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vila Alta', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Doutor Ulysses', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Virmond', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vitorino', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Xambrê', 15);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Abdon Batista', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Abelardo Luz', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Agrolândia', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Agronômica', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Água Doce', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Águas de Chapecó', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Águas Frias', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Águas Mornas', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alfredo Wagner', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alto Bela Vista', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Anchieta', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Angelina', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Anita Garibaldi', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Anitápolis', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Antônio Carlos', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Apiúna', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arabutã', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araquari', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araranguá', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Armazém', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arroio Trinta', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arvoredo', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ascurra', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Atalanta', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aurora', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Balneário Arroio do Silva', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Balneário Camboriú', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Balneário Barra do Sul', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Balneário Gaivota', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bandeirante', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra Bonita', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra Velha', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bela Vista do Toldo', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Belmonte', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Benedito Novo', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Biguaçu', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Blumenau', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bocaina do Sul', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bombinhas', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Jardim da Serra', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Jesus', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Jesus do Oeste', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Retiro', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Botuverá', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Braço do Norte', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Braço do Trombudo', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brunópolis', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brusque', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caçador', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caibi', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Calmon', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Camboriú', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capão Alto', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo Alegre', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo Belo do Sul', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo Erê', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campos Novos', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Canelinha', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Canoinhas', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capinzal', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capivari de Baixo', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Catanduvas', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caxambu do Sul', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Celso Ramos', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cerro Negro', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Chapadão do Lageado', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Chapecó', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cocal do Sul', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Concórdia', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cordilheira Alta', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coronel Freitas', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coronel Martins', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Corupá', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Correia Pinto', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Criciúma', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cunha Porã', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cunhataí', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Curitibanos', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Descanso', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dionísio Cerqueira', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dona Emma', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Doutor Pedrinho', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Entre Rios', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ermo', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Erval Velho', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Faxinal Dos Guedes', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Flor do Sertão', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Florianópolis', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Formosa do Sul', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Forquilhinha', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fraiburgo', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Frei Rogério', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Galvão', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Garopaba', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Garuva', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gaspar', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Governador Celso Ramos', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Grão Pará', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gravatal', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guabiruba', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guaraciaba', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guaramirim', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guarujá do Sul', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guatambú', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Herval D''oeste', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibiam', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibicaré', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibirama', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Içara', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ilhota', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Imaruí', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Imbituba', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Imbuia', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Indaial', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iomerê', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipira', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iporã do Oeste', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipuaçu', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipumirim', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iraceminha', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Irani', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Irati', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Irineópolis', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itá', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaiópolis', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itajaí', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapema', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapiranga', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapoá', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ituporanga', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaborá', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jacinto Machado', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaguaruna', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaraguá do Sul', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jardinópolis', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Joaçaba', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Joinville', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('José Boiteux', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jupiá', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lacerdópolis', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lages', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Laguna', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lajeado Grande', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Laurentino', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lauro Muller', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lebon Régis', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Leoberto Leal', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lindóia do Sul', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lontras', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Luiz Alves', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Luzerna', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Macieira', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mafra', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Major Gercino', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Major Vieira', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maracajá', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maravilha', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marema', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Massaranduba', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Matos Costa', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Meleiro', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mirim Doce', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Modelo', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mondaí', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monte Carlo', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monte Castelo', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Morro da Fumaça', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Morro Grande', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Navegantes', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Erechim', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Itaberaba', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Trento', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Veneza', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Horizonte', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Orleans', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Otacílio Costa', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ouro', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ouro Verde', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paial', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Painel', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palhoça', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palma Sola', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palmeira', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palmitos', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Papanduva', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paraíso', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Passo de Torres', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Passos Maia', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paulo Lopes', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedras Grandes', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Penha', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Peritiba', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pescaria Brava', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Petrolândia', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piçarras', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pinhalzinho', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pinheiro Preto', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piratuba', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Planalto Alegre', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pomerode', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ponte Alta', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ponte Alta do Norte', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ponte Serrada', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Belo', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto União', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pouso Redondo', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Praia Grande', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Presidente Castelo Branco', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Presidente Getúlio', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Presidente Nereu', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Princesa', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quilombo', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rancho Queimado', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Das Antas', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio do Campo', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio do Oeste', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Dos Cedros', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio do Sul', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Fortuna', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Negrinho', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Rufino', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Riqueza', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rodeio', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Romelândia', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Salete', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Saltinho', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Salto Veloso', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sangão', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Cecília', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Helena', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Rosa de Lima', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Rosa do Sul', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Terezinha', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Terezinha do Progresso', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santiago do Sul', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Amaro da Imperatriz', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Bernardino', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Bento do Sul', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Bonifácio', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Carlos', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Cristovão do Sul', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Domingos', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Francisco do Sul', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João do Oeste', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João Batista', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João do Itaperiú', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João do Sul', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Joaquim', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Cedro', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Cerrito', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Lourenço do Oeste', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Ludgero', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Martinho', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Miguel da Boa Vista', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Miguel do Oeste', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Pedro de Alcântara', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Saudades', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Schroeder', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Seara', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serra Alta', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Siderópolis', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sombrio', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sul Brasil', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Taió', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tangará', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tigrinhos', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tijucas', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Timbé do Sul', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Timbó', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Timbó Grande', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Três Barras', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Treviso', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Treze de Maio', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Treze Tílias', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Trombudo Central', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tubarão', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tunápolis', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Turvo', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('União do Oeste', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Urubici', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Urupema', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Urussanga', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vargeão', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vargem', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vargem Bonita', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vidal Ramos', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Videira', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vitor Meireles', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Witmarsum', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Xanxerê', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Xavantina', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Xaxim', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Zortéa', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Balneário Rincão', 23);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aceguá', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Água Santa', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Agudo', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ajuricaba', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alecrim', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alegrete', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alegria', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Almirante Tamandaré do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alpestre', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alto Alegre', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alto Feliz', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alvorada', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Amaral Ferrador', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ametista do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('André da Rocha', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Anta Gorda', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Antônio Prado', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arambaré', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araricá', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aratiba', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arroio do Meio', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arroio do Sal', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arroio do Padre', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arroio Dos Ratos', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arroio do Tigre', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arroio Grande', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arvorezinha', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Augusto Pestana', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Áurea', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bagé', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Balneário Pinhal', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barão', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barão de Cotegipe', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barão do Triunfo', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barracão', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra do Guarita', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra do Quaraí', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra do Ribeiro', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra do Rio Azul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra Funda', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barros Cassal', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Benjamin Constant do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bento Gonçalves', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boa Vista Das Missões', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boa Vista do Buricá', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boa Vista do Cadeado', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boa Vista do Incra', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boa Vista do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Jesus', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Princípio', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Progresso', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Retiro do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Boqueirão do Leão', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bossoroca', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bozano', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Braga', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brochier', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Butiá', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caçapava do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cacequi', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cachoeira do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cachoeirinha', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cacique Doble', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caibaté', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caiçara', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Camaquã', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Camargo', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cambará do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campestre da Serra', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campina Das Missões', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campinas do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo Bom', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo Novo', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campos Borges', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Candelária', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cândido Godói', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Candiota', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Canela', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Canguçu', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Canoas', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Canudos do Vale', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capão Bonito do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capão da Canoa', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capão do Cipó', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capão do Leão', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capivari do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capela de Santana', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Capitão', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carazinho', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caraá', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carlos Barbosa', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carlos Gomes', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Casca', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caseiros', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Catuípe', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caxias do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Centenário', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cerrito', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cerro Branco', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cerro Grande', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cerro Grande do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cerro Largo', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Chapada', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Charqueadas', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Charrua', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Chiapetta', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Chuí', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Chuvisca', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cidreira', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ciríaco', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Colinas', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Colorado', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Condor', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Constantina', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coqueiro Baixo', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coqueiros do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coronel Barros', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coronel Bicaco', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coronel Pilar', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cotiporã', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coxilha', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Crissiumal', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cristal', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cristal do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cruz Alta', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cruzaltense', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cruzeiro do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('David Canabarro', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Derrubadas', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dezesseis de Novembro', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dilermando de Aguiar', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dois Irmãos', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dois Irmãos Das Missões', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dois Lajeados', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dom Feliciano', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dom Pedro de Alcântara', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dom Pedrito', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dona Francisca', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Doutor Maurício Cardoso', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Doutor Ricardo', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Eldorado do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Encantado', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Encruzilhada do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Engenho Velho', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Entre-ijuís', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Entre Rios do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Erebango', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Erechim', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ernestina', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Herval', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Erval Grande', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Erval Seco', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Esmeralda', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Esperança do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Espumoso', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Estação', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Estância Velha', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Esteio', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Estrela', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Estrela Velha', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Eugênio de Castro', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fagundes Varela', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Farroupilha', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Faxinal do Soturno', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Faxinalzinho', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fazenda Vilanova', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Feliz', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Flores da Cunha', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Floriano Peixoto', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fontoura Xavier', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Formigueiro', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Forquetinha', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fortaleza Dos Valos', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Frederico Westphalen', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Garibaldi', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Garruchos', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gaurama', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('General Câmara', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gentil', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Getúlio Vargas', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Giruá', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Glorinha', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gramado', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gramado Dos Loureiros', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gramado Xavier', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gravataí', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guabiju', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guaíba', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guaporé', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guarani Das Missões', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Harmonia', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Herveiras', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Horizontina', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Hulha Negra', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Humaitá', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibarama', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibiaçá', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibiraiaras', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibirapuitã', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ibirubá', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Igrejinha', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ijuí', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ilópolis', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Imbé', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Imigrante', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Independência', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Inhacorá', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipê', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipiranga do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iraí', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaara', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itacurubi', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapuca', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaqui', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itati', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itatiba do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ivorá', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ivoti', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaboticaba', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jacuizinho', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jacutinga', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaguarão', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaguari', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaquirana', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jari', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jóia', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Júlio de Castilhos', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa Bonita do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoão', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa Dos Três Cantos', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa Vermelha', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lajeado', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lajeado do Bugre', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lavras do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Liberato Salzano', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lindolfo Collor', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Linha Nova', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Machadinho', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maçambara', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mampituba', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Manoel Viana', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maquiné', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maratá', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marau', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marcelino Ramos', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mariana Pimentel', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mariano Moro', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marques de Souza', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mata', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mato Castelhano', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mato Leitão', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mato Queimado', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maximiliano de Almeida', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Minas do Leão', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Miraguaí', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Montauri', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monte Alegre Dos Campos', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monte Belo do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Montenegro', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mormaço', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Morrinhos do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Morro Redondo', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Morro Reuter', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mostardas', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Muçum', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Muitos Capões', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Muliterno', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Não-me-toque', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nicolau Vergueiro', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nonoai', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Alvorada', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Araçá', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Bassano', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Boa Vista', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Bréscia', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Candelária', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Esperança do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Hartz', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Pádua', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Palma', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Petrópolis', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Prata', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Ramada', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Roma do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Santa Rita', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Cabrais', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Hamburgo', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Machado', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Tiradentes', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Xingu', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Barreiro', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Osório', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paim Filho', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palmares do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palmeira Das Missões', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palmitinho', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Panambi', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pantano Grande', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paraí', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paraíso do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pareci Novo', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Parobé', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Passa Sete', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Passo do Sobrado', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Passo Fundo', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paulo Bento', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paverama', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedras Altas', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedro Osório', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pejuçara', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pelotas', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Picada Café', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pinhal', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pinhal da Serra', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pinhal Grande', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pinheirinho do Vale', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pinheiro Machado', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pinto Bandeira', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pirapó', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piratini', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Planalto', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Poço Das Antas', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pontão', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ponte Preta', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Portão', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Alegre', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Lucena', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Mauá', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Vera Cruz', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Xavier', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pouso Novo', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Presidente Lucena', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Progresso', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Protásio Alves', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Putinga', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quaraí', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quatro Irmãos', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quevedos', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quinze de Novembro', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Redentora', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Relvado', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Restinga Seca', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Dos Índios', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Grande', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Pardo', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Riozinho', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Roca Sales', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rodeio Bonito', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rolador', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rolante', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ronda Alta', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rondinha', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Roque Gonzales', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rosário do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sagrada Família', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Saldanha Marinho', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Salto do Jacuí', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Salvador Das Missões', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Salvador do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sananduva', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Bárbara do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Cecília do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Clara do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Cruz do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Maria', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Maria do Herval', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Margarida do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santana da Boa Vista', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santana do Livramento', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Rosa', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Tereza', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Vitória do Palmar', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santiago', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Ângelo', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio do Palma', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio da Patrulha', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio Das Missões', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio do Planalto', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Augusto', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Cristo', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Expedito do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Borja', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Domingos do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Francisco de Assis', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Francisco de Paula', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Gabriel', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Jerônimo', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João da Urtiga', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João do Polêsine', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Jorge', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José Das Missões', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Herval', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Hortêncio', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Inhacorá', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Norte', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Ouro', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José Dos Ausentes', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Leopoldo', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Lourenço do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Luiz Gonzaga', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Marcos', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Martinho', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Martinho da Serra', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Miguel Das Missões', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Nicolau', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Paulo Das Missões', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Pedro da Serra', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Pedro Das Missões', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Pedro do Butiá', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Pedro do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Sebastião do Caí', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Sepé', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Valentim', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Valentim do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Valério do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Vendelino', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Vicente do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sapiranga', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sapucaia do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sarandi', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Seberi', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sede Nova', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Segredo', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Selbach', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Senador Salgado Filho', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sentinela do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serafina Corrêa', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sério', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sertão', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sertão Santana', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sete de Setembro', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Severiano de Almeida', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Silveira Martins', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sinimbu', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sobradinho', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Soledade', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tabaí', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tapejara', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tapera', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tapes', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Taquara', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Taquari', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Taquaruçu do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tavares', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tenente Portela', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Terra de Areia', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Teutônia', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tio Hugo', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tiradentes do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Toropi', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Torres', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tramandaí', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Travesseiro', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Três Arroios', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Três Cachoeiras', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Três Coroas', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Três de Maio', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Três Forquilhas', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Três Palmeiras', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Três Passos', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Trindade do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Triunfo', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tucunduva', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tunas', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tupanci do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tupanciretã', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tupandi', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tuparendi', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Turuçu', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ubiretama', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('União da Serra', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Unistalda', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Uruguaiana', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vacaria', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vale Verde', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vale do Sol', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vale Real', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vanini', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Venâncio Aires', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vera Cruz', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Veranópolis', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vespasiano Correa', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Viadutos', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Viamão', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vicente Dutra', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Victor Graeff', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vila Flores', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vila Lângaro', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vila Maria', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vila Nova do Sul', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vista Alegre', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vista Alegre do Prata', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vista Gaúcha', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vitória Das Missões', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Westfalia', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Xangri-lá', 20);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Água Clara', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alcinópolis', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Amambaí', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Anastácio', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Anaurilândia', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Angélica', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Antônio João', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aparecida do Taboado', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aquidauana', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aral Moreira', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bandeirantes', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bataguassu', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Batayporã', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bela Vista', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bodoquena', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bonito', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brasilândia', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caarapó', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Camapuã', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo Grande', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caracol', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cassilândia', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Chapadão do Sul', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Corguinho', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coronel Sapucaia', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Corumbá', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Costa Rica', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Coxim', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Deodápolis', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dois Irmãos do Buriti', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Douradina', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dourados', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Eldorado', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fátima do Sul', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Figueirão', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Glória de Dourados', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guia Lopes da Laguna', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iguatemi', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Inocência', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaporã', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaquiraí', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ivinhema', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Japorã', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaraguari', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jardim', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jateí', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Juti', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ladário', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Laguna Carapã', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maracaju', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Miranda', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mundo Novo', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Naviraí', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nioaque', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Alvorada do Sul', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Andradina', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Horizonte do Sul', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paraíso das Águas', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paranaíba', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paranhos', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedro Gomes', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ponta Porã', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Murtinho', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ribas do Rio Pardo', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Brilhante', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Negro', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Verde de Mato Grosso', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rochedo', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Rita do Pardo', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Gabriel do Oeste', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sete Quedas', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Selvíria', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sidrolândia', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sonora', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tacuru', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Taquarussu', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Terenos', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Três Lagoas', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vicentina', 11);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Acorizal', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Água Boa', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alta Floresta', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alto Araguaia', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alto Boa Vista', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alto Garças', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alto Paraguai', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alto Taquari', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Apiacás', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araguaiana', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araguainha', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araputanga', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arenápolis', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aripuanã', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barão de Melgaço', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra do Bugres', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barra do Garças', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Jesus do Araguaia', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brasnorte', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cáceres', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campinápolis', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo Novo do Parecis', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo Verde', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campos de Júlio', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Canabrava do Norte', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Canarana', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carlinda', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Castanheira', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Chapada Dos Guimarães', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cláudia', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cocalinho', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Colíder', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Colniza', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Comodoro', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Confresa', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Conquista D''oeste', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cotriguaçu', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cuiabá', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Curvelândia', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Denise', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Diamantino', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Dom Aquino', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Feliz Natal', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Figueirópolis D''oeste', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gaúcha do Norte', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('General Carneiro', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Glória D''oeste', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guarantã do Norte', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guiratinga', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Indiavaí', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipiranga do Norte', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itanhangá', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaúba', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itiquira', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaciara', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jangada', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jauru', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Juara', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Juína', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Juruena', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Juscimeira', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lambari D''oeste', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lucas do Rio Verde', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Luciára', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vila Bela da Santíssima Trindade', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marcelândia', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Matupá', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mirassol D''oeste', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nobres', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nortelândia', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nossa Senhora do Livramento', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Bandeirantes', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Nazaré', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Lacerda', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Santa Helena', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Brasilândia', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Canaã do Norte', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Mutum', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Olímpia', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Ubiratã', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Xavantina', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Mundo', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Horizonte do Norte', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo São Joaquim', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paranaíta', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paranatinga', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Santo Antônio', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pedra Preta', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Peixoto de Azevedo', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Planalto da Serra', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Poconé', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pontal do Araguaia', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ponte Branca', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pontes e Lacerda', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Alegre do Norte', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Dos Gaúchos', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Esperidião', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porto Estrela', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Poxoréo', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Primavera do Leste', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Querência', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José Dos Quatro Marcos', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Reserva do Cabaçal', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ribeirão Cascalheira', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ribeirãozinho', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Branco', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Carmem', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Afonso', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Povo', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Rio Claro', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São José do Xingu', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Pedro da Cipa', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rondolândia', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rondonópolis', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rosário Oeste', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Cruz do Xingu', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Salto do Céu', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Rita do Trivelato', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Terezinha', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio do Leste', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio do Leverger', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Félix do Araguaia', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sapezal', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serra Nova Dourada', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sinop', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sorriso', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tabaporã', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tangará da Serra', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tapurah', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Terra Nova do Norte', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Tesouro', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Torixoréu', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('União do Sul', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vale de São Domingos', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Várzea Grande', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vera', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vila Rica', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Guarita', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Marilândia', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Maringá', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Monte Verde', 10);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Abadia de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Abadiânia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Acreúna', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Adelândia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Água Fria de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Água Limpa', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Águas Lindas de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alexânia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aloândia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alto Horizonte', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alto Paraíso de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Alvorada do Norte', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Amaralina', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Americano do Brasil', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Amorinópolis', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Anápolis', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Anhanguera', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Anicuns', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aparecida de Goiânia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aparecida do Rio Doce', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aporé', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araçu', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aragarças', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aragoiânia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Araguapaz', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Arenópolis', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aruanã', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Aurilândia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Avelinópolis', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Baliza', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Barro Alto', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bela Vista de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Jardim de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bom Jesus de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bonfinópolis', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Bonópolis', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brazabrantes', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Britânia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Buriti Alegre', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Buriti de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Buritinópolis', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cabeceiras', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cachoeira Alta', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cachoeira de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cachoeira Dourada', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caçu', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caiapônia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caldas Novas', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caldazinha', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campestre de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campinaçu', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campinorte', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo Alegre de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campo Limpo de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campos Belos', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Campos Verdes', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Carmo do Rio Verde', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Castelândia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Catalão', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Caturaí', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cavalcante', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ceres', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cezarina', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Chapadão do Céu', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cidade Ocidental', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cocalzinho de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Colinas do Sul', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Córrego do Ouro', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Corumbá de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Corumbaíba', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cristalina', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cristianópolis', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Crixás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cromínia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Cumari', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Damianópolis', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Damolândia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Davinópolis', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Diorama', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Doverlândia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Edealina', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Edéia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Estrela do Norte', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Faina', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Fazenda Nova', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Firminópolis', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Flores de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Formosa', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Formoso', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gameleira de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Divinópolis de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Goianápolis', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Goiandira', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Goianésia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Goiânia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Goianira', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Goiatuba', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Gouvelândia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guapó', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guaraíta', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guarani de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Guarinos', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Heitoraí', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Hidrolândia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Hidrolina', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iaciara', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Inaciolândia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Indiara', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Inhumas', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipameri', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ipiranga de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Iporá', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Israelândia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaberaí', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaguari', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itaguaru', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itajá', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapaci', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapirapuã', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itapuranga', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itarumã', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itauçu', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Itumbiara', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ivolândia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jandaia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaraguá', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jataí', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jaupaci', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jesúpolis', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Joviânia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Jussara', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Lagoa Santa', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Leopoldo de Bulhões', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Luziânia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mairipotaba', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mambaí', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mara Rosa', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Marzagão', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Matrinchã', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Maurilândia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mimoso de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Minaçu', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mineiros', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Moiporá', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Monte Alegre de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Montes Claros de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Montividiu', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Montividiu do Norte', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Morrinhos', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Morro Agudo de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mossâmedes', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mozarlândia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mundo Novo', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Mutunópolis', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nazário', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nerópolis', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Niquelândia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova América', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Aurora', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Crixás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Glória', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Iguaçu de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Roma', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Nova Veneza', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Brasil', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Gama', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Novo Planalto', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Orizona', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ouro Verde de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Ouvidor', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Padre Bernardo', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palestina de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palmeiras de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palmelo', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Palminópolis', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Panamá', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paranaiguara', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Paraúna', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Perolândia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Petrolina de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pilar de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piracanjuba', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Piranhas', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pirenópolis', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pires do Rio', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Planaltina', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Pontalina', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porangatu', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Porteirão', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Portelândia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Posse', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Professor Jamil', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Quirinópolis', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rialma', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rianápolis', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Quente', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rio Verde', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Rubiataba', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sanclerlândia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Bárbara de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Cruz de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa fé de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Helena de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Isabel', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Rita do Araguaia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Rita do Novo Destino', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Rosa de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Tereza de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santa Terezinha de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio da Barra', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Santo Antônio do Descoberto', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Domingos', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Francisco de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João D''aliança', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São João da Paraúna', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Luís de Montes Belos', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Luíz do Norte', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Miguel do Araguaia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Miguel do Passa Quatro', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Patrício', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('São Simão', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Senador Canedo', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Serranópolis', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Silvânia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Simolândia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Sítio D''abadia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Taquaral de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Teresina de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Terezópolis de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Três Ranchos', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Trindade', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Trombas', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Turvânia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Turvelândia', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Uirapuru', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Uruaçu', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Uruana', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Urutaí', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Valparaíso de Goiás', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Varjão', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vianópolis', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vicentinópolis', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vila Boa', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Vila Propício', 8);

INSERT INTO tb_cidade(nome_cidade, id_estado)
VALUES ('Brasília', 27);

INSERT INTO tb_cliente(cpf_cliente, email_cliente, nome_cliente, data_cliente, rua_cliente, nr_cliente, cep_cliente, id_cidade)
VALUES ('00000000001', 'email1@gmail.com', 'cliente1', '2001-01-01', 'rua 1', 1, '00000001', 4);

INSERT INTO tb_cliente(cpf_cliente, email_cliente, nome_cliente, data_cliente, rua_cliente, nr_cliente, cep_cliente, id_cidade)
VALUES ('00000000002', 'email2@gmail.com', 'cliente2', '2002-02-02', 'rua 2', 2, '00000002', 78);

INSERT INTO tb_cliente(cpf_cliente, email_cliente, nome_cliente, data_cliente, rua_cliente, nr_cliente, cep_cliente, id_cidade)
VALUES ('00000000003', 'email3@gmail.com', 'cliente3', '2003-03-03', 'rua 3', 3, '00000003', 13);

INSERT INTO tb_cliente(cpf_cliente, email_cliente, nome_cliente, data_cliente, rua_cliente, nr_cliente, cep_cliente, id_cidade)
VALUES ('00000000004', 'email4@gmail.com', 'cliente4', '2004-04-04', 'rua 4', 4, '00000004', 512);

INSERT INTO tb_cliente(cpf_cliente, email_cliente, nome_cliente, data_cliente, rua_cliente, nr_cliente, cep_cliente, id_cidade)
VALUES ('00000000005', 'email5@gmail.com', 'cliente5', '2005-05-05', 'rua 5', 5, '00000005', 1025);

INSERT INTO tb_cliente(cpf_cliente, email_cliente, nome_cliente, data_cliente, rua_cliente, nr_cliente, cep_cliente, id_cidade)
VALUES ('00000000006', 'email6@gmail.com', 'cliente6', '2006-06-06', 'rua 6', 6, '00000006', 870);

INSERT INTO tb_cliente(cpf_cliente, email_cliente, nome_cliente, data_cliente, rua_cliente, nr_cliente, cep_cliente, id_cidade)
VALUES ('00000000007', 'email7@gmail.com', 'cliente7', '2007-07-07', 'rua 7', 7, '00000007', 91);

INSERT INTO tb_cliente(cpf_cliente, email_cliente, nome_cliente, data_cliente, rua_cliente, nr_cliente, cep_cliente, id_cidade)
VALUES ('00000000008', 'email8@gmail.com', 'cliente8', '2008-08-08', 'rua 8', 8, '00000008', 69);

INSERT INTO tb_cliente(cpf_cliente, email_cliente, nome_cliente, data_cliente, rua_cliente, nr_cliente, cep_cliente, id_cidade)
VALUES ('00000000009', 'email9@gmail.com', 'cliente9', '2009-09-09', 'rua 9', 9, '00000009', 425);

INSERT INTO tb_cliente(cpf_cliente, email_cliente, nome_cliente, data_cliente, rua_cliente, nr_cliente, cep_cliente, id_cidade)
VALUES ('00000000010', 'email10@gmail.com', 'cliente10', '2010-10-10', 'rua 10', 10, '00000010', 111);

INSERT INTO tb_produto(nome_produto)
VALUES ('produto 1');

INSERT INTO tb_produto(nome_produto)
VALUES ('produto 2');

INSERT INTO tb_produto(nome_produto)
VALUES ('produto 3');

INSERT INTO tb_produto(nome_produto)
VALUES ('produto 4');

INSERT INTO tb_produto(nome_produto)
VALUES ('produto 5');

INSERT INTO tb_produto(nome_produto)
VALUES ('produto 6');

INSERT INTO tb_produto(nome_produto)
VALUES ('produto 7');

INSERT INTO tb_produto(nome_produto)
VALUES ('produto 8');

INSERT INTO tb_produto(nome_produto)
VALUES ('produto 9');

INSERT INTO tb_produto(nome_produto)
VALUES ('produto 10');

INSERT INTO tb_tipo_atendimento(nome_tipo_atendimento)
VALUES ('Reclamação');

INSERT INTO tb_tipo_atendimento(nome_tipo_atendimento)
VALUES ('Dúvida');

INSERT INTO tb_tipo_atendimento(nome_tipo_atendimento)
VALUES ('Sugestão');

INSERT INTO tb_tipo_atendimento(nome_tipo_atendimento)
VALUES ('Elogio');