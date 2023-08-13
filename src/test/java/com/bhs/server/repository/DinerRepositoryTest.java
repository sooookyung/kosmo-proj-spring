package com.bhs.server.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import com.bhs.server.domain.Diner;

@SpringBootTest
public class DinerRepositoryTest {
    @Autowired
    private DinerRepository repository;

    @Test
    void testFindById(){
        Diner diner = repository.findById(1).orElseThrow(); 
        //findById의 return타입이 Optional<Diner>인데 Optional의 메소드인 orElseThrow를 사용하면 return타입이 Diner가 되어서 Diner의 데이터가 return되어서 사용할 수 있다.
        System.out.println(diner);
    }
}
