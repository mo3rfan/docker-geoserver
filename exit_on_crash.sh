sleep 1
echo Starting crash monitor
tail -f $(ls -t /usr/local/tomcat/logs/catalina*.log | head -n 1) | while read LINE; do
    echo "$LINE" | grep -q "org.apache.catalina.core.StandardContext.startInternal Context \[\/geoserver\] startup failed due to previous errors"
    if [ $? -eq 0 ]; then
        echo "Error found in logs. Exiting..."
        touch /tmp/catalina_stopped
        catalina.sh stop
        exit 1
    fi
done

