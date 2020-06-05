Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C85A1EF1BE
	for <lists.iommu@lfdr.de>; Fri,  5 Jun 2020 09:00:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0A4D188951;
	Fri,  5 Jun 2020 07:00:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n9rgVqqJpryK; Fri,  5 Jun 2020 07:00:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8829D88916;
	Fri,  5 Jun 2020 07:00:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7E141C016E;
	Fri,  5 Jun 2020 07:00:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6CCFFC016E
 for <iommu@lists.linux-foundation.org>; Fri,  5 Jun 2020 07:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 62A67203F1
 for <iommu@lists.linux-foundation.org>; Fri,  5 Jun 2020 07:00:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nEHuJSh2p5ar for <iommu@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 07:00:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 2435C203EC
 for <iommu@lists.linux-foundation.org>; Fri,  5 Jun 2020 07:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591340435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Psy0gAVP3y5zMhy6rzif6kvuC7aa4BFrXqt5hsHPNmU=;
 b=csFmKv47UtxgFKtlAv3PQNI5SVRrQCZ14FysUiczUL9HIKpz/sXJSw1j56Wme9gkh/mH1B
 roDTCH/9MWHYvpFk0+BimV8UbDH5xOuwItjejhXCNlT2UzBd9i4ur3vL5c5+FWU5E/n8po
 jw0T3BM3+UU1iuz33//cS9UmgbB+/kw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-y-8uuF_6NqacZfhkA2f4MA-1; Fri, 05 Jun 2020 03:00:33 -0400
X-MC-Unique: y-8uuF_6NqacZfhkA2f4MA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE469107ACCA;
 Fri,  5 Jun 2020 07:00:32 +0000 (UTC)
Received: from cantor.redhat.com (ovpn-113-227.phx2.redhat.com [10.3.113.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6665D7CCE0;
 Fri,  5 Jun 2020 07:00:32 +0000 (UTC)
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] iommu: add include/uapi/linux/iommu.h to MAINTAINERS file
Date: Fri,  5 Jun 2020 00:00:25 -0700
Message-Id: <20200605070025.216124-1-jsnitsel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>
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

When include/uapi/linux/iommu.h was created it was never
added to the file list in MAINTAINERS.

Cc: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Jerry Snitselaar <jsnitsel@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e1897ed32930..061648b6e393 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8954,6 +8954,7 @@ F:	drivers/iommu/
 F:	include/linux/iommu.h
 F:	include/linux/iova.h
 F:	include/linux/of_iommu.h
+F:	include/uapi/linux/iommu.h
 
 IO_URING
 M:	Jens Axboe <axboe@kernel.dk>
-- 
2.24.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
