CREATE TABLE t_pl_produto (
    id_produto INT NOT NULL PRIMARY KEY IDENTITY(1,1),  
    nm_produto NVARCHAR(150) NOT NULL,
    ds_categoria NVARCHAR(150) NOT NULL,
    nr_preco DECIMAL(25, 2) NOT NULL,
    st_produto CHAR(1) NOT NULL CHECK (st_produto IN ('D', 'I')),
    ds_produto NVARCHAR(250) NOT NULL,
    nr_tamanho NVARCHAR(50) NOT NULL
);

CREATE TABLE t_pl_cliente (
    id_cliente INT NOT NULL PRIMARY KEY IDENTITY(1,1),  
    nm_cliente NVARCHAR(50) NOT NULL,
    nr_cpf BIGINT NOT NULL,
    nr_rg INT NOT NULL,
    dt_nascimento DATE NOT NULL,
    cd_senha NVARCHAR(150) NOT NULL,
    CONSTRAINT chk_nr_cpf CHECK (nr_cpf >= 10000000000 AND nr_cpf <= 99999999999),
    CONSTRAINT chk_nr_rg CHECK (nr_rg >= 100000000 AND nr_rg <= 999999999)
);

CREATE TABLE t_pl_cliente_produto (
    id_cliente_produto INT NOT NULL PRIMARY KEY IDENTITY(1,1),  
    id_cliente INT NOT NULL,
    id_produto INT NOT NULL,
    dt_inicio DATE NOT NULL,
    dt_fim DATE,
    CONSTRAINT fk_cliente_produto FOREIGN KEY (id_cliente)
        REFERENCES t_pl_cliente (id_cliente),
    CONSTRAINT fk_produto_cliente FOREIGN KEY (id_produto)
        REFERENCES t_pl_produto (id_produto)
);

CREATE TABLE t_pl_email (
    id_email INT NOT NULL PRIMARY KEY IDENTITY(1,1),  
    id_cliente INT NOT NULL,
    nm_email NVARCHAR(150) NOT NULL,
    ds_email NVARCHAR(30) NOT NULL,
    st_email NVARCHAR(20) NOT NULL,
    CONSTRAINT fk_email_cliente FOREIGN KEY (id_cliente)
        REFERENCES t_pl_cliente (id_cliente)
);

CREATE TABLE t_pl_endereco_cliente (
    id_endereco_cliente INT NOT NULL PRIMARY KEY IDENTITY(1,1),  
    id_cliente INT NOT NULL,
    nm_rua NVARCHAR(50) NOT NULL,
    nr_residencia NVARCHAR(50) NOT NULL,
    nm_bairro NVARCHAR(30) NOT NULL,
    CONSTRAINT fk_endereco_cliente FOREIGN KEY (id_cliente)
        REFERENCES t_pl_cliente (id_cliente)
);

CREATE TABLE t_pl_pagamento (
    id_pagamento INT NOT NULL PRIMARY KEY IDENTITY(1,1),  
    id_produto INT NOT NULL,
    nm_cartao NVARCHAR(100) NOT NULL,
    nr_cartao BIGINT NOT NULL,
    ds_desc_cartao NVARCHAR(100) NOT NULL,
    dt_inicio DATE NOT NULL,
    CONSTRAINT fk_produto_pagamento FOREIGN KEY (id_produto)
        REFERENCES t_pl_produto (id_produto)
);

CREATE TABLE t_pl_telefone (
    id_telefone INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    id_cliente INT NOT NULL,
    nr_telefone BIGINT NOT NULL,
    nr_ddd INT NOT NULL,
    ds_telefone NVARCHAR(50) NOT NULL,
    CONSTRAINT fk_telefone_cliente FOREIGN KEY (id_cliente)
        REFERENCES t_pl_cliente (id_cliente)
);
