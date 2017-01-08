package akro.entity.sysAuth;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.google.gson.Gson;

import akro.entity.sysAuth.sysApplication.SysApp;
import akro.entity.sysAuth.sysApplication.SysAppBatchSendEmail;
import akro.entity.sysAuth.sysApplication.SysAppOptionManage;
import akro.entity.sysAuth.sysApplication.SysAppSysRole;
import akro.entity.sysAuth.sysApplication.SysAppSysUser;

public class SysAuth {
	private transient boolean enableAuth = true;
	
	private SysAppOptionManage optionManage = new SysAppOptionManage();
	
	private SysAppSysUser sysUser = new SysAppSysUser();
	private SysAppSysRole sysRole = new SysAppSysRole();
	
	private SysAppBatchSendEmail batchSendEmail = new SysAppBatchSendEmail();
	
	public SysAuth() {
		Properties prop = new Properties();
		try {
			prop.load(this.getClass().getClassLoader().getResourceAsStream("configs/iace.properties"));
			String enableAuthStr = prop.getProperty("enableAuth");
			this.enableAuth = Boolean.valueOf(enableAuthStr);
		} catch (IOException e) {
			System.err.println("can't read value from config file, set [enableAuth] to true");
			this.enableAuth = true;
		}
	}
	
	private List<SysApp> getSysAppList() {
		List<SysApp> sysApps = new ArrayList<SysApp>();
		sysApps.add(this.optionManage);
		sysApps.add(this.sysUser);
		sysApps.add(this.sysRole);
		sysApps.add(this.batchSendEmail);
		return sysApps;
	}

	public String toJsonString() {
		Gson gson = new Gson();
		return gson.toJson(this);
	}
	
	public static SysAuth fromJsonString(String jsonString) {
		Gson gson = new Gson();
		SysAuth auth = gson.fromJson(jsonString, SysAuth.class);
		return auth;
	}
	
	public boolean hasEnableNamespace(String namespace) {
		if (this.enableAuth) {
			for (SysApp sysApp : getSysAppList()) {
				if (sysApp.hasEnableNamespace(namespace)) 
					return true;
			}
			return false;
		} else {
			return true;
		}
	}
	
	public boolean hasEnableNamespaceStartWith(String namespace) {
		if (this.enableAuth) {
			for (SysApp sysApp : getSysAppList()) {
				if (sysApp.hasEnableNamespaceStartWith(namespace)) 
					return true;
			}
			return false;
		} else {
			return true;
		}
	}
	
	public boolean hasAuth(String namespace, String action) {
		if (this.enableAuth) {
			for (SysApp sysApp : getSysAppList()) {
				if (sysApp.hasAuth(namespace, action)) return true;
			}
			return false;
		} else {
			return true;
		}
	}

	public SysAppOptionManage getOptionManage() {
		return optionManage;
	}


	public SysAppSysUser getSysUser() {
		return sysUser;
	}

	public SysAppSysRole getSysRole() {
		return sysRole;
	}

	public boolean isEnableAuth() {
		return enableAuth;
	}

	public SysAppBatchSendEmail getBatchSendEmail() {
		return batchSendEmail;
	}
	
	
}
