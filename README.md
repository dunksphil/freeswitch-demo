# freeswitch-demo
Simple demo of basic FreeSWITCH lua IVR functionality - playing audio, recording audio, recognising DTMF


Clone repo to your machine, and enter your local ip address in NETWORK_ADDRESS in dev.sh

Run dev.sh :

> ./dev.sh

A FreeSWITCH will be started inside docker (freeswitch-demo) listening for SIP on port 5061

Connect to the docker container :

> docker exec -it freeswitch-demo bash

When in the container, connect to the FreeSWITCH CLI :

> fs_cli

When in the CLI, check status of FreeSWITCH :

> status

Make a SIP call from a softphone e.g.  sip:123456@<your-local-ip>:5061

Follow the audio prompts that you hear, and see the logging in the CLI.  

The FreeSWITCH is configured to send all calls to scripts/demo.lua which processes them.
  
All the IVR call flow logic can be seen in this file.  
