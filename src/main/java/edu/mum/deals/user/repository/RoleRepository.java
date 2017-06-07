package edu.mum.deals.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import edu.mum.deals.user.domain.Role;

public interface RoleRepository extends JpaRepository<Role, Integer> {
	Role findByType(String role);

}
