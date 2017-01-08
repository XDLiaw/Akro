package core.service;

import java.io.IOException;
import java.io.Serializable;
import java.sql.SQLException;


public interface IBaseCRUDService<T, ID extends Serializable> {	
	public T get(ID id); 
	public void create(T entity) throws IOException, SQLException;
	public void update(T entity) throws IOException, SQLException;
	public void delete(T entity) throws IOException, SQLException;
	public void delete(ID id) throws IOException, SQLException;
}
