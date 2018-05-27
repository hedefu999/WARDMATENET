package com.wardmate.serviceInterface;

public interface IWikiService {
    String getDiseaseInstruction(String name);
    String getDiseaseWiki(String name);
    String getMedicineInstruction(String name);
    String getMedicineWiki(String name);
}
