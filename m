Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E432451CE
	for <lists.iommu@lfdr.de>; Sat, 15 Aug 2020 22:46:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3925186B71;
	Sat, 15 Aug 2020 20:46:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 78CJtvp9lGxq; Sat, 15 Aug 2020 20:46:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 196F986B4E;
	Sat, 15 Aug 2020 20:46:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC13AC004D;
	Sat, 15 Aug 2020 20:46:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9EF47C004D
 for <iommu@lists.linux-foundation.org>; Sat, 15 Aug 2020 20:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8728C86B2C
 for <iommu@lists.linux-foundation.org>; Sat, 15 Aug 2020 20:46:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R91lOuRcxWoR for <iommu@lists.linux-foundation.org>;
 Sat, 15 Aug 2020 20:46:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6B08E86B21
 for <iommu@lists.linux-foundation.org>; Sat, 15 Aug 2020 20:46:08 +0000 (UTC)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07FKVt8K183318; Sat, 15 Aug 2020 16:45:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=nq/Qbh6g/GV+dwSR5atT+MIapKj5ifxEpKJJbzLcppg=;
 b=TTaUsFka0m+l9yCqajC6P02ynlwgwBNE0csV+uGoQcnE1l4mMDDE0bfC7zfar00YfKRP
 trS/YaFY8yMWqafniM74lRpTZxeudyO7wVe0rspeWur7fqFzTEdMMDsEFoTlMvEVkYlR
 4s+1PQBKhxV8PVeA6jTpqBH4oFvJmVxDSerfZxnfF8jfeJddSyfyoiROMLbqfKTc2F7j
 JoijZFaX9ZlDr8HNog1BK9bFYzL4o6zFwuVf7eHrTRSeuaN9U9c1tzIgFSM5ti456yRe
 qjAWaZWKn4C5a+N/Y+xIHG3l4m6k4LPom+y4xjWTLNOgzkBRscQpPTPRC0iuEr3e47oe tA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32xc75b2np-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Aug 2020 16:45:59 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07FKiQuV006230;
 Sat, 15 Aug 2020 20:45:58 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 32x7b8e62w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Aug 2020 20:45:58 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07FKjvqa43516236
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 15 Aug 2020 20:45:57 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F23AABE056;
 Sat, 15 Aug 2020 20:45:56 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E781BE04F;
 Sat, 15 Aug 2020 20:45:54 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.211.150.234])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 15 Aug 2020 20:45:53 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: iommu@lists.linux-foundation.org
Subject: [PATCH] swiotlb: Allow allocating buffer anywhere in memory
Date: Sat, 15 Aug 2020 17:45:36 -0300
Message-Id: <20200815204536.663801-1-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-15_15:2020-08-14,
 2020-08-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=1 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008150159
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 linuxppc-dev@lists.ozlabs.org, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
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

POWER secure guests (i.e., guests which use the Protection Execution
Facility) need to use SWIOTLB to be able to do I/O with the hypervisor, but
they don't need the SWIOTLB memory to be in low addresses since the
hypervisor doesn't have any addressing limitation.

This solves a SWIOTLB initialization problem we are seeing in secure guests
with 128 GB of RAM: they are configured with 4 GB of crashkernel reserved
memory, which leaves no space for SWIOTLB in low addresses.

Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 arch/powerpc/mm/mem.c   |  7 ++++++-
 include/linux/swiotlb.h |  8 +++++++-
 kernel/dma/swiotlb.c    | 10 +++++++---
 3 files changed, 20 insertions(+), 5 deletions(-)

Normally I would split changes like this into one patch touching generic
code and another for the arch-specific part, but in this case I thought it
would be unneeded complexity. I can split though if people prefer it that
way.

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index c2c11eb8dcfc..13f2e3aff8b5 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -50,6 +50,7 @@
 #include <asm/swiotlb.h>
 #include <asm/rtas.h>
 #include <asm/kasan.h>
+#include <asm/svm.h>
 
 #include <mm/mmu_decl.h>
 
@@ -290,7 +291,11 @@ void __init mem_init(void)
 	 * back to to-down.
 	 */
 	memblock_set_bottom_up(true);
-	swiotlb_init(0);
+	/*
+	 * SVM guests can use the SWIOTLB wherever it is in memory,
+	 * even if not DMA-able.
+	 */
+	swiotlb_init_anywhere(0, is_secure_guest());
 #endif
 
 	high_memory = (void *) __va(max_low_pfn * PAGE_SIZE);
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 046bb94bd4d6..433f3dbb35b5 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -29,7 +29,13 @@ enum swiotlb_force {
  */
 #define IO_TLB_SHIFT 11
 
-extern void swiotlb_init(int verbose);
+void __init swiotlb_init_anywhere(int verbose, bool allocate_anywhere);
+
+static inline void swiotlb_init(int verbose)
+{
+	swiotlb_init_anywhere(verbose, false);
+}
+
 int swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose);
 extern unsigned long swiotlb_nr_tbl(void);
 unsigned long swiotlb_size_or_default(void);
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index c19379fabd20..27070aa59e34 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -244,7 +244,7 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
  * structures for the software IO TLB used to implement the DMA API.
  */
 void  __init
-swiotlb_init(int verbose)
+swiotlb_init_anywhere(int verbose, bool allocate_anywhere)
 {
 	size_t default_size = IO_TLB_DEFAULT_SIZE;
 	unsigned char *vstart;
@@ -257,8 +257,12 @@ swiotlb_init(int verbose)
 
 	bytes = io_tlb_nslabs << IO_TLB_SHIFT;
 
-	/* Get IO TLB memory from the low pages */
-	vstart = memblock_alloc_low(PAGE_ALIGN(bytes), PAGE_SIZE);
+	if (allocate_anywhere)
+		vstart = memblock_alloc(PAGE_ALIGN(bytes), PAGE_SIZE);
+	else
+		/* Get IO TLB memory from the low pages */
+		vstart = memblock_alloc_low(PAGE_ALIGN(bytes), PAGE_SIZE);
+
 	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs, verbose))
 		return;
 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
