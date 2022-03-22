package rcvdemo;

import org.apache.logging.log4j.*;
import org.junit.jupiter.api.Test;

class ApplicationTests {
	Logger log = LogManager.getLogger(ApplicationTests.class.getName());
	@Test
	public void testOne() {
		// 记录debug级别的信息
		log.debug(">>This is debug message");
		// 记录info级别的信息
		log.info(">>This is info message");
		// 记录error级别的信息
		log.error(">>This is error message");
		
	}
}
