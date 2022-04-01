package tester;

import org.junit.jupiter.api.Test;
import jp.co.hitachi_densa.EXPZ09.*;

public class testEXVZ09 {
	static {
		System.setProperty("appl.props.path", "./");
	}

	@Test
	public void Test1() {
		EXVZ0904 log = EXVZ0904.getLogger("testEXVZ09", "DM");
		String msg = "0331 testEXVZ0904";
		log.info(msg);
		log.warning(msg);
		log.severe(msg);
		EXVZ0904.getRootLogger("testEXVZ904").info(msg);
	}
	
	@Test
	public void Test2() {
		String msg = "EXVZ0901 ログは正しく出るかどうか";
		EXVZ0901 log = EXVZ0901.getLogger("EXVZ09.testEXVZ09.Test2()", "DM");
		log.info(msg);
		log.warning(msg);
		log.severe(msg);
	}
	@Test
	public void Test3() {
		String msg = "EXVZ0900 ログは正しく出るかどうか";
		EXVZ0900.info("EXVZ09.testEXVZ09.Test3()", msg);
	}
}
