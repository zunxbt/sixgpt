<h2 align=center>Run SixGPT Miner on VPS</h2>

## Info
- You need to connect your wallet first in [SixGPT](https://sixgpt.xyz/miner) website
- Click on Log In or Sign Up button 
- Connect your burner wallet
- Connect your google drive
- Done, For Now
---
- Now you need to request faucet from this [website](https://faucet.vana.org/)
- You can request either `moksha` or `satori` faucet

![image](https://github.com/user-attachments/assets/b62be5b0-7f8e-40dd-8941-1b95665126d9)

---
- **To run this miner, you must need to have 6 GB RAM on your VPS or system (Recommended)**

## Installation
- You can use either this command
```bash
[ -f "sixgpt.sh" ] && rm sixgpt.sh; curl -s -o sixgpt.sh https://raw.githubusercontent.com/zunxbt/sixgpt/main/sixgpt.sh && chmod +x sixgpt.sh && ./sixgpt.sh
```
- Or this command to run this script
```bash
[ -f "sixgpt.sh" ] && rm sixgpt.sh; wget -q https://raw.githubusercontent.com/zunxbt/sixgpt/main/sixgpt.sh && chmod +x sixgpt.sh && ./sixgpt.sh
```

## Imp Note
During the execution of the script, you will be prompted to enter the network name like this **Enter Vana Network (satori or moksha)**

- If you requested the faucet for the Moksha network, type `moksha`
- If you requested the faucet for the Satori network, type `satori`
