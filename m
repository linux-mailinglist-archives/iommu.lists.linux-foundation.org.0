Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B402774E2
	for <lists.iommu@lfdr.de>; Thu, 24 Sep 2020 17:09:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F1B302E108;
	Thu, 24 Sep 2020 15:09:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r03bOv5TbgtB; Thu, 24 Sep 2020 15:09:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 19F712E12A;
	Thu, 24 Sep 2020 15:09:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 067B4C0859;
	Thu, 24 Sep 2020 15:09:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7139C0890
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 14:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D149A856B7
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 14:58:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g+0hIJ9GELkB for <iommu@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 14:58:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1B67D84F27
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 14:58:41 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08OEtG6L037473;
 Thu, 24 Sep 2020 14:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=uC5h3cusDAhwlGCCvDkY2qHUOCSMEHI64B7ZwPT8TG8=;
 b=d+wrP197JkSZeRU0ToJp4H5+e6NWuYpPGyv2FArOWMjRkndnYgJV7ORSXccE/WIUlGcH
 8hVZluIa8OQi2BUw0ncvdXwOIGC1/KIAJtueXBrq1oax/V30xNIaiTAVaH3vb0eHbilu
 7OeNlR1S76VsssfLFC3+CRjcWn8wT95rvQJ+W20OHVfNcYY21Dbknnjg4lu9rjLEpOw0
 mrPYqPjKIuWhaSqbY/f6q596YEXV20krNV+Aub72LjzSDhWxgfwI/JQfPTPQARlxJBlg
 KnMFElffySZ/plRPzlfNh+AWXmhzUBevrEFDg5hbHUB7zwGLeh9mVx9wVuvxR7KrHLEk Bw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 33q5rgq58e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 24 Sep 2020 14:58:21 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08OEuSQg126153;
 Thu, 24 Sep 2020 14:58:21 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 33nujr18ff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Sep 2020 14:58:21 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08OEwIFX000856;
 Thu, 24 Sep 2020 14:58:18 GMT
Received: from disposition.us.oracle.com (/10.152.32.81)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 24 Sep 2020 07:58:18 -0700
From: Ross Philipson <ross.philipson@oracle.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org,
 iommu@lists.linux-foundation.org, linux-integrity@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: [PATCH 12/13] reboot: Secure Launch SEXIT support on reboot paths
Date: Thu, 24 Sep 2020 10:58:40 -0400
Message-Id: <1600959521-24158-13-git-send-email-ross.philipson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1600959521-24158-1-git-send-email-ross.philipson@oracle.com>
References: <1600959521-24158-1-git-send-email-ross.philipson@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240114
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 impostorscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240114
X-Mailman-Approved-At: Thu, 24 Sep 2020 15:09:23 +0000
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
index a515e2d..90d0647 100644
--- a/arch/x86/kernel/reboot.c
+++ b/arch/x86/kernel/reboot.c
@@ -12,6 +12,7 @@
 #include <linux/delay.h>
 #include <linux/frame.h>
 #include <linux/pgtable.h>
+#include <linux/slaunch.h>
 #include <acpi/reboot.h>
 #include <asm/io.h>
 #include <asm/apic.h>
@@ -732,6 +733,7 @@ static void native_machine_restart(char *__unused)
 
 	if (!reboot_force)
 		machine_shutdown();
+	slaunch_finalize(!reboot_force);
 	__machine_emergency_restart(0);
 }
 
@@ -742,6 +744,9 @@ static void native_machine_halt(void)
 
 	tboot_shutdown(TB_SHUTDOWN_HALT);
 
+	/* SEXIT done after machine_shutdown() to meet TXT requirements */
+	slaunch_finalize(1);
+
 	stop_this_cpu(NULL);
 }
 
@@ -750,8 +755,12 @@ static void native_machine_power_off(void)
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
@@ -779,6 +788,7 @@ void machine_shutdown(void)
 
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
