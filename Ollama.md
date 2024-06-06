# Ollama Notes

## Links

* https://github.com/ollama/ollama
* https://github.com/open-webui/open-webui
* https://openwebui.com/
* https://github.com/AUTOMATIC1111/stable-diffusion-webui/issues/10117
* https://github.com/AUTOMATIC1111/stable-diffusion-webui
* https://www.openinterpreter.com/
* https://github.com/paul-gauthier/aider
* https://aider.chat/docs/llms.html#ollama
* https://discord.com/channels/1170866489302188073/1173015554991345734

## Openweb UI

```bash
docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main
```

* http://localhost:3000/

## Installation Instructions

```bash
sudo apt install wget git python3 python3-venv libgl1 libglib2.0-0
sudo apt-get install libgoogle-perftools4 libtcmalloc-minimal4 -y
dpkg -l | grep malloc
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
cd stable-diffusion-webui
./webui.sh --api --listen
```

* http://127.0.0.1:7860/
