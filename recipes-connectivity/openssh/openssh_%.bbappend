SUMMARY = "A suite of security-related network utilities based on \
the SSH protocol including the ssh client and sshd server"
DESCRIPTION = "Secure rlogin/rsh/rcp/telnet replacement (OpenSSH) \
Ssh (Secure Shell) is a program for logging into a remote machine \
and for executing commands on a remote machine."

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "							   \
				file://sshdgenkeys.service \
				file://generate-keys       \
"

do_install_append () {
	install -c -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_unitdir}/system
	install -D -m 0755 ${WORKDIR}/generate-keys  ${D}${libexecdir}/${BPN}/generate-keys
}
