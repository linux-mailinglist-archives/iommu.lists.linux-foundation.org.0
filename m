Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 564D842E4E
	for <lists.iommu@lfdr.de>; Wed, 12 Jun 2019 20:06:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D710321CE;
	Wed, 12 Jun 2019 18:06:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 79816217A
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 18:04:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 16BD179
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 18:04:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7698728;
	Wed, 12 Jun 2019 11:04:13 -0700 (PDT)
Received: from ostrya.cambridge.arm.com (ostrya.cambridge.arm.com
	[10.1.196.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C4CCC3F246; 
	Wed, 12 Jun 2019 11:04:12 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
To: joro@8bytes.org
Subject: [PATCH] iommu: Add padding to struct iommu_fault
Date: Wed, 12 Jun 2019 18:59:38 +0100
Message-Id: <20190612175938.16428-1-jean-philippe.brucker@arm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190612131143.GF21613@8bytes.org>
References: <20190612131143.GF21613@8bytes.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Ease future extensions of struct iommu_fault_page_request and struct
iommu_fault_unrecoverable by adding a few bytes of padding. That way, a
new field can be added to either of these structures by simply introducing
a new flag. To extend it after the size limit is reached, a new fault
reporting structure will have to be negotiated with userspace.

With 56 bytes of padding, the total size of iommu_fault is 64 bytes and
fits in a cache line on a lot of contemporary machines, while providing 16
and 24 bytes of extension to structures iommu_fault_page_request and
iommu_fault_unrecoverable respectively.

Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
---
 include/uapi/linux/iommu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/iommu.h b/include/uapi/linux/iommu.h
index f45d8e9e59c3..fc00c5d4741b 100644
--- a/include/uapi/linux/iommu.h
+++ b/include/uapi/linux/iommu.h
@@ -105,15 +105,17 @@ struct iommu_fault_page_request {
  * @type: fault type from &enum iommu_fault_type
  * @padding: reserved for future use (should be zero)
  * @event: fault event, when @type is %IOMMU_FAULT_DMA_UNRECOV
  * @prm: Page Request message, when @type is %IOMMU_FAULT_PAGE_REQ
+ * @padding2: sets the fault size to allow for future extensions
  */
 struct iommu_fault {
 	__u32	type;
 	__u32	padding;
 	union {
 		struct iommu_fault_unrecoverable event;
 		struct iommu_fault_page_request prm;
+		__u8 padding2[56];
 	};
 };
 
 /**
-- 
2.21.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
