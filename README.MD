# SOC Autônomo

Análise de pacotes de rede com foco em cibersegurança usando ferramentas de alto nível como Suricata, Zeek e a stack Elastic.

> Uma abordagem open source, leve, modular e portátil para investigação de arquivos PCAP sob a perspectiva da segurança da informação.

---

## 🎯 Objetivo

Este projeto nasceu como parte da minha jornada prática em cibersegurança, especialmente durante os estudos para a certificação **CompTIA Security+**. Buscando compreender melhor ataques reais por meio da análise forense, encontrei dificuldade em acessar laboratórios que fossem gratuitos ou que funcionassem em máquinas mais modestas.

Assim, utilizando ferramentas open source, e uma arquitetura baseada em orquestração de containers, criei este ambiente para suprir essa necessidade pessoal. Ao torná-lo público, minha intenção é ajudar a democratizar o acesso a ferramentas de cibersegurança, oferecendo uma solução local, leve e sem dependências externas, mas com alto poder de análise.

Este é apenas o módulo inicial, com foco em análise forense portátil. Outros módulos e melhorias serão adicionados futuramente.

## 🔍 O que o projeto faz?

* Analisa arquivos `.pcap` com **Zeek** e **Suricata**, gerando logs de eventos de rede.
* Integra os logs à stack **Elastic (Elasticsearch, Kibana e Filebeat)** para análise e visualização.
* Apresenta um dashboard pré-configurado para facilitar a investigação de incidentes.

## 🧱 Estrutura Modular

O projeto é construído em módulos independentes e reaproveitáveis. Isso permite:

* Facilidade na inclusão de novas funcionalidades e ferramentas
* Roda com `Docker` e `docker-compose`, tornando o uso de recurso da máquina altamente eficiente
* Scripts auxiliares com `bash` para automação

## 📦 Como usar

1. **Clone o repositório**

```bash
git clone https://github.com/PydaVi/soc-autonomo.git
cd soc-autonomo
```

2. **Permissione os arquivos filebeat.yml e requisitos.sh**:

```
sudo chown root:root filebeat.yml
sudo chmod +x requisitos.sh
```

3. **Prepare o seu ambiente com os requisitos, se necessário**:

```
sudo ./requisitos.sh
```


4. **Adicione seus arquivos `.pcap`** na pasta:

```
modules/00-pcap-forensics/sample-pcaps/
```

5. **Execute o projeto:**

```bash
make up
```

6. **Configure o parseamento dos logs e carregamento de dashboards:**

```bash
make parse
```


7. **Acesse o Kibana** em `http://localhost:5601` e explore os dashboards.

8. **Para derrubar os containers:**

```bash
make down
```

## 🚧 Roadmap (Próximos passos)

* \[+] Orquestração de resposta a incidentes com enriquecimento de logs.
* \[+] Versão para deploy em ambiente AWS com terraform e kubernetes

## 🤝 Contribuindo

Pull requests são bem-vindos! Se você tem ideias, encontrou bugs ou deseja propor novos módulos, abra uma issue ou envie sua contribuição.

## 🛡 Licença

Distribuído sob a licença MIT.

## 👨‍💻 Autor

**Fabio Augustto**

Analista de Infraestrutura e Cibersegurança.
