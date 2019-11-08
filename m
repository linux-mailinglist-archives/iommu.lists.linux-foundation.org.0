Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D177F5063
	for <lists.iommu@lfdr.de>; Fri,  8 Nov 2019 16:58:26 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A839EE6D;
	Fri,  8 Nov 2019 15:58:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B7282E5A
	for <iommu@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 15:58:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 4A8D1712
	for <iommu@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 15:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573228696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding;
	bh=WVGyPRF7RXvpkN+DYqK8XkR5RcJbFrIwVJCV9hO4uQ4=;
	b=Ez6wFgyQlybj2XPiq+In3pm8HjlNfNBMceyRfTb68M07BtOyBXNiWnhwFcq5BKud43ZPr+
	2z8QqhJ6Q/QzsKGMfh5p4iF3jOliYe/tJXT/xDD9jzAHNhmAYIAzQURz9WVwWVpNJbwOQY
	lZ6hPHDZMzg6qQ/DHN6B+WcyWuEMfvg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-425-I0hVNY5rMoWygyD2R1k9xA-1; Fri, 08 Nov 2019 10:58:14 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57E2B800C72;
	Fri,  8 Nov 2019 15:58:13 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-54.ams2.redhat.com [10.36.116.54])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2EB475C1BB;
	Fri,  8 Nov 2019 15:58:08 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, joro@8bytes.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH] iommu/vt-d: Fix QI_DEV_IOTLB_PFSID and QI_DEV_EIOTLB_PFSID
	macros
Date: Fri,  8 Nov 2019 16:58:03 +0100
Message-Id: <20191108155803.15051-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: I0hVNY5rMoWygyD2R1k9xA-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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

For both PASID-based-Device-TLB Invalidate Descriptor and
Device-TLB Invalidate Descriptor, the Physical Function Source-ID
value is split according to this layout:

PFSID[3:0] is set at offset 12 and PFSID[15:4] is put at offset 52.
Fix the part laid out at offset 52.

Fixes: 0f725561e1684 ("iommu/vt-d: Add definitions for PFSID")
Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/linux/intel-iommu.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
index ed11ef594378..6d8bf4bdf240 100644
--- a/include/linux/intel-iommu.h
+++ b/include/linux/intel-iommu.h
@@ -336,7 +336,8 @@ enum {
 #define QI_DEV_IOTLB_SID(sid)	((u64)((sid) & 0xffff) << 32)
 #define QI_DEV_IOTLB_QDEP(qdep)	(((qdep) & 0x1f) << 16)
 #define QI_DEV_IOTLB_ADDR(addr)	((u64)(addr) & VTD_PAGE_MASK)
-#define QI_DEV_IOTLB_PFSID(pfsid) (((u64)(pfsid & 0xf) << 12) | ((u64)(pfsid & 0xfff) << 52))
+#define QI_DEV_IOTLB_PFSID(pfsid) (((u64)(pfsid & 0xf) << 12) | \
+				   ((u64)((pfsid >> 4) & 0xfff) << 52))
 #define QI_DEV_IOTLB_SIZE	1
 #define QI_DEV_IOTLB_MAX_INVS	32
 
@@ -360,7 +361,8 @@ enum {
 #define QI_DEV_EIOTLB_PASID(p)	(((u64)p) << 32)
 #define QI_DEV_EIOTLB_SID(sid)	((u64)((sid) & 0xffff) << 16)
 #define QI_DEV_EIOTLB_QDEP(qd)	((u64)((qd) & 0x1f) << 4)
-#define QI_DEV_EIOTLB_PFSID(pfsid) (((u64)(pfsid & 0xf) << 12) | ((u64)(pfsid & 0xfff) << 52))
+#define QI_DEV_EIOTLB_PFSID(pfsid) (((u64)(pfsid & 0xf) << 12) | \
+				    ((u64)((pfsid >> 4) & 0xfff) << 52))
 #define QI_DEV_EIOTLB_MAX_INVS	32
 
 /* Page group response descriptor QW0 */
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
