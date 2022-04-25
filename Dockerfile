FROM node:17-alpine AS build

WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . ./

RUN npm run build && npm prune --production

FROM node:17-alpine

WORKDIR /app
ENV NODE_ENV=prod

COPY --from=build /app/dist /app/dist
COPY --from=build /app/node_modules /app/node_modules
COPY --from=build /app/*.env /app/

EXPOSE 3000
ENTRYPOINT [ "node" ]
CMD [ "dist/main.js" ]