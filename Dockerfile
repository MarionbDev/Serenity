# production environment
FROM node:18.12.0
# Create app directory
RUN mkdir /usr/src/app
WORKDIR /usr/src/app
# Create env variables
ENV PATH /usr/src/app/node_modules/.bin:$PATH
ARG GENERATE_SOURCEMAP=${GENERATE_SOURCEMAP}
ENV GENERATE_SOURCEMAP=${GENERATE_SOURCEMAP}
ARG VITE_BACKEND_URL=${VITE_BACKEND_URL}
ENV VITE_BACKEND_URL=${VITE_BACKEND_URL}
ARG VITE_ASSETS_IMAGES_URL=${VITE_ASSETS_IMAGES_URL}
ENV VITE_ASSETS_IMAGES_URL=${VITE_ASSETS_IMAGES_URL}
ARG APP_PORT=${APP_PORT}
ENV APP_PORT=${APP_PORT}
ARG DB_HOST=${DB_HOST}
ENV DB_HOST=${DB_HOST}
ARG DB_USER=${DB_USER}
ENV DB_USER=${DB_USER}
ARG DB_PASSWORD=${DB_PASSWORD}
ENV DB_PASSWORD=${DB_PASSWORD}
ARG DB_NAME=${DB_NAME}
ENV DB_NAME=${DB_NAME}
ARG FRONTEND_URL=${FRONTEND_URL}
ENV FRONTEND_URL=${FRONTEND_URL}
ARG TOKEN_API=${TOKEN_API}
ENV TOKEN_API=${TOKEN_API}
ARG JWT_SECRET=${JWT_SECRET}
ENV JWT_SECRET=${JWT_SECRET}
ARG JWT_EXPIRESIN=${JWT_EXPIRESIN}
ENV JWT_EXPIRESIN=${JWT_EXPIRESIN}
ARG JWT_SECURE=${JWT_SECURE}
ENV JWT_SECURE=${JWT_SECURE}
ARG JWT_COOKIE_MAXAGE=${JWT_COOKIE_MAXAGE}
ENV JWT_COOKIE_MAXAGE=${JWT_COOKIE_MAXAGE}
ARG SMTP_SENDIN=${SMTP_SENDIN}
ENV SMTP_SENDIN=${SMTP_SENDIN}
ARG SMTP_PORT_SENDIN=${SMTP_PORT_SENDIN}
ENV SMTP_PORT_SENDIN=${SMTP_PORT_SENDIN}
ARG SMTP_SENDIN_USER=${SMTP_SENDIN_USER}
ENV SMTP_SENDIN_USER=${SMTP_SENDIN_USER}
ARG SMTP_SENDIN_PASSWORD=${SMTP_SENDIN_PASSWORD}
ENV SMTP_SENDIN_PASSWORD=${SMTP_SENDIN_PASSWORD}


COPY ./ /usr/src/app
RUN npm install -g pnpm
# Create front app
RUN cd ./frontend && pnpm i && pnpm build
RUN mkdir -p ./frontend/dist/src && cp -r ./frontend/src/assets ./frontend/dist/src
# Create back app
RUN cd ./backend && pnpm i --prod

# expose full app on APP_PORT
EXPOSE ${APP_PORT}
CMD ["node", "backend/index.js"]