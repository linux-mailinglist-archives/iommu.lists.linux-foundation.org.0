Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 25702119029
	for <lists.iommu@lfdr.de>; Tue, 10 Dec 2019 19:56:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9B28C227A3;
	Tue, 10 Dec 2019 18:56:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QmJqfHRuCsI9; Tue, 10 Dec 2019 18:56:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 82184227B1;
	Tue, 10 Dec 2019 18:56:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 77553C0881;
	Tue, 10 Dec 2019 18:56:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 110BBC1796
 for <iommu@lists.linux-foundation.org>; Tue, 10 Dec 2019 18:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EB1A7865D5
 for <iommu@lists.linux-foundation.org>; Tue, 10 Dec 2019 18:56:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2WxU2x1AU0Ph for <iommu@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 18:56:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 544D081DD7
 for <iommu@lists.linux-foundation.org>; Tue, 10 Dec 2019 18:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576004174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pKKP6PQdfmPaXtDmvgj9kKM8eTO86wVwsKrvHl8BN6w=;
 b=Lt9bz+VgMCGLl95lqjezDyKo697dZP9m4S+V+XgkdsJVauk/49MFZ0KOEN0SO+vDB4ETzq
 bivwltHAWZ8dNz7So0U4bIvXkm/MbzaSd01bRcUofo9rvlK4FhaeE53LoToYsgZCZBKfPp
 Yq1V5Gxr7S4Hp76bGqw7Uj4Rm6/olHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-i3sAJY1kNVaA7JbYMKOm9Q-1; Tue, 10 Dec 2019 13:56:10 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D7F419057B1;
 Tue, 10 Dec 2019 18:56:09 +0000 (UTC)
Received: from cantor.redhat.com (ovpn-117-41.phx2.redhat.com [10.3.117.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE6FF19C6A;
 Tue, 10 Dec 2019 18:56:08 +0000 (UTC)
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] iommu: set group default domain before creating direct
 mappings
Date: Tue, 10 Dec 2019 11:56:06 -0700
Message-Id: <20191210185606.11329-1-jsnitsel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: i3sAJY1kNVaA7JbYMKOm9Q-1
X-Mimecast-Spam-Score: 0
Cc: iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 stable@vger.kernel.org
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

iommu_group_create_direct_mappings uses group->default_domain, but
right after it is called, request_default_domain_for_dev calls
iommu_domain_free for the default domain, and sets the group default
domain to a different domain. Move the
iommu_group_create_direct_mappings call to after the group default
domain is set, so the direct mappings get associated with that domain.

Cc: Joerg Roedel <jroedel@suse.de>
Cc: Lu Baolu <baolu.lu@linux.intel.com> 
Cc: iommu@lists.linux-foundation.org
Cc: stable@vger.kernel.org
Fixes: 7423e01741dd ("iommu: Add API to request DMA domain for device")
Signed-off-by: Jerry Snitselaar <jsnitsel@redhat.com>
---
 drivers/iommu/iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index db7bfd4f2d20..fa908179b80b 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2282,13 +2282,13 @@ request_default_domain_for_dev(struct device *dev, unsigned long type)
 		goto out;
 	}
 
-	iommu_group_create_direct_mappings(group, dev);
-
 	/* Make the domain the default for this group */
 	if (group->default_domain)
 		iommu_domain_free(group->default_domain);
 	group->default_domain = domain;
 
+	iommu_group_create_direct_mappings(group, dev);
+
 	dev_info(dev, "Using iommu %s mapping\n",
 		 type == IOMMU_DOMAIN_DMA ? "dma" : "direct");
 
-- 
2.24.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
