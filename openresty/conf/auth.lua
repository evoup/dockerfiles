--https://moonbingbing.gitbooks.io/openresty-best-practices/content/openresty/log_response.html
--https://cloud.tencent.com/developer/article/1009441
--https://github.com/jkeys089/lua-resty-hmac
local hmac = require "hmac"
local key = 'MONITOR2.0'
local hmac_sha1 = hmac:new(key, hmac.ALGOS.SHA1)
local headers = ngx.req.get_headers()
--ngx.log(ngx.ERR, '1', headers['user-agent']) 
function gen_server_token(method, now_time, path)
    local separator = "-"
    local data = method .. separator .. now_time .. separator .. path
    return data
end
if headers['Date'] == nil then
    return ngx.exit(403);
end
local message = gen_server_token(ngx.req.get_method(), headers['Date'], ngx.var.request_uri)
local token = ngx.encode_base64(hmac_sha1:final(message, false))
--ngx.say('user-agent is:', headers['user-agent'])
--ngx.say('Authorization:', headers['Authorization'])
--ngx.log(ngx.ERR, 'method:', ngx.req.get_method())
--ngx.log(ngx.ERR, 'message:', message)
--ngx.log(ngx.ERR, 'uri:', ngx.var.request_uri)
--ngx.log(ngx.ERR, 'Authorization:', headers['Authorization'])
--ngx.log(ngx.ERR, 'token:', token)
if headers['Authorization'] == nil then
    return ngx.exit(403);
end

if headers['Authorization'] ~= token then
    return ngx.exit(403);
end

