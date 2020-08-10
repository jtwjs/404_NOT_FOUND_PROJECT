package com.spring.mapper;

import org.apache.ibatis.annotations.Param;

import com.spring.boardproduct.CommentReviewVO;

public interface CommentReviewMapper {

    public int getReviewCommentNum(String review_id);
    public int insertReviewComment(CommentReviewVO vo);
    public CommentReviewVO[] getReviewComment(String review_id);
    public int deleteReviewComment(
    		@Param("review_id")String review_id, @Param("review_cmt_num")int review_cmt_num);
}
