Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A727C267FE2
	for <lists.iommu@lfdr.de>; Sun, 13 Sep 2020 17:20:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C9071871EA;
	Sun, 13 Sep 2020 15:20:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TtkafPvm8mvL; Sun, 13 Sep 2020 15:20:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D5533871E1;
	Sun, 13 Sep 2020 15:20:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8096C0891;
	Sun, 13 Sep 2020 15:20:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4BB80C0051
 for <iommu@lists.linux-foundation.org>; Sun, 13 Sep 2020 12:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3A6E9869CB
 for <iommu@lists.linux-foundation.org>; Sun, 13 Sep 2020 12:42:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RAC8OcvQZbv1 for <iommu@lists.linux-foundation.org>;
 Sun, 13 Sep 2020 12:42:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 54A54869BD
 for <iommu@lists.linux-foundation.org>; Sun, 13 Sep 2020 12:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600000937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=A6XG2fJLHeDjdaV/7MOzK55rA0FpDa4k55hAmmbHojo=;
 b=aZUMtwXgmZ80DZOcvi1AoZY9+pNigFjxkLFuI7TWlS0GkmidH2mnq2GRgajpCq6LHewR2G
 uHrh1QEqXx2UIDAEqe3qjUt4kmuSLUYJuyXs8r3rpo65FMTnpgbxYtY8CyoCDsq8TqnesM
 TG56We92ktYz0N5TbYNCA93KV+ZPFsU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-dsjiyH1PPLOpul9vJsB81w-1; Sun, 13 Sep 2020 08:42:15 -0400
X-MC-Unique: dsjiyH1PPLOpul9vJsB81w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87C59185A0FC;
 Sun, 13 Sep 2020 12:42:14 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90DF827BC0;
 Sun, 13 Sep 2020 12:42:12 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] iommu/amd: fix interrupt remapping for avic
Date: Sun, 13 Sep 2020 15:42:11 +0300
Message-Id: <20200913124211.6419-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mailman-Approved-At: Sun, 13 Sep 2020 15:20:23 +0000
Cc: "open list:AMD IOMMU AMD-VI" <iommu@lists.linux-foundation.org>,
 Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>
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

Commit e52d58d54a32 ("iommu/amd: Use cmpxchg_double() when updating 128-bit IRTE")
accidentally removed an assumption that modify_irte_ga always set the valid bit
and amd_iommu_activate_guest_mode relied on that.

Side effect of this is that on my machine, VFIO based VMs with AVIC enabled
would eventually crash and show IOMMU errors like that:

AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0055 address=0xfffffffdf8000000 flags=0x0008]

Fixes: e52d58d54a321 ("iommu/amd: Use cmpxchg_double() when updating 128-bit IRTE")
Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 drivers/iommu/amd/iommu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 07ae8b93887e5..aff4cc1869356 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3853,6 +3853,7 @@ int amd_iommu_activate_guest_mode(void *data)
 	entry->hi.fields.ga_root_ptr       = ir_data->ga_root_ptr;
 	entry->hi.fields.vector            = ir_data->ga_vector;
 	entry->lo.fields_vapic.ga_tag      = ir_data->ga_tag;
+	entry->lo.fields_remap.valid = 1;
 
 	return modify_irte_ga(ir_data->irq_2_irte.devid,
 			      ir_data->irq_2_irte.index, entry, ir_data);
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
