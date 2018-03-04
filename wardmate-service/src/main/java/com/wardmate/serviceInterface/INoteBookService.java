package com.wardmate.serviceInterface;

import com.wardmate.model.NoteSnippet;
import com.wardmate.vo.NoteBookQueryResult;

public interface INoteBookService {
    void saveUserSelectedText(NoteSnippet snippet);
    NoteBookQueryResult getNoteBookPage(Integer userId,Integer pageNo);
    void deleteNoteByNoteId(Integer noteId);
}
