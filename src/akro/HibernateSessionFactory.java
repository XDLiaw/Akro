package akro;


import java.util.Map.Entry;
import java.util.Properties;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import akro.entity.sys.SysRole;
import akro.entity.sys.SysUser;


public class HibernateSessionFactory {

	private static Configuration configuration = new Configuration();
	private static String CONFIG_FILE_LOCATION = "configs/hibernate.cfg.xml";
	
	private static final ThreadLocal<Session> threadLocal = new ThreadLocal<Session>();
	private static SessionFactory sessionFactory;
	
	static {
		rebuildSessionFactory();
	} 
	
	public static void rebuildSessionFactory() {
		try {
			configuration.configure(CONFIG_FILE_LOCATION);
//			configuration.configure();
//			showHibernateConfig();
			addEntityMapping();
			ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
					.applySettings(configuration.getProperties()).build();
			sessionFactory = configuration.buildSessionFactory(serviceRegistry);
			if (sessionFactory == null) {
				throw new NullPointerException("sessionFactory is null!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("%%%% Error Creating SessionFactory %%%%"); 
		}
	}
	
	public static Session getSession() throws HibernateException {
		Session session = (Session) threadLocal.get();  

		if (session == null || !session.isOpen()) {
			if (sessionFactory == null) {
				rebuildSessionFactory();
			}  
			session = (sessionFactory != null) ? sessionFactory.openSession() : null;
			threadLocal.set(session);
		}

		return session;
	} 

	public static void closeSession() throws HibernateException {
		Session session = (Session) threadLocal.get();
		threadLocal.set(null);

		if (session != null) {
			session.close();
		}
	}
	
	@Deprecated
	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}	

	@Deprecated
	public static Configuration getConfiguration() {
		return configuration;
	} 
	
	public static void showHibernateConfig() {
		Properties prop = configuration.getProperties();
		System.out.println("");
		System.out.println("==================================================");
		for (Entry<Object, Object> e : prop.entrySet()) {
			String key = (String) e.getKey();
			String value = (String) e.getValue();
			System.out.println(key+":"+value);
		}
		System.out.println("==================================================");
		System.out.println("");
	}
	
	public static String getConnectionDriverClass() {
		Properties prop = configuration.getProperties();
		return prop.getProperty("hibernate.connection.driver_class");
	}
	
	public static String getConnectionUrl() {
		Properties prop = configuration.getProperties();
		return prop.getProperty("hibernate.connection.url");
	}
	
	public static String getConnectionUserName() {
		Properties prop = configuration.getProperties();
		return prop.getProperty("hibernate.connection.username");
	}
	
	public static String getConnectionPassword() {
		Properties prop = configuration.getProperties();
		return prop.getProperty("hibernate.connection.password");
	}

	public static String getDefaultSchema() {
		Properties prop = configuration.getProperties();
		return prop.getProperty("hibernate.default_schema");
	}
	
	private static void addEntityMapping() {
		configuration.addAnnotatedClass(SysUser.class);
		configuration.addAnnotatedClass(SysRole.class);
		
	}
}
