Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B273CD13F
	for <lists.iommu@lfdr.de>; Mon, 19 Jul 2021 11:54:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24A2560705;
	Mon, 19 Jul 2021 09:54:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JSAnY94sKijj; Mon, 19 Jul 2021 09:54:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 18EAC60680;
	Mon, 19 Jul 2021 09:54:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF541C001F;
	Mon, 19 Jul 2021 09:54:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04EE8C000E
 for <iommu@lists.linux-foundation.org>; Mon, 19 Jul 2021 09:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC16060659
 for <iommu@lists.linux-foundation.org>; Mon, 19 Jul 2021 09:54:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GjQ3SC8V4TbI for <iommu@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 09:54:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.wantstofly.org (hmm.wantstofly.org [213.239.204.108])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2CB060680
 for <iommu@lists.linux-foundation.org>; Mon, 19 Jul 2021 09:54:46 +0000 (UTC)
Received: by mail.wantstofly.org (Postfix, from userid 1000)
 id CF5DF7F46A; Mon, 19 Jul 2021 12:54:43 +0300 (EEST)
Date: Mon, 19 Jul 2021 12:54:43 +0300
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: iommu@lists.linux-foundation.org, Joerg Roedel <joro@8bytes.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: [PATCH,RFC] iommu/amd: Use report_iommu_fault()
Message-ID: <YPVL41ZO8Ih8WrKa@wantstofly.org>
MIME-Version: 1.0
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

This patch makes iommu/amd call report_iommu_fault() when an I/O page
fault occurs, which has two effects:

1) It allows device drivers to register a callback to be notified of
   I/O page faults, via the iommu_set_fault_handler() API.

2) It triggers the io_page_fault tracepoint in report_iommu_fault()
   when an I/O page fault occurs.

I'm mainly interested in (2).  We have a daemon with some rasdaemon-like
functionality for handling platform errors, and being able to be notified
of I/O page faults for initiating corrective action is very useful -- and
receiving such events via event tracing is a lot nicer than having to
scrape them from kmsg.

A number of other IOMMU drivers already use report_iommu_fault(), and
I/O page faults on those IOMMUs therefore already seem to trigger this
tracepoint -- but this isn't (yet) the case for AMD-Vi and Intel DMAR.

I copied the logic from the other callers of report_iommu_fault(), where
if that function returns zero, the driver will have handled the fault,
in which case we avoid logging information about the fault to the printk
buffer from the IOMMU driver.

With this patch I see io_page_fault event tracing entries as expected:

   irq/24-AMD-Vi-48    [002] ....   978.554289: io_page_fault: IOMMU:[drvname] 0000:05:00.0 iova=0x0000000091482640 flags=0x0000
   irq/24-AMD-Vi-48    [002] ....   978.554294: io_page_fault: IOMMU:[drvname] 0000:05:00.0 iova=0x0000000091482650 flags=0x0000
   irq/24-AMD-Vi-48    [002] ....   978.554299: io_page_fault: IOMMU:[drvname] 0000:05:00.0 iova=0x0000000091482660 flags=0x0000
   irq/24-AMD-Vi-48    [002] ....   978.554305: io_page_fault: IOMMU:[drvname] 0000:05:00.0 iova=0x0000000091482670 flags=0x0000
   irq/24-AMD-Vi-48    [002] ....   978.554310: io_page_fault: IOMMU:[drvname] 0000:05:00.0 iova=0x0000000091482680 flags=0x0000
   irq/24-AMD-Vi-48    [002] ....   978.554315: io_page_fault: IOMMU:[drvname] 0000:05:00.0 iova=0x00000000914826a0 flags=0x0000

For determining IOMMU_FAULT_{READ,WRITE}, I followed the AMD IOMMU
spec, but I haven't tested that bit of the code, as the page faults I
encounter are all to non-present (!EVENT_FLAG_PR) mappings, in which
case EVENT_FLAG_RW doesn't make sense.

Signed-off-by: Lennert Buytenhek <buytenh@wantstofly.org>
---
 drivers/iommu/amd/amd_iommu_types.h |    4 ++++
 drivers/iommu/amd/iommu.c           |   25 +++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/iommu/amd/amd_iommu_types.h b/drivers/iommu/amd/amd_iommu_types.h
index 94c1a7a9876d..2f2c6630c24c 100644
--- a/drivers/iommu/amd/amd_iommu_types.h
+++ b/drivers/iommu/amd/amd_iommu_types.h
@@ -138,6 +138,10 @@
 #define EVENT_DOMID_MASK_HI	0xf0000
 #define EVENT_FLAGS_MASK	0xfff
 #define EVENT_FLAGS_SHIFT	0x10
+#define EVENT_FLAG_TR		0x100
+#define EVENT_FLAG_RW		0x020
+#define EVENT_FLAG_PR		0x010
+#define EVENT_FLAG_I		0x008
 
 /* feature control bits */
 #define CONTROL_IOMMU_EN        0x00ULL
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 811a49a95d04..a02ace7ee794 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -480,6 +480,30 @@ static void amd_iommu_report_page_fault(u16 devid, u16 domain_id,
 	if (pdev)
 		dev_data = dev_iommu_priv_get(&pdev->dev);
 
+	if (dev_data) {
+		int report_flags;
+
+		/*
+		 * AMD I/O Virtualization Technology (IOMMU) Specification,
+		 * revision 3.00, section 2.5.3 ("IO_PAGE_FAULT Event") says
+		 * that the RW ("read-write") bit is only valid if the I/O
+		 * page fault was caused by a memory transaction request
+		 * referencing a page that was marked present.
+		 */
+		report_flags = 0;
+		if ((flags & (EVENT_FLAG_TR | EVENT_FLAG_PR | EVENT_FLAG_I)) ==
+								EVENT_FLAG_PR) {
+			if (flags & EVENT_FLAG_RW)
+				report_flags |= IOMMU_FAULT_WRITE;
+			else
+				report_flags |= IOMMU_FAULT_READ;
+		}
+
+		if (!report_iommu_fault(&dev_data->domain->domain,
+					&pdev->dev, address, report_flags))
+			goto out;
+	}
+
 	if (dev_data && __ratelimit(&dev_data->rs)) {
 		pci_err(pdev, "Event logged [IO_PAGE_FAULT domain=0x%04x address=0x%llx flags=0x%04x]\n",
 			domain_id, address, flags);
@@ -489,6 +513,7 @@ static void amd_iommu_report_page_fault(u16 devid, u16 domain_id,
 			domain_id, address, flags);
 	}
 
+out:
 	if (pdev)
 		pci_dev_put(pdev);
 }
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
