package com.eg.note.pojo;

/**
 * @author: Eg
 * @date: 2021/4/9 15:32
 */

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.*;

/**
 * @author 177****5397
 * @date 2021-04-09 15:31:14
 * @email
 */
@Entity
@Table(name="user")
@JsonIgnoreProperties({"handler","hibernateLazyInitializer"})
@Data
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @ApiModelProperty("密码")
    @Column(name = "password")
    String password;

    @Column(name = "salt")
    String salt;

    @ApiModelProperty("用户名")
    @Column(name = "username")
    private String username;

}
