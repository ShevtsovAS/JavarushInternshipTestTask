package ru.javarushcrud.dao;

import ru.javarushcrud.model.User;

import java.util.List;

public interface UserDAO {
    void createUser(User user);
    void updateUser(User user);
    void deleteUser(int id);
    List<User> getAllUsers();
    User getUser(int id);
    List<User> getAllUsers(String userName);
}
