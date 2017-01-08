package akro.interceptor;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class SessionInterceptor extends AbstractInterceptor {
	public static final String SESSION_KEY_SYS_USER = "sysUser";
	public static final String SESSION_KEY_MEMBER = "member";
	public static final String SESSION_KEY_CAPTCHA_CODE = "captchaCode";

	private static final long serialVersionUID = -8092505769826225725L;
	protected static Logger log = LogManager.getLogger(AbstractInterceptor.class);

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		Map<String, Object> session = arg0.getInvocationContext().getSession();
		if (session == null || session.isEmpty()) {
			ActionSupport action = (ActionSupport) arg0.getAction();
			action.addActionMessage("您尚未登入或過久沒有動作，請重新登入!");
			return Action.LOGIN; // session is empty/expired
		}
		return arg0.invoke();
	}

}
