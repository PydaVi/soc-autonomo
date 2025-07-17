@load policy/tuning/json-logs.zeek  # Habilita logs em JSON
@load policy/protocols/http/detect-sqli  # Detecção de SQLi
@load frameworks/files/extract-all-files  # Extração de arquivos
@load protocols/ssl/validate-certs  # Análise de certificados SSL
@load policy/protocols/conn/known-hosts  # Identifica hosts conhecidos
@load policy/protocols/conn/known-services  # Identifica serviços conhecidos

# Configurações adicionais
redef LogAscii::use_json = T;  # Força JSON
redef LogAscii::json_timestamps = JSON::TS_ISO8601;  # Formato de timestamp
redef ignore_checksums = T;  # Ignora checksums inválidos (útil para PCAPs)
