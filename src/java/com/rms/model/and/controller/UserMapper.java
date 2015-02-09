/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rms.model.and.controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.tree.RowMapper;
import javax.swing.tree.TreePath;

/**
 *
 * @author Sean Patrick T. Tan
 */
public class UserMapper implements RowMapper {
    public User mapRow(String username, String password) throws SQLException {
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        return user;
    }

    @Override
    public int[] getRowsForPaths(TreePath[] path) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}   