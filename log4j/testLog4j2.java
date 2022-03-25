import org.w3c.dom.Document;
import java.io.File;
import org.apache.logging.log4j.*;
import org.apache.logging.log4j.core.LoggerContext;

class testLog4j2 {
	static String propertiesPath = "cframeworklog2.properties";
	
	public static void main(String[] args) {
		LoggerContext context = (org.apache.logging.log4j.core.LoggerContext) LogManager.getContext(false);
		context.setConfigLocation((new File(propertiesPath)).toURI());
		
		Logger log, log_SYSTEM, log_EA, log_EX;
		log = LogManager.getRootLogger();
//		log = LogManager.getLogger(testLog4j2.class.getName());
		// log.debug("This is debug message");
		log.info("testLog4j2::This is info message");
		// log.error("This is error message");
		
		log_SYSTEM = LogManager.getLogger("Logger_SYSTEM");
		// log_SYSTEM.debug("This is debug message");
		log_SYSTEM.info("SYSTEM::This is info message");
		// log_SYSTEM.error("This is error message");
		
//		log_EA = LogManager.getLogger("EA");
		// log_EA.debug("This is debug message");
//		log_EA.info("EA::This is info message");
		// log_EA.error("This is error message");

//		log_EX = LogManager.getLogger("EX");
		// log_EX.debug("This is debug message");
//		log_EX.info("EX::This is info message");
		// log_EX.error("This is error message");
	}
}
