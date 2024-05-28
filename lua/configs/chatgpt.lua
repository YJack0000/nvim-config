local config = {
	api_host_cmd = "echo http://140.110.7.102:11434",
	api_key_cmd = "echo ''",
	openai_params = {
		model = "llama3:70b",
		frequency_penalty = 0,
		presence_penalty = 0,
		max_tokens = 300,
		temperature = 0,
		top_p = 1,
		n = 1,
	},
	openai_edit_params = {
		model = "llama3:70b",
		frequency_penalty = 0,
		presence_penalty = 0,
		temperature = 0,
		top_p = 1,
		n = 1,
	},
}

require("chatgpt").setup(config)
