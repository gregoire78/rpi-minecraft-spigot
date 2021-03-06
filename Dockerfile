FROM hypriot/rpi-java:jre-1.8.111

RUN apt-get update && apt-get upgrade -y && apt-get install wget && apt-get autoremove --purge

#Download last version of spigot
RUN mkdir -p /webserver \
      && wget https://cdn.getbukkit.org/spigot/spigot-1.12-pre5.jar -O /webserver/minecraft_server.jar

EXPOSE 25565


# /data contains static files and database
VOLUME ["/data"]

WORKDIR /data
# start the server
CMD ["java","-Xms512M","-Xmx1008M","-Dcom.mojang.eula.agree=true","-Dfile.encoding=UTF-8","-jar","/webserver/minecraft_server.jar","nogui"]
