Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9694247D8
	for <lists.iommu@lfdr.de>; Wed,  6 Oct 2021 22:20:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 252168401B;
	Wed,  6 Oct 2021 20:20:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ztXv4aj2ZaG9; Wed,  6 Oct 2021 20:20:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 426FB840EF;
	Wed,  6 Oct 2021 20:20:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F703C000D;
	Wed,  6 Oct 2021 20:20:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1E74C000D
 for <iommu@lists.linux-foundation.org>; Wed,  6 Oct 2021 20:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE82160F3E
 for <iommu@lists.linux-foundation.org>; Wed,  6 Oct 2021 20:20:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ibm.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pJcEJ_Qt6t0i for <iommu@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 20:20:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD71960629
 for <iommu@lists.linux-foundation.org>; Wed,  6 Oct 2021 20:20:07 +0000 (UTC)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 196JiVUt015907; 
 Wed, 6 Oct 2021 16:20:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=M41UkCw+LRaLXHLWRVrNOY4v6ynlGS293Of0HYK1TNc=;
 b=B+U92Wp9Lxx/TOm+cfpa0qN49Mh5ikAbvqukl40su9Rj3HsyQGU1FJQEOAwJ2n51IpSq
 egMRKoVoOlaRTjC4+MxcW4UmdDVoV1KK3cOjwEYtc041t1n8psbPZ5K2Ve3Va9uscUJx
 ptyjXPgbaOFNiI9RQYJuTOY2CxnV4+gwmRtCY37uTSk09rsOfUkiRUMHb3P4aVbFxIHO
 FPAL3E5X7A2jObBY20tc0as738ga7gSUE6s+/3TCgQDDzr6rsWSuhHuKU4p+6BPS2nkY
 I3paKgsSNhWisKE8rln/0umbVqCdkoXlGGDL55G2CGCI9S4+dB/aqGbypeROX5Oq0svg eg== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bh0fdxamk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Oct 2021 16:20:03 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 196KCtwx000619;
 Wed, 6 Oct 2021 20:20:01 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 3bef2ae99b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Oct 2021 20:20:01 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 196KEc0A59900228
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Oct 2021 20:14:38 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D15F811C04C;
 Wed,  6 Oct 2021 20:19:57 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79CA111C04A;
 Wed,  6 Oct 2021 20:19:57 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  6 Oct 2021 20:19:57 +0000 (GMT)
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Christoph Hellwig <hch@lst.de>, <iommu@lists.linux-foundation.org>
Subject: [PATCH] dma-debug: fix sg checks in debug_dma_map_sg()
Date: Wed,  6 Oct 2021 22:19:43 +0200
Message-Id: <20211006201943.1272825-1-gerald.schaefer@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KRLNGAIPTo9wf9ZECrqkn06d0zY6MFB6
X-Proofpoint-ORIG-GUID: KRLNGAIPTo9wf9ZECrqkn06d0zY6MFB6
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-06_04,2021-10-06_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110060125
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>
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

The following warning occurred sporadically on s390:
DMA-API: nvme 0006:00:00.0: device driver maps memory from kernel text or rodata [addr=0000000048cc5e2f] [len=131072]
WARNING: CPU: 4 PID: 825 at kernel/dma/debug.c:1083 check_for_illegal_area+0xa8/0x138

It is a false-positive warning, due to broken logic in debug_dma_map_sg().
check_for_illegal_area() checks for overlay of sg elements with kernel text
or rodata. It is called with sg_dma_len(s) instead of s->length as
parameter. After the call to ->map_sg(), sg_dma_len() will contain the
length of possibly combined sg elements in the DMA address space, and not
the individual sg element length, which would be s->length.

The check will then use the physical start address of an sg element, and
add the DMA length for the overlap check, which could result in the false
warning, because the DMA length can be larger than the actual single sg
element length.

In addition, the call to check_for_illegal_area() happens in the iteration
over mapped_ents, which will not include all individual sg elements if
any of them were combined in ->map_sg().

Fix this by using s->length instead of sg_dma_len(s). Also put the call to
check_for_illegal_area() in a separate loop, iterating over all the
individual sg elements ("nents" instead of "mapped_ents").

While at it, as suggested by Robin Murphy, also move check_for_stack()
inside the new loop, as it is similarly concerned with validating the
individual sg elements.

Link: https://lore.kernel.org/lkml/20210705185252.4074653-1-gerald.schaefer@linux.ibm.com
Fixes: 884d05970bfb ("dma-debug: use sg_dma_len accessor")
Signed-off-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
---
 kernel/dma/debug.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
index 95445bd6eb72..d968a429f0d1 100644
--- a/kernel/dma/debug.c
+++ b/kernel/dma/debug.c
@@ -1289,6 +1289,13 @@ void debug_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	if (unlikely(dma_debug_disabled()))
 		return;
 
+	for_each_sg(sg, s, nents, i) {
+		check_for_stack(dev, sg_page(s), s->offset);
+		if (!PageHighMem(sg_page(s))) {
+			check_for_illegal_area(dev, sg_virt(s), s->length);
+		}
+	}
+
 	for_each_sg(sg, s, mapped_ents, i) {
 		entry = dma_entry_alloc();
 		if (!entry)
@@ -1304,12 +1311,6 @@ void debug_dma_map_sg(struct device *dev, struct scatterlist *sg,
 		entry->sg_call_ents   = nents;
 		entry->sg_mapped_ents = mapped_ents;
 
-		check_for_stack(dev, sg_page(s), s->offset);
-
-		if (!PageHighMem(sg_page(s))) {
-			check_for_illegal_area(dev, sg_virt(s), sg_dma_len(s));
-		}
-
 		check_sg_segment(dev, s);
 
 		add_dma_entry(entry);
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
