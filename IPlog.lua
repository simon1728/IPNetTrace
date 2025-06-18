local HttpService = game:GetService("HttpService")

local function Output(msg: string)
    warn(string.format("[Log] %s", msg))
end

local function getIPAddress(req)
    -- 'req' is assumed to be an HTTP request function provided externally
    if not req then
        Output("HTTP request function (req) not provided.")
        return nil
    end

    -- This service returns the client's IP in the 'origin' field of a JSON response
    local reset = req({
        Url = "https://httpbin.org/get",
        Method = "GET"
    })

    if reset and reset.Body then
        -- Attempt to decode the JSON response
        local ok, data = pcall(function()
            return HttpService:JSONDecode(reset.Body)
        end)

        -- If JSON parsing is successful and 'origin' field exists
        if ok and data and data.origin then
            Output("IP Address: " .. data.origin)
            return data.origin -- Return the extracted IP address
        else
            Output("JSON parsing failed or 'origin' field not found.")
            return nil
        end
    else
        Output("HTTP request failed or response body is empty.")
        return nil
    end
end

return getIPAddress