package petstore;

import com.intuit.karate.junit5.Karate;

class PetstoreTest {
    
    @Karate.Test
    Karate testPetstore() {
        return Karate.run("classpath:features/petstore.feature");
    }
}