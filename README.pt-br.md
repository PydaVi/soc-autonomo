# SOC Autônomo

Análise de pacotes de rede com foco em cibersegurança usando ferramentas como Suricata, Zeek e a stack Elastic.

> Uma abordagem open source, leve, modular e portátil para investigação de arquivos PCAP sob a perspectiva da segurança da informação.

---

## 🎯 Objetivo

Este projeto nasceu como parte da minha jornada prática de aprendizado em cibersegurança, especialmente durante meus estudos para a certificação **CompTIA Security+**. Ao tentar entender ataques do mundo real por meio da análise forense, encontrei dificuldade em acessar laboratórios gratuitos ou ferramentas que rodassem em máquinas modestas.

Utilizando ferramentas open source e uma arquitetura baseada em containers, criei este ambiente para atender a essa necessidade pessoal. Ao torná-lo público, meu objetivo é ajudar a **democratizar o acesso a ferramentas de segurança**, oferecendo uma solução local, leve e sem dependências externas, mas com grande capacidade analítica.

> ⚠️ **Atenção:** Este ambiente foi desenvolvido e testado no **Linux (Ubuntu 24.04)** e também é compatível com o **WSL (Windows Subsystem for Linux)**. Pode não funcionar corretamente em sistemas Windows ou macOS nativos.

---

## 🔍 O que o projeto faz?

* Analisa arquivos `.pcap` com **Zeek** e **Suricata**, gerando logs de eventos de rede.
* Integra os logs com a **stack Elastic (Elasticsearch, Kibana e Filebeat)** para visualização e investigação centralizadas.
* Inclui dashboards pré-configurados para apoiar análises forenses rápidas e resposta a incidentes.

---

## 🧱 Arquitetura Modular

O projeto é construído com módulos independentes e reutilizáveis. Isso proporciona:

* Fácil integração de novas funcionalidades e ferramentas
* Execução com `Docker` e `docker-compose`, tornando o uso de recursos eficiente
* Scripts auxiliares em `bash` para automação

---

## 📦 Como usar

1. **Clone o repositório:**

```bash
git clone https://github.com/PydaVi/soc-autonomo.git
cd soc-autonomo
```

2. **Dê permissões ao `filebeat.yml` e ao `requisitos.sh`:**

```bash
sudo chown root:root filebeat.yml
sudo chmod +x requisitos.sh
```

3. **Instale as dependências (se necessário):**

```bash
sudo ./requisitos.sh
```

4. **Adicione seus arquivos `.pcap` em:**

```
modules/00-pcap-forensics/sample-pcaps/
```

> 💡 **PCAP de exemplo incluído:**
> Dentro da pasta `sample-pcaps/`, você encontrará um arquivo `.zip` com um PCAP de teste do repositório **PCAP4SICS**.
> Para testá-lo rapidamente:
>
> ```bash
> unzip /modules/00-pcap-forensics/sample-pcaps/4SICS-GeekLounge-151021.zip -d /modules/00-pcap-forensics/sample-pcaps/
> ```
>
> Créditos ao projeto **PCAP4SICS** pelo dataset.

5. **Execute o ambiente:**

```bash
make up
```

6. **Parseie os logs e carregue os dashboards:**

```bash
make parse
```

7. **Acesse o Kibana** em `http://localhost:5601` para explorar os dashboards.

8. **Derrube os containers:**

```bash
make down
```

---

## ⚠️ Roadmap (Próximas funcionalidades)

* \[+] Orquestração automatizada de resposta a incidentes com enriquecimento de logs
* \[+] Versão pronta para deploy na AWS usando Terraform e Kubernetes

---

## 🤝 Contribuindo

Pull requests são bem-vindos! Se você tiver ideias, encontrar bugs ou quiser propor novos módulos, fique à vontade para abrir uma issue ou enviar um PR.

---

## 🛡 Licença

Distribuído sob a Licença MIT.

---

## 👨‍💻 Autor

**Fabio Augustto**
Analista de Infraestrutura e Cibersegurança.
