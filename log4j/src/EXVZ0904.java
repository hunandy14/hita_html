import java.io.File;
import java.io.Serializable;

import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.core.LoggerContext;

public class EXVZ0904 implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String c_SYSTEM_CODE;
	private String c_CLASSS_NAME;
	private Logger logger;

	static {
		String properties = "log4j2.properties";
		LoggerContext context = (LoggerContext) LogManager.getContext(false);
		File file = new File(System.getProperty("appl.props.path") + "/" + properties);
		context.setConfigLocation(file.toURI());

		// Logger log = LogManager.getLogger();
		// log.debug(">>This is debug message");
		// log.info(">>This is info message");
		// log.error(">>This is error message");
	}

	public EXVZ0904(String i_className, String i_systemCode) {
		this.c_SYSTEM_CODE = new String(i_systemCode);
		this.c_CLASSS_NAME = new String(i_className);
		this.logger = LogManager.getLogger(c_SYSTEM_CODE);
	}
	public EXVZ0904(String i_className) {
		this.c_SYSTEM_CODE = new String("RootLogger");
		this.c_CLASSS_NAME = new String(i_className);
		this.logger = LogManager.getRootLogger();
	}

	public static EXVZ0904 getLogger(String i_className, String i_systemCode) {
		EXVZ0904 exvz0901 = new EXVZ0904(i_className, i_systemCode);
		return exvz0901;
	}
	public static EXVZ0904 getRootLogger(String i_className) {
		EXVZ0904 exvz0901 = new EXVZ0904(i_className);
		return exvz0901;
	}

	public void debug(String message) {
		logger.debug(c_CLASSS_NAME + ":" + message);
	}
	
	public void info(String message) {
		logger.info(c_CLASSS_NAME + ":" + message);
	}

	public void warning(String message) {
		logger.warn(c_CLASSS_NAME + ":" + message);
	}

	public void warning(String message, Throwable thr) {
		logger.log(Level.WARN, c_CLASSS_NAME + ":" + message, thr);
	}

	public void severe(String message, Throwable thr) {
		logger.log(Level.ERROR, c_CLASSS_NAME + ":" + message, thr);
	}

	public void severe(String message) {
		logger.error(c_CLASSS_NAME + ":" + message);
	}
}
