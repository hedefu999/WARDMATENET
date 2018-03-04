package com.wardmate.service;

import com.wardmate.mapper.NoteBookMapper;
import com.wardmate.model.NoteSnippet;
import com.wardmate.serviceInterface.INoteBookService;
import com.wardmate.vo.NoteBookQueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoteBookService implements INoteBookService {
    private static final Integer pageSize = 5;
    @Autowired
    private NoteBookMapper noteBookMapper;


    @Override
    public void saveUserSelectedText(NoteSnippet snippet) {
        noteBookMapper.saveOrUpdateNote(snippet);
    }

    @Override
    public NoteBookQueryResult getNoteBookPage(Integer userId, Integer pageNo) {
        Integer offset = (pageNo-1)*pageSize;
        NoteBookQueryResult queryResult = new NoteBookQueryResult();
        Integer count = noteBookMapper.getNoteCountByUserId(userId);
        List<NoteSnippet> noteSnippets = noteBookMapper.getNotesOnSpecifiedPage(userId,offset,pageSize);
        queryResult.setTotalCount(count);
        queryResult.setNoteSnippets(noteSnippets);
        return queryResult;
    }

    @Override
    public void deleteNoteByNoteId(Integer noteId) {
        noteBookMapper.deleteNoteById(noteId);
    }

}
