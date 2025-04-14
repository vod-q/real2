local function CheckiKey(key)
	return { code = "KEY_VALID", message = "Key valid! Loading script..." }
end

local function LoaderTheKeyPlease()
	return "hey" -- Predefined key
end

local key = LoaderTheKeyPlease()
if key and key ~= "" then
	local status = CheckiKey(key)
	ApiStatusCode = status.code
	if status.code == "KEY_VALID" then
		sigmakey = key
		ApiStatusCode = "KEY_VALID" -- Ensure the status is valid
	else
		print(STATUS_MESSAGES[status.code] or status.message)
		makeUI()
	end
else
	makeUI()
end

while ApiStatusCode ~= "KEY_VALID" do
	task.wait(0.1)
end
script_key = sigmakey
api.load_script()
