Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5131B3A875F
	for <lists.iommu@lfdr.de>; Tue, 15 Jun 2021 19:16:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1BDB608DA;
	Tue, 15 Jun 2021 17:16:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HbdO79pdke73; Tue, 15 Jun 2021 17:16:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C0418608E7;
	Tue, 15 Jun 2021 17:16:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D772C0033;
	Tue, 15 Jun 2021 17:16:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1F793C001C
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 17:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DE4B40225
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 17:14:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=quicinc.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PDcqYxFgpDbg for <iommu@lists.linux-foundation.org>;
 Tue, 15 Jun 2021 17:14:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4960401FD
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 17:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1623777295; x=1655313295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=D6IUBGYQqCLcl7dcGiUkl6UUi4wbJwdxmuWA7BYn2qc=;
 b=rveO+xPu5bbveGqT7fTVVqQm4/hQjBjKfgWuNyjL+YFYGZ0gIvZLWrNV
 hQapuLmfyO/AzGcy16DxvYRfTksTQky/A1xRICegWUGs6J1jGtJ3XPJH2
 u9UyBhjFN53CZ9nz2AjfBhjRu1063qfye8otV/5HoG2ymtMrNHUTXhzF2 g=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 15 Jun 2021 10:08:50 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 15 Jun 2021 10:08:50 -0700
Received: from th-lint-040.qualcomm.com (10.80.80.8) by
 nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Tue, 15 Jun 2021 10:08:50 -0700
From: Georgi Djakov <quic_c_gdjako@quicinc.com>
To: <will@kernel.org>, <robin.murphy@arm.com>
Subject: [PATCH v6 04/15] iommu: Add a map_pages() op for IOMMU drivers
Date: Tue, 15 Jun 2021 10:08:22 -0700
Message-ID: <1623776913-390160-5-git-send-email-quic_c_gdjako@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623776913-390160-1-git-send-email-quic_c_gdjako@quicinc.com>
References: <1623776913-390160-1-git-send-email-quic_c_gdjako@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)
X-Mailman-Approved-At: Tue, 15 Jun 2021 17:16:44 +0000
Cc: isaacm@codeaurora.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, djakov@kernel.org, pratikp@codeaurora.org,
 linux-arm-kernel@lists.infradead.org
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

From: "Isaac J. Manjarres" <isaacm@codeaurora.org>

Add a callback for IOMMU drivers to provide a path for the
IOMMU framework to call into an IOMMU driver, which can
call into the io-pgtable code, to map a physically contiguous
rnage of pages of the same size.

For IOMMU drivers that do not specify a map_pages() callback,
the existing logic of mapping memory one page block at a time
will be used.

Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
Suggested-by: Will Deacon <will@kernel.org>
Acked-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Georgi Djakov <quic_c_gdjako@quicinc.com>
---
 include/linux/iommu.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 25a844121be5..d7989d4a7404 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -180,6 +180,8 @@ struct iommu_iotlb_gather {
  * @attach_dev: attach device to an iommu domain
  * @detach_dev: detach device from an iommu domain
  * @map: map a physically contiguous memory region to an iommu domain
+ * @map_pages: map a physically contiguous set of pages of the same size to
+ *             an iommu domain.
  * @unmap: unmap a physically contiguous memory region from an iommu domain
  * @unmap_pages: unmap a number of pages of the same size from an iommu domain
  * @flush_iotlb_all: Synchronously flush all hardware TLBs for this domain
@@ -230,6 +232,9 @@ struct iommu_ops {
 	void (*detach_dev)(struct iommu_domain *domain, struct device *dev);
 	int (*map)(struct iommu_domain *domain, unsigned long iova,
 		   phys_addr_t paddr, size_t size, int prot, gfp_t gfp);
+	int (*map_pages)(struct iommu_domain *domain, unsigned long iova,
+			 phys_addr_t paddr, size_t pgsize, size_t pgcount,
+			 int prot, gfp_t gfp, size_t *mapped);
 	size_t (*unmap)(struct iommu_domain *domain, unsigned long iova,
 		     size_t size, struct iommu_iotlb_gather *iotlb_gather);
 	size_t (*unmap_pages)(struct iommu_domain *domain, unsigned long iova,
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
