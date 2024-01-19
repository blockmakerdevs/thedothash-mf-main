# Usa una imagen base de Node.js versión 18
FROM node:18

# Establece el directorio de trabajo en la aplicación
WORKDIR /usr/src/app

# Copia el archivo package.json e instala las dependencias
COPY package*.json ./

# Instala las dependencias
RUN npm install

# Copia el resto de la aplicación
COPY . .

# Construye la aplicación Next.js
RUN npx next build

# Expone el puerto 3000 (o el puerto configurado en Next.js)
EXPOSE 3000

# Comando para iniciar la aplicación con los parámetros específicos
CMD ["npx", "next", "start", "-H", "::", "--port", "$PORT"]
