package edu.mum.deals.user.serviceImpl;

import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.deals.user.domain.Status;
import edu.mum.deals.user.domain.User;
import edu.mum.deals.user.dto.RegistrationDto;
import edu.mum.deals.user.repository.RoleRepository;
import edu.mum.deals.user.repository.UserRepository;
import edu.mum.deals.user.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserRepository userRepository;

	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	@Transactional
	public User registerNewUser(RegistrationDto registrationDto) {
		User user = new User();
		user.setName(registrationDto.getName());
		user.setEmail(registrationDto.getEmail());
		user.setPassword(passwordEncoder.encode(registrationDto.getPassword()));
		user.setStatus(Status.ACTIVE);
		HashSet<edu.mum.deals.user.domain.Role> roleSet = new HashSet<>();
		roleSet.add(roleRepository.findByType("USER"));
		user.setRoles(roleSet);
		return userRepository.save(user);

		
	}

	@Override
	public boolean doesEmailExist(String email) {
			User user = userRepository.findByEmail(email);
			return user==null;
	}
	

	@Override
	public User findById(long id) {
		return userRepository.findOne(id);
		 
	}

	@Override
	public User findByEmail(String email) {
		return userRepository.findByEmail(email);
	}

	@Override
	public User save(User user) {
		return userRepository.save(user);
	}

	@Override
	public User update(User updatedUser) {
		System.out.println(updatedUser.getLocation().getAddress());
		System.out.println(updatedUser.getPhone().getCellular());

		User user = userRepository.findOne(updatedUser.getId());
		user.setEmail(updatedUser.getEmail());
		user.setLocation(updatedUser.getLocation());
		user.setName(updatedUser.getName());
		user.setPhone(updatedUser.getPhone());
		return userRepository.save(user);
		
		
	}
	@Override
	public void deleteUser(Long id) {
		userRepository.delete(id);
	}
	@Override
	public List<User> findAllUsers() {
		// TODO Auto-generated method stub
		return (List<User>)userRepository.findAll();
	}

}
