package org.foo;

import java.time.ZonedDateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Main {

    public static void main(String [] args) throws Exception {
        Logger logger = LoggerFactory.getLogger(Main.class);
        while (true) {
            ZonedDateTime now = ZonedDateTime.now();
            logger.info("The time is now {}", now);
            Thread.sleep(1000);
        }
    }
}
