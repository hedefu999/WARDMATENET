package com.wardmate.mapper;

import com.wardmate.model.NoteSnippet;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NoteBookMapper {
    void saveOrUpdateNote(NoteSnippet snippet);
    Integer getNoteCountByUserId(Integer userId);
    List<NoteSnippet> getNotesOnSpecifiedPage(@Param("userId") Integer userId, @Param("offset") Integer offset, @Param("count") Integer count);
    void deleteNoteById(Integer noteId);
}
