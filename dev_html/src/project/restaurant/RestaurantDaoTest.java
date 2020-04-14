package project.restaurant;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class RestaurantDaoTest {
	RestaurantDao rDao = new RestaurantDao();
	@Test
	void testProcRestList() {
		assertEquals(6, rDao.procRestList().size());
	}

}
