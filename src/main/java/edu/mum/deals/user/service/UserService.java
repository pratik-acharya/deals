package edu.mum.deals.user.service;

import java.util.List;

import edu.mum.deals.user.domain.User;
import edu.mum.deals.user.dto.RegistrationDto;

public interface UserService {
	public User findById(long id);
	User findByEmail(String email);
	public User registerNewUser(RegistrationDto registrationDto);
	public boolean doesEmailExist(String email);
	public User save(User user);
	public User update(User user);
	public void deleteUser(Long id);
	public List<User> findAllUsers();

}
