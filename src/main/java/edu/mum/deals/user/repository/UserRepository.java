package edu.mum.deals.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import edu.mum.deals.user.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User,Long>{
	User findByEmail(String email);

}
