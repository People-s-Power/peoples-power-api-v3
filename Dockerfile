
# FROM node:14-alpine as builder

# RUN mkdir -p /app

# WORKDIR /app

# COPY package*.json ./
# RUN yarn install 
# # COPY ./ ./
# RUN yarn build


# FROM node:14-alpine
# WORKDIR /app
# COPY --from=builder /app ./

# ENV PORT=8000
# ENV DOCKER=true


# EXPOSE ${PORT}




FROM node:16-alpine

# RUN mkdir /usr/src/app

WORKDIR /usr/src/app

COPY package*.json ./


RUN yarn install

COPY . .


ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}
CMD [ "yarn", "start:prod" ]

