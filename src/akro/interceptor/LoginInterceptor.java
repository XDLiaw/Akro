package akro.interceptor;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import akro.entity.sys.SysUser;

public class LoginInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = 3572155150298091288L;
	protected static Logger log = LogManager.getLogger(AbstractInterceptor.class);

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		ActionContext actionContext = arg0.getInvocationContext();
		Map<String, Object> sessionMap = actionContext.getSession();
		SysUser user = (SysUser) sessionMap.get(SessionInterceptor.SESSION_KEY_SYS_USER);
		if (user == null) {
			ActionSupport action = (ActionSupport) arg0.getAction();
			action.addActionMessage("您尚未登入!");
			return Action.LOGIN;
		} else {
			log.debug("LoginInterceptor : "+user.getAccount());
			return arg0.invoke();
		}
	}

}
