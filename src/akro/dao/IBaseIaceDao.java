package akro.dao;

import java.util.List;

import akro.entity.BaseEntity;

public interface IBaseIaceDao <Entity extends BaseEntity>{
	public List<Entity> listAll();

	public Entity get(long id);

	public void create(Entity entity);
	
	public void createAll(List<Entity> entities);

	public void update(Entity entity);
	
	public void updateAll(List<Entity> entities);

	public void delete(Entity entity);

	public void delete(long id);
}
