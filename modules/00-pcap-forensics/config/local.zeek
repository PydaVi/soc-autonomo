@load policy/tuning/json-logs.zeek
redef LogAscii::use_json = T;
redef LogAscii::json_timestamps = JSON::TS_ISO8601;
@load policy/protocols/http/detect-sqli
