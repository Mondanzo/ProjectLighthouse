FROM mcr.microsoft.com/dotnet/sdk:latest AS compile

WORKDIR /build_task
COPY . .
RUN dotnet build -c Debug -o ./build

FROM mcr.microsoft.com/dotnet/aspnet:latest
COPY --from=compile /build_task/build /app/
COPY /scripts/ /app/

EXPOSE 10060 10061 10062

ENTRYPOINT [ "/app/start.sh" ]