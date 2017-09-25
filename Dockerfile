#docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY -p 2342:2342/udp -p 6001:6001 neilo40/private:restful-doom

FROM ubuntu:zesty
WORKDIR /app
ADD src/restful-doom /app
ADD deploy/doom1.wad /app/doom1.wad
ADD chocpkg/install/lib/libSDL2-2.0.so.0 /home/neil/git/restful-doom/chocpkg/install/lib/libSDL2-2.0.so.0
ADD chocpkg/install/lib/libSDL2_mixer-2.0.so.0 /home/neil/git/restful-doom/chocpkg/install/lib/libSDL2_mixer-2.0.so.0
ADD chocpkg/install/lib/libSDL2_net-2.0.so.0 /home/neil/git/restful-doom/chocpkg/install/lib/libSDL2_net-2.0.so.0
ADD deploy/default.cfg /root/.restful-doom/default.cfg
ADD deploy/restful-doom.cfg /root/.restful-doom/restful-doom.cfg
EXPOSE 2342
EXPOSE 6001
RUN apt update
RUN apt -y install libpng16-16
RUN apt -y install x11-apps
CMD ["/app/restful-doom", "-iwad", "/app/doom1.wad", "-apiport", "6001", "-server", "-deathmatch"]
