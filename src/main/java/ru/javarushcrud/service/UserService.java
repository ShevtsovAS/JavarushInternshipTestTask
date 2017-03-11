package ru.javarushcrud.service;
import ru.javarushcrud.model.User;

import java.util.List;

public interface UserService {
    void createUser(User user);
    void updateUser(User user);
    void deleteUser(int id);
    List<User> getAllUsers();
    User getUser(int id);
    List<User> getAllUsers(String userName);
}
