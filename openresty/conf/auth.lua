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
local token = gen_server_token('POST', 123, '/scrapyd/api')
ngx.say('user-agent is:', headers['user-agent'])
ngx.say('server token is:', token)
ngx.say("hmac_sha1: ", hmac_sha1:final(token, true))
return ngx.exit(403);
