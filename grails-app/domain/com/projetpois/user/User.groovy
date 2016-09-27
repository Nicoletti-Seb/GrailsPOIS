package com.projetpois.user

import com.projetpois.poi.Poi
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String mail
	String username
	String password
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static hasMany = [pois: Poi]
	static mappedBy = [pois: 'createdBy']

	User(String username, String mail, String password) {
		this()
		this.mail = mail
		this.username = username
		this.password = password
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this)*.role
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService']

	static constraints = {
		mail nullable: false, mail:true, blank: false, unique: true
		username nullable: false, blank: false, unique: true
		password nullable: false, blank: false
	}

	static mapping = {
		password column: '`password`'
	}
}
