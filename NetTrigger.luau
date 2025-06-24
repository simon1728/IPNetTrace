local getIP = require(___) -- detect IPmodule

--[[ ex
 local success, env = pcall(getfenv, 1)
 if success and env and typeof(env.request) == "function" then
     local actualReq = env.request
     local ipAddress = getIP(actualReq)
     if ipAddress then
         print("IPorg: ", ipAddress)
     end
 end
]]

-- visual request test
local dummyRequest = function(params)
    if params.Url == "https://httpbin.org/get" and params.Method == "GET" then
        return {Body = '{"origin": "------", "headers": {}}'}
    end
    return nil
end

local ipAddress = getIP(dummyRequest)
if ipAddress then
    print("IPorg: ", ipAddress)
end
