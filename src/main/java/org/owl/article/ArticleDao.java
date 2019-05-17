package org.owl.article;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class ArticleDao {

	static final String LIST_ARTICLES = "select articleId, title, userId, name, left(cdate,16) cdate from article order by articleId desc limit ?,?";

	static final String COUNT_ARTICLES = "select count(articleId) from article";

	static final String GET_ARTICLE = "select articleId, title, content, userId, name, left(cdate,16) cdate, udate from article where articleId=?";

	static final String ADD_ARTICLE = "insert article(title,content,userId,name) values(?,?,?,?)";

	@Autowired
	JdbcTemplate jdbcTemplate;

	RowMapper<Article> articleRowMapper = new BeanPropertyRowMapper<>(
			Article.class);

	/**
	 * 글목록
	 */
	public List<Article> listArticles(int offset, int count) {
		return jdbcTemplate.query(LIST_ARTICLES, articleRowMapper, offset,
				count);
	}

	/**
	 * 글 목록 건수
	 */
	public int getArticlesCount() {
		return jdbcTemplate.queryForObject(COUNT_ARTICLES, Integer.class);
	}

	/**
	 * 글조회
	 */
	public Article getArticle(String articleId) {
		return jdbcTemplate.queryForObject(GET_ARTICLE, articleRowMapper,
				articleId);
	}

	/**
	 * 글등록
	 */
	public int addArticle(Article article) {
		return jdbcTemplate.update(ADD_ARTICLE, article.getTitle(),
				article.getContent(), article.getUserId(), article.getName());
	}
}