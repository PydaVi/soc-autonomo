# SOC Autônomo

> 🇧🇷 [Leia esta página em português](./README.pt-br.md)

Network packet analysis focused on cybersecurity using tools like Suricata, Zeek, and the Elastic stack.

> An open source, lightweight, modular, and portable approach to investigating PCAP files from an information security perspective.

---

## 🎯 Purpose

This project was born as part of my hands-on cybersecurity learning journey, especially during my studies for the **CompTIA Security+** certification. While trying to understand real-world attacks through forensic analysis, I found it difficult to access free labs or tools that would run on modest machines.

Using open source tools and a container-based architecture, I created this environment to meet that personal need. By making it public, my goal is to help **democratize access to cybersecurity tools**, offering a local, lightweight solution with no external dependencies, but with high analytical capabilities.

> ⚠️ **Note:** This environment was developed and tested on **Linux (Ubuntu 24.04)** and is also compatible with **WSL (Windows Subsystem for Linux)**. It may not work properly on native Windows or macOS systems.

---

## 🔍 What does the project do?

* Analyzes `.pcap` files with **Zeek** and **Suricata**, generating network event logs.
* Integrates logs into the **Elastic stack (Elasticsearch, Kibana, and Filebeat)** for centralized visualization and investigation.
* Includes pre-configured dashboards to support quick forensic analysis and incident response.

---

## 🧱 Modular Architecture

The project is built on independent, reusable modules. This provides:

* Easy integration of new functionalities and tools
* Runs with `Docker` and `docker-compose`, making resource usage efficient
* Helper scripts written in `bash` for automation

---

## 📦 How to use

1. **Clone the repository**:

```bash
git clone https://github.com/PydaVi/soc-autonomo.git
cd soc-autonomo
```

2. **Set permissions for filebeat.yml and requisitos.sh**:

```bash
sudo chown root:root filebeat.yml
sudo chmod +x requisitos.sh
```

3. **Install dependencies (if needed)**:

```bash
sudo ./requisitos.sh
```

4. **Add your `.pcap` files to:**

```
modules/00-pcap-forensics/sample-pcaps/
```

> 💡 **Example PCAP included**:
> Inside the `sample-pcaps/` folder, you'll find a test PCAP file from the PCAP4SICS dataset in a `.zip` format.
> To try it out quickly:
>
> ```bash
> unzip /modules/00-pcap-forensics/sample-pcaps/4SICS-GeekLounge-151021.zip -d /modules/00-pcap-forensics/sample-pcaps/
> ```
>
> Credits to **PCAP4SICS** for the dataset.

5. **Run the environment**:

```bash
make up
```

6. **Parse logs and load dashboards**:

```bash
make parse
```

7. **Access Kibana** at `http://localhost:5601` to explore the dashboards.

8. **Tear down the containers**:

```bash
make down
```

---

## ⚠️ Roadmap (Upcoming features)

* \[+] Automated incident response orchestration with log enrichment
* \[+] Deployment-ready version for AWS using Terraform and Kubernetes

---

## 🤝 Contributing

Pull requests are welcome! If you have ideas, found bugs, or would like to propose new modules, feel free to open an issue or submit a PR.

---

## 🛡 License

Distributed under the MIT License.

---

## 👨‍💻 Author

**Fabio Augustto**

Infrastructure and Cybersecurity Analyst.
