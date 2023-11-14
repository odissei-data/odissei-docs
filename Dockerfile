FROM python:3.9-alpine
WORKDIR /site 
COPY . /site
RUN pip install mkdocs mkdocs-material
EXPOSE 4040
CMD ["mkdocs", "serve", "--dev-addr", "0.0.0.0:4040"]
