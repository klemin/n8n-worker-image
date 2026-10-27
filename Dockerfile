# Образ воркера n8n с вшитыми community-нодами: воркер стартует без установки нод и без сетевого диска.
# Версии n8n и нод — ровно как на главном n8n (контейнер n8n на Dockhost, ~/.n8n/nodes/package.json).
# Обновили n8n или ноду на главном — меняем версию здесь и пересобираем, иначе воркеры считают на старой.
FROM n8nio/n8n:2.18.5
USER node
RUN mkdir -p /home/node/.n8n/nodes \
 && cd /home/node/.n8n/nodes \
 && npm init -y >/dev/null \
 && npm install --omit=dev --no-audit --no-fund n8n-nodes-scrapeninja@0.4.1 n8n-nodes-dataforseo@1.6.2 \
 && npm cache clean --force
