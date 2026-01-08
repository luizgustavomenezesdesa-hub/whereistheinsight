CREATE DATABASE oficina;
USE oficina;

CREATE TABLE Cliente (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(120)
);

CREATE TABLE Veiculo (
    veiculo_id INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(80) NOT NULL,
    placa VARCHAR(10) UNIQUE NOT NULL,
    ano INT,
    cliente_id INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

CREATE TABLE OrdemServico (
    os_id INT AUTO_INCREMENT PRIMARY KEY,
    data_emissao DATE NOT NULL,
    data_conclusao DATE,
    status VARCHAR(30) NOT NULL,
    veiculo_id INT NOT NULL,
    FOREIGN KEY (veiculo_id) REFERENCES Veiculo(veiculo_id)
);

CREATE TABLE Servico (
    servico_id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(150) NOT NULL,
    valor_padrao DECIMAL(10,2) NOT NULL
);

CREATE TABLE Peca (
    peca_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL
);

CREATE TABLE OS_Servico (
    os_id INT NOT NULL,
    servico_id INT NOT NULL,
    quantidade INT DEFAULT 1,
    valor_unitario DECIMAL(10,2),
    PRIMARY KEY (os_id, servico_id),
    FOREIGN KEY (os_id) REFERENCES OrdemServico(os_id),
    FOREIGN KEY (servico_id) REFERENCES Servico(servico_id)
);

CREATE TABLE OS_Peca (
    os_id INT NOT NULL,
    peca_id INT NOT NULL,
    quantidade INT DEFAULT 1,
    valor_unitario DECIMAL(10,2),
    PRIMARY KEY (os_id, peca_id),
    FOREIGN KEY (os_id) REFERENCES OrdemServico(os_id),
    FOREIGN KEY (peca_id) REFERENCES Peca(peca_id)
);
