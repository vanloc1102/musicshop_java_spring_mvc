/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.musicshop.repositories;


import com.spring.musicshop.entities.AccountEntity;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
public interface AccountRepository extends
        CrudRepository<AccountEntity, Integer> {

    AccountEntity findByUsernameLikeAndPasswordLike(
            String username, String password);

    @Query("Select acc From AccountEntity acc "
            + "Join fetch acc.accountRoles "
            + "Where acc.username Like ?1 and "
            + "acc.password Like ?2")
    AccountEntity findAccountByUsernameAndPassword(
            String username, String password);
    
    @Transactional
    @Modifying
    @Query("update AccountEntity acc set acc.password = ?1 where acc.username=?2")
    void updatePassword(String newPassword, String username);
}
