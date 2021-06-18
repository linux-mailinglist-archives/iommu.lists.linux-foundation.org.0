Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1782A3ACFE5
	for <lists.iommu@lfdr.de>; Fri, 18 Jun 2021 18:07:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BADE415B5;
	Fri, 18 Jun 2021 16:07:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pb6ysPK2ZXdn; Fri, 18 Jun 2021 16:07:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D64B4415D6;
	Fri, 18 Jun 2021 16:07:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13450C000D;
	Fri, 18 Jun 2021 16:07:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3BEBBC000B
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 16:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85AB783B18
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 16:07:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=oracle.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id smBxxyZfQW6v for <iommu@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 16:07:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EED5A83B15
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 16:07:18 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15IG2h2Q030717; Fri, 18 Jun 2021 16:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=qO4swfJXRtPFLY0tVLDsZJG9xnfATwh6+HePhGd5nOM=;
 b=rDoqGCTOIpNn4Ves81MkPAA7TGVJcu6zT7dlZCIRNyB0ryxqrs0kpd2R9oHWTuTKBhOl
 XvQdfvlWLaem5YLr8rH4hq3/Sz+8uO9s4QoaU+N1SKr2oDtTGieR8D0IwYfp923qZbu0
 0SCJz+fEFu0QDErVnhgyj0kSa7nUIw5l3l+zeGBWNaTIaPwYdNH5otn3Mnd0jhpgf2/k
 jdidEB7J6zl6TgZFPXTHYfnZZjS9WSggd9r25uul0apedEIGwrKFXuVm7wEF7R73H/zD
 1GkXKBnvoloSsLlmOY7R9T9NHrdqOweUjd436KMGv6t0+VPoCPuWksGtpnKiqR6UMGaf XQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 398tu1rgsa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Jun 2021 16:06:56 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15IG1cGn154976;
 Fri, 18 Jun 2021 16:06:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 396wayyuxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Jun 2021 16:06:55 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15IG6sWH167638;
 Fri, 18 Jun 2021 16:06:54 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 396wayyuxe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Jun 2021 16:06:54 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 15IG6qgO018499;
 Fri, 18 Jun 2021 16:06:52 GMT
Received: from lateralus.us.oracle.com (/10.149.232.101)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 18 Jun 2021 16:06:52 +0000
From: Ross Philipson <ross.philipson@oracle.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org,
 iommu@lists.linux-foundation.org, linux-integrity@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: [PATCH v2 09/12] reboot: Secure Launch SEXIT support on reboot paths
Date: Fri, 18 Jun 2021 12:12:54 -0400
Message-Id: <1624032777-7013-10-git-send-email-ross.philipson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1624032777-7013-1-git-send-email-ross.philipson@oracle.com>
References: <1624032777-7013-1-git-send-email-ross.philipson@oracle.com>
X-Proofpoint-GUID: ka2tYm6LQG-8tnhAckHMo3RPSiJmLN4G
X-Proofpoint-ORIG-GUID: ka2tYm6LQG-8tnhAckHMo3RPSiJmLN4G
Cc: dpsmith@apertussolutions.com, ross.philipson@oracle.com,
 luto@amacapital.net, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 tglx@linutronix.de, trenchboot-devel@googlegroups.com
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

If the MLE kernel is being powered off, rebooted or halted,
then SEXIT must be called. Note that the SEXIT GETSEC leaf
can only be called after a machine_shutdown() has been done on
these paths. The machine_shutdown() is not called on a few paths
like when poweroff action does not have a poweroff callback (into
ACPI code) or when an emergency reset is done. In these cases,
just the TXT registers are finalized but SEXIT is skipped.

Signed-off-by: Ross Philipson <ross.philipson@oracle.com>
---
 arch/x86/kernel/reboot.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
index b29657b..796cbfb 100644
--- a/arch/x86/kernel/reboot.c
+++ b/arch/x86/kernel/reboot.c
@@ -12,6 +12,7 @@
 #include <linux/delay.h>
 #include <linux/objtool.h>
 #include <linux/pgtable.h>
+#include <linux/slaunch.h>
 #include <acpi/reboot.h>
 #include <asm/io.h>
 #include <asm/apic.h>
@@ -731,6 +732,7 @@ static void native_machine_restart(char *__unused)
 
 	if (!reboot_force)
 		machine_shutdown();
+	slaunch_finalize(!reboot_force);
 	__machine_emergency_restart(0);
 }
 
@@ -741,6 +743,9 @@ static void native_machine_halt(void)
 
 	tboot_shutdown(TB_SHUTDOWN_HALT);
 
+	/* SEXIT done after machine_shutdown() to meet TXT requirements */
+	slaunch_finalize(1);
+
 	stop_this_cpu(NULL);
 }
 
@@ -749,8 +754,12 @@ static void native_machine_power_off(void)
 	if (pm_power_off) {
 		if (!reboot_force)
 			machine_shutdown();
+		slaunch_finalize(!reboot_force);
 		pm_power_off();
+	} else {
+		slaunch_finalize(0);
 	}
+
 	/* A fallback in case there is no PM info available */
 	tboot_shutdown(TB_SHUTDOWN_HALT);
 }
@@ -778,6 +787,7 @@ void machine_shutdown(void)
 
 void machine_emergency_restart(void)
 {
+	slaunch_finalize(0);
 	__machine_emergency_restart(1);
 }
 
-- 
1.8.3.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
