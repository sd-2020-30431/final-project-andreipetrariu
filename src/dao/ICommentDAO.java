package dao;
import java.util.List;
import model.Comment;

public interface ICommentDAO {
	public List<Comment> readComments(int pageId);

	public void createComment(Comment theComment);
}
