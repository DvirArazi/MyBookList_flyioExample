FROM mcr.microsoft.com/dotnet/sdk:8.0

WORKDIR /app

ENV DATABASE_PATH=/data/

COPY . .

RUN dotnet publish  -c Release -o publish

EXPOSE 5000

WORKDIR /app/publish

ENTRYPOINT [ "./MyBookList" ]
