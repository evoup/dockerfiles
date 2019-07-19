FROM evoup/mitmproxy


EXPOSE 8080
VOLUME /home/mitmproxy/.mitmproxy
VOLUME /opt/
CMD ["mitmdump", "-s", "/opt/script.py"]
