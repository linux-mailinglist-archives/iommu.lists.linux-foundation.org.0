Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F9F1F7F74
	for <lists.iommu@lfdr.de>; Sat, 13 Jun 2020 01:15:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7B73A899F8;
	Fri, 12 Jun 2020 23:15:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1snaeupwBvhV; Fri, 12 Jun 2020 23:15:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DD4DA89A02;
	Fri, 12 Jun 2020 23:15:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3D0CC016F;
	Fri, 12 Jun 2020 23:15:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 457B0C016F
 for <iommu@lists.linux-foundation.org>; Fri, 12 Jun 2020 23:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2CD3D88D5D
 for <iommu@lists.linux-foundation.org>; Fri, 12 Jun 2020 23:15:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1YA6B2HbSb4d for <iommu@lists.linux-foundation.org>;
 Fri, 12 Jun 2020 23:15:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 59A3388D27
 for <iommu@lists.linux-foundation.org>; Fri, 12 Jun 2020 23:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592003743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=mJF77wjfQf5PIjD3lW9RyfB0DRTR9vtehyxPDHs1NyY=;
 b=RYW8oZj6+JqWmFNSY/9XVvFrg3VVtgMn4oxk8j1oH0TCD1YnfqCxQ0ZEfYpYWAD/SNKQFF
 Wlo310lX3xWAiLatz5iiVqNVOtRuqZSbSpqYkpGpbOHbtZZk0Wc76UgH6DP41hhzCw1g4g
 emvP9WbV5jHE03D4kE6b9BVFi6UI23U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396--ZHDImbMP6qk6IUguxNq8g-1; Fri, 12 Jun 2020 19:15:39 -0400
X-MC-Unique: -ZHDImbMP6qk6IUguxNq8g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0271B464;
 Fri, 12 Jun 2020 23:15:39 +0000 (UTC)
Received: from cantor.redhat.com (ovpn-112-134.phx2.redhat.com [10.3.112.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C22405D9C5;
 Fri, 12 Jun 2020 23:15:38 +0000 (UTC)
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 0/2] iommu: Move AMD and Intel Kconfig + Makefile bits into
 their directories
Date: Fri, 12 Jun 2020 16:10:58 -0700
Message-Id: <20200612231100.293734-1-jsnitsel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

This patchset imeplements the suggestion from Linus to move the Kconfig
and Makefile bits for AMD and Intel into their respective directories.
It also cleans up a couple Kconfig entries to use the newer help
attribute instead of ---help--- (complaint from checkpatch).

Jerry Snitselaar (2):
      iommu/vt-d: Move Kconfig and Makefile bits down into intel directory
      iommu/amd: Move Kconfig and Makefile bits down into amd directory


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
