# Usa una imagen base de Node.js compatible con Railway
FROM railwayapp/node:14

# Establece el directorio de trabajo en la aplicación
WORKDIR /usr/src/app

# Copia el archivo package.json e instala las dependencias
COPY package*.json ./

# Instala las dependencias
RUN npm install

# Copia el resto de la aplicación
COPY . .

# Construye la aplicación Next.js
RUN npm run build

# Expone el puerto 3000 (o el puerto configurado en Next.js)
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["npm", "start"]
