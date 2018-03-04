package com.wardmate.vo;

import com.wardmate.model.NoteSnippet;

import java.util.List;

public class NoteBookQueryResult {
    private Integer totalCount;
    private List<NoteSnippet> noteSnippets;

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    public List<NoteSnippet> getNoteSnippets() {
        return noteSnippets;
    }

    public void setNoteSnippets(List<NoteSnippet> noteSnippets) {
        this.noteSnippets = noteSnippets;
    }
}
