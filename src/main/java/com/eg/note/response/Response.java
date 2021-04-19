package com.eg.note.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author: Eg
 * @date: 2021/4/12 15:56
 */
@Data
@NoArgsConstructor
public class Response {

    private int status;
    private String msg;
    private Object object;

    public Response(int status,String msg,Object object){
        this.status = status;
        this.msg = msg;
        this.object = object;
    }
}
