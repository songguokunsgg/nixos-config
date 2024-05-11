{
	image = "ghcr.io/open-webui/open-webui:main";

	environment = {
		"TZ" = "Asia/Shanghai";
		"OLLAMA_API_BASE_URL" = "http://127.0.0.1:11434/api";
		"OLLAMA_BASE_URL" = "http://127.0.0.1:11434";
	};

	volumes = [
		"/home/sukipai/open-webui/data:/app/backend/data"
	];

	ports = [
		"127.0.0.1:3000:8080"
	];

	extraOptions = [
		"--pull=newer"
			"--name=open-webui"
			"--hostname=open-webui"
			"--network=host"
			"--add-host=host.containers.internal:host-gateway"
	];
}
