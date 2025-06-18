# IPNetTrace v1

ip tracer Moudle for ROBLOX ( For Test Webhook )


IP Address Acquisition Method & Principle
This system obtains IP address information by leveraging a fundamental aspect of internet communication: HTTP requests inherently reveal the client's IP address to the server being contacted.


[ How it works ]


1. Core Principle: Client IP Disclosure via HTTP Request

- Every device connected to the internet has a unique IP address.

- When a client (e.g., a web browser, an application, or in this case, a Roblox exploit's HTTP function) sends an HTTP request to a web server (like httpbin.org), the client's IP address is automatically included in the request's network packets.

- The web server then reads this IP address from the incoming request.


2. Acquisition Method (Using an External Service)

- This system makes a GET request to a specialized web service, https://httpbin.org/get. This particular service is designed to receive an HTTP request and then send back a JSON response that includes metadata about the incoming request, specifically the client's public IP address within the origin field.

- The script initiates this GET request from the Roblox client environment (specifically, using an HTTP request function found within an exploit's context).

- Upon receiving the JSON response from httpbin.org, the script uses Roblox's HttpService:JSONDecode to parse the data.

- The script extracts the IP address string directly from the origin field of the parsed JSON data.
