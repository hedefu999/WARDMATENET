package com.wardmate.test;

import com.google.common.base.Joiner;
import com.google.common.base.Predicate;
import com.google.common.base.Splitter;
import com.google.common.collect.Iterables;
import com.google.common.collect.Iterators;
import com.google.common.collect.Lists;
import com.wardmate.utils.MD5;
import org.junit.Test;

import javax.annotation.Nullable;
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
        List<Integer> userIds = Lists.newArrayList();//new ArrayList<>();
        userIds.add(1);
        userIds.add(2);
        userIds.add(3);
        System.out.println(userIds);
        userIds.removeIf(item -> item == 2);
        //userIds.remove(new Integer(3));

        System.out.println(userIds);
    }
    @Test
    public void testRemoveIf(){
        List<String> list = Lists.newArrayList("1","2","3","4","5");
        Integer i = 2;
        System.out.println("初始时："+ list.toString());
        list.removeIf(s -> s.contains(i.toString()));
        System.out.println("过滤完：" + list.toString());
    }
    @Test
    public void testArrayList2(){
        String groupIdString = "1,3,2";
        //1.转换方式1
        String[] groupIdArray = groupIdString.split(",");
        List<String> groupIdList = Lists.newArrayList(groupIdArray);//Arrays.asList(groupIdArray);;
        //2.转换方式2
        //List<String> groupIdList = new ArrayList<>();
        //Splitter.on(',').omitEmptyStrings().splitToList(groupIdString).stream().forEach(item -> groupIdList.add(item));
        Integer groupId = 2;

        //1.
        groupIdList.remove(groupId.toString());
        //2.
        //groupIdList.removeIf(item -> item.contains("2"));

        //2.5
        //Predicate<String> predicate = new Predicate<String>() {
        //    public boolean apply(String input) {
        //    if (input.equals(groupId.toString())){
        //        return true;
        //    }
        //    return false;
        //
        //    }
        //};
        //Iterables.removeIf(groupIdList,predicate);
        //2.6
        //Iterables.removeIf(groupIdList, input -> {
        //    if (input.equals(groupId.toString())){
        //        return true;
        //    }
        //    return false;
        //});
        //3.
        //Iterator<String> iterator = groupIdList.iterator();
        //while (iterator.hasNext()){
        //    if(iterator.next().equals(groupId.toString())){
        //        iterator.remove();
        //    }
        //}

        String idString = Joiner.on(",").skipNulls().join(groupIdList);
        System.out.println(groupIdList);
    }
    @Test
    public void testArrayList3(){
        Integer groupId = 2;
        String groupIdString = ",1,3";
        String[] groupIdArray = groupIdString.trim().split(",");
        List<String> groupIdList = Lists.newArrayList(groupIdArray);
        if(groupIdList.contains(groupId.toString())){
            groupIdList.remove(groupId.toString());
        }else {
            groupIdList.add(groupId.toString());
        }
        System.out.println(groupIdList);
        groupIdString = Joiner.on(",").skipNulls().join(groupIdList);
        System.out.println(groupIdString);
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
