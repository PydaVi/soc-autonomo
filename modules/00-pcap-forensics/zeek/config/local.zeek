@load policy/protocols/http/detect-sqli  # Detecção de SQLi
@load frameworks/files/extract-all-files  # Extração de arquivos
@load protocols/ssl/validate-certs  # Análise de certificados SSL
@load policy/protocols/conn/known-hosts  # Identifica hosts conhecidos
@load policy/protocols/conn/known-services  # Identifica serviços conhecidos

@load policy/tuning/json-logs.zeek
redef LogAscii::use_json = T;
redef LogAscii::json_timestamps = JSON::TS_ISO8601;
redef ignore_checksums = T;  # Ignora checksums inválidos (útil para PCAPs)