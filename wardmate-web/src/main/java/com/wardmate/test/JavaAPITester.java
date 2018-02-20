package com.wardmate.test;

import com.wardmate.utils.MD5;
import org.junit.Test;

import java.util.*;

public class JavaAPITester {
    @Test
    public void testHashTable(){
        Map<Integer,List<Integer>> userGroupMap = new Hashtable<>();
        List<Integer> userIds;
        userIds = new ArrayList<>();
        userIds.add(1);userIds.add(4);userIds.add(9);
        userGroupMap.put(1,userIds);
        userIds=new ArrayList<>();
        userIds.add(1);userIds.add(2);userIds.add(5);
        userGroupMap.put(2,userIds);

        userIds = new ArrayList<>();
        userIds.add(2);userIds.add(3);userIds.add(7);
        userGroupMap.put(3,userIds);

        Integer groupid = 3;
        Integer userId=1;
        if (userGroupMap.containsKey(groupid)){
            userIds = userGroupMap.get(groupid);
        }else {
            userIds = new ArrayList<>();
        }
        userIds.add(userId);userIds.add(userId+3);
        userGroupMap.put(groupid,userIds);

        userIds = userGroupMap.get(4);
        userIds.add(8);
        System.out.println(userIds.size());
        for(Map.Entry<Integer,List<Integer>> entry : userGroupMap.entrySet()){
            System.out.println("key = "+entry.getKey()+" , value list = "+entry.getValue());
        }
    }
    @Test
    public void testidentityHashmap(){
        Map<Integer,String> map = new HashMap<>();
        map.put(1,"11");
        map.put(1,"22");
        map.put(1,"33");
        System.out.println(map.get(new Integer(1)));
    }
    @Test
    public void testArrayList(){
        List<Integer> userIds = new ArrayList<>();
        userIds.add(1);
        userIds.add(2);
        userIds.remove(new Integer(3));
        userIds.add(1);
        if (userIds.contains(2)){

            System.out.println(userIds);
        }
    }
    @Test
    public void commonTest(){
        String result = MD5.getMD5String("lucy"+MD5.getMD5String("lucy999"));
        System.out.println(result);
    }
    @Test
    public void testString(){
        String str = "1,2,30";
        Integer i = 23;
        if(str.contains(""+i)){
            System.out.println(true);
        }
    }
}
